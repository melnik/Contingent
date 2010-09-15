#include "ruby.h"
#include "httpC.h"
#include "httpTable.h"
VALUE __response_ttl;

VALUE response_init(int argc,VALUE *argv,VALUE self)
{
   VALUE status;
   VALUE port;
   VALUE keepAlive;
   VALUE is_cgi;
   
   if (argc==0)
     {
	// Fixme: Raise exception
     }
   status=argv[0];
   if (argc>1)
     {
	port=argv[1];
     }
   else
     {
	port=Qnil;
     }
   if (argc>2)
     {
	keepAlive=argv[2];
     }
   else
     {
	keepAlive=Qtrue;
     }
   if (argc>3)
     {
	is_cgi=argv[3];
     }
   else
     {
	is_cgi=Qfalse;
     }
   rb_iv_set(self,"@status_message",rb_str_new2(""));
   rb_iv_set(self,"@proto",rb_str_new2("HTTP/1.1"));
   rb_iv_set(self,"@keepAlive",keepAlive);
   rb_iv_set(self,"@is_cgi",is_cgi);
   rb_iv_set(self,"@jobDone",Qfalse);
   rb_iv_set(self,"@headersSent",Qfalse);
   rb_iv_set(self,"@io",port);
   rb_iv_set(self,"@body",rb_str_new("",0));
   rb_iv_set(self,"@status",status);
   rb_iv_set(self,"@header",httpTable_new());
   return self;
}

VALUE response_reset(VALUE self)
{
   rb_iv_set(self,"@headersSent",Qfalse);
   return rb_iv_set(self,"@jobDone",Qfalse);
}

VALUE response_sendHeaders(VALUE self)
{
   VALUE buf;
   VALUE header;
   VALUE proto,status,statusm,is_cgi;

   if (rb_iv_get(self,"@headersSent")==Qtrue) return Qfalse;
   header=rb_iv_get(self,"@header");
   proto=rb_iv_get(self,"@proto");
   is_cgi=rb_iv_get(self,"@is_cgi");
   status=rb_funcall(rb_iv_get(self,"@status"),rb_intern("to_s"),0);
   statusm=rb_iv_get(self,"@status_message");

   buf=rb_str_new2("");
   if (is_cgi==Qfalse)
     {	
	buf=rb_str_append(buf,proto);
	buf=rb_str_cat2(buf," ");
	buf=rb_str_append(buf,status);
	buf=rb_str_cat2(buf," ");
	buf=rb_str_append(buf,statusm);
	buf=rb_str_cat2(buf,"\r\n");
     }
   else
     {
	buf=rb_str_cat2(buf,"Status: ");
	buf=rb_str_append(buf,status);
	buf=rb_str_cat2(buf," ");
	buf=rb_str_append(buf,statusm);
	buf=rb_str_cat2(buf,"\r\n");
     }
   
   rb_hash_aset(header,rb_str_new2("Server"),rb_str_new2(__httpTable_servername));
   if (rb_iv_get(self,"@keepAlive")==Qtrue)
     {
	rb_hash_aset(header,rb_str_new2("Connection"),rb_str_new2("Keep-Alive"));
     }
   else
     {
	rb_hash_aset(header,rb_str_new2("Connection"),rb_str_new2("close"));
     }
	
	rb_hash_aset(header,rb_str_new2("Date"),RSTRING(rb_funcall
							(rb_funcall
							 (
							  rb_funcall(rb_cTime,rb_intern("now"),0),
							  rb_intern("gmtime"),
							  0)								   
							 ,rb_intern("strftime"),
							 1,
							 rb_str_new2("%a, %d %b %Y %H:%M:%S GMT")
							 )
							));
	buf=httpTable_writeTo(header,buf);
   rb_str_cat2(buf,"\r\n");
   rb_funcall(rb_iv_get(self,"@io"),rb_intern("syswrite"),1,buf);
   rb_iv_set(self,"@headerSent",Qtrue);
   return Qtrue;
}

VALUE response_puts(VALUE self,VALUE data)
{
   if (rb_iv_get(self,"@headerSent")==Qtrue)
     {
	return rb_funcall(rb_iv_get(self,"@io"),rb_intern("syswrite"),1,data);
     }
   else
     {
	return rb_funcall(rb_iv_get(self,"@body"),rb_intern("<<"),1,data);
     }
}

VALUE response_flush(VALUE self)
{
   return Qtrue;
//   return rb_funcall(irb_iv_get(self,"@io"),rb_intern("flush"),0);
}

/*
VALUE response_setCookie(VALUE self,VALUE key,VALUE val)
{
   VALUE header;
   header=rb_iv_get(self,"@header");
   return httpTable_addMultiple(header,key,val);
}
*/

VALUE response_get_ttl(VALUE self)
{
   VALUE ttl;
   ttl=rb_iv_get(self,"@ttl");
   if (ttl==Qnil)
     {
	return __response_ttl;
     }
   else
     {
	return ttl;
     }
}

VALUE response_close(VALUE self)
{
   VALUE io;
   io=rb_iv_get(self,"@io");
//   rb_funcall(io,rb_intern("flush"),0);
   if (rb_iv_get(self,"@keepAlive")!=Qtrue) rb_funcall(io,rb_intern("close"),0);
   return rb_iv_set(self,"@jobDone",Qtrue);
}
