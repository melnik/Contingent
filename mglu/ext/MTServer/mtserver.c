#include "ruby.h"
#include "rubysig.h"
#include <sys/time.h>
#include "MTServerC.h"

VALUE mtserver_alloc(void)
{
   NEWOBJ(mts,struct MTServer);
   OBJSETUP(mts,radical_mtServer,T_OBJECT);
   mts->workers=0;
   mts->avail=0;
   return (VALUE)mts;
}

VALUE mtserver_init(VALUE self,VALUE port,VALUE host,VALUE minWorkers,VALUE maxWorkers,VALUE tempWorkers)
{
   rb_iv_set(self,"@autoclose",Qtrue);
   rb_iv_set(self,"@avail",INT2FIX(0));
   rb_iv_set(self,"@tcpServerThread",Qnil);
   rb_iv_set(self,"@port",port);
   rb_iv_set(self,"@host",host);
   rb_iv_set(self,"@workers",rb_ary_new());
   rb_iv_set(self,"@sockets",rb_ary_new());
   rb_iv_set(self,"@minWorkers",rb_funcall(minWorkers,rb_intern("to_i"),0));
   rb_iv_set(self,"@maxWorkers",rb_funcall(maxWorkers,rb_intern("to_i"),0));
   rb_iv_set(self,"@tempWorkers",rb_funcall(tempWorkers,rb_intern("to_i"),0));
   return self;
}

/* Returns the number of total workers as fixnum */
VALUE mtserver_workers_count(VALUE self)
{
   return INT2FIX(RMTServer(self)->workers);
}

/* Returns the number of idle workers */
VALUE mtserver_get_avail(VALUE self)
{
   return RMTServer(self)->avail;
}

/* Returns the number of idle workers as fixnum */
VALUE mtserver_get_avail_fix(VALUE self)
{
   return INT2FIX(mtserver_get_avail(self));
}

VALUE mtserver_avail_dec(VALUE self)
{
   --RMTServer(self)->avail;
   return Qtrue;
}

VALUE mtserver_avail_add(VALUE self)
{
   ++RMTServer(self)->avail;
   return Qtrue;
}

/* Sits on the queue, deals with new connections*/
VALUE mtserver_fetcher_thread(VALUE self)
{
   struct timeval delay,s_delay;
   int loops=80;
   VALUE socket;
   VALUE sockets=rb_iv_get(self,"@sockets");
   delay.tv_usec=250000;
   s_delay.tv_usec=500;
   mtserver_avail_add(self);
   ++RMTServer(self)->workers;
   while (loops>0)
     {
	socket=rb_ary_shift(sockets);
	if (socket!=Qnil) 
	  {
	     mtserver_avail_dec(self);
	     if (rb_iv_get(self,"@ssl")==Qnil)
	       {		  
		  rb_funcall(self,rb_intern("_serve"),1,socket);
	       }
	     else
	       {		  
		  rb_funcall(self,rb_intern("_servessl"),1,socket);
	       }	       
	     mtserver_avail_add(self);
	  }
	else
	  {	     
	     if (RMTServer(self)->avail>1) 
	       {
		  rb_thread_wait_for(delay);
		  --loops;
	       }
	     else
	       {
		  rb_thread_wait_for(s_delay);
	       }     
	  }
     }
   mtserver_avail_dec(self);
   --RMTServer(self)->workers;
//   printf("-Thread\n");
   return Qtrue;
	     

}

/* This thread constantly listens to the socket server, and moves connections to the queue */
VALUE mtserver_socket_reader_thread(VALUE self)
{
   VALUE server=rb_iv_get(self,"@tcpServer");
   VALUE sockets=rb_iv_get(self,"@sockets");
   ID accept=rb_intern("accept");
   while (1)
     {
	VALUE socket;
	socket=rb_funcall(server,accept,0);
	rb_ary_push(sockets,socket);
     }
   return Qtrue;
}


/* This thread constantly monitors the connection queue, launching new fetcher threads as
 * needed */
VALUE mtserver_monitor_thread(VALUE self)
{
   struct timeval delay;
   VALUE sockets=rb_iv_get(self,"@sockets");
   delay.tv_usec=1000000;
   while (1)
     {
	if (mtserver_get_avail(self)*2<RARRAY(sockets)->len)
	  {
	     if (RMTServer(self)->workers<FIX2INT(rb_iv_get(self,"@maxWorkers")))
	       {		    
		  rb_thread_create(mtserver_fetcher_thread,(void *)self);
	       }
		 
//	     printf("Add\n");
	  }
	
	rb_thread_wait_for(delay);
	
     }
   return Qtrue;
}

VALUE mtserver_start(VALUE self,VALUE ssl)
{
   rb_iv_set(self,"@shutdown",Qfalse);
   if(ssl!=Qnil) rb_iv_set(self,"@ssl",ssl);
   rb_funcall(self,rb_intern("_start"),0);
   rb_iv_set(self,"@socket_reader__thread",rb_thread_create(mtserver_socket_reader_thread,(void *) self));
   rb_iv_set(self,"@monitor_thread",rb_thread_create(mtserver_monitor_thread,(void *) self));
//   rb_funcall(rb_iv_get(self,"@run_thread"),rb_intern("priority="),1,INT2FIX(10));
   return self;
}

