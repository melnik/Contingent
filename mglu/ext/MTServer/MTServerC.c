#include "ruby.h"
#include "mtserver.h"

VALUE radical_mtServer;
VALUE radical_logger;

void Init_MTServerC()
{
   VALUE a,b;
   a=rb_define_module("Radical");
   a=rb_define_module_under(a,"Server");
   
   b=rb_define_class_under(a,"MTServer",rb_cObject);
   rb_define_attr(b,"ssl",1,1);
   rb_define_method(b,"initialize",mtserver_init,5);
   rb_define_method(b,"workers_count",mtserver_workers_count,0);
   rb_define_method(b,"avail",mtserver_get_avail_fix,0);
   rb_define_method(b,"avail_add",mtserver_avail_add,0);
   rb_define_method(b,"avail_dec",mtserver_avail_dec,0);
   rb_define_method(b,"start",mtserver_start,1);
   radical_mtServer=b;
   
   radical_logger=rb_eval_string("Radical::Log");
   
}
