#include "ruby.h"
#include "response.h"
#include "httpTable.h"

VALUE radical_httpTable;
VALUE radical_response;

void Init_httpC()
{
   VALUE a,b,r;
   __response_ttl=INT2FIX(10);
   a=rb_define_module("Radical");
   a=rb_define_module_under(a,"HTTP");
   
   b=rb_define_class_under(a,"Table",rb_cHash);
   rb_define_singleton_method(b,"new",httpTable_new2,0);
//   rb_define_alloc_func(b,httpTable_alloc);
   rb_define_method(b,"initialize",httpTable_init,0);
   rb_define_method(b,"addMultiple",httpTable_addMultiple,2);
   rb_define_method(b,"[]",httpTable_get,1);
   rb_define_method(b,"[]=",httpTable_set,2);
   rb_define_method(b,"writeTo",httpTable_writeTo,1);
   rb_enable_super(b,"[]");
   rb_enable_super(b,"[]=");
   radical_httpTable=b;
   
   r=rb_define_class_under(a,"Response",rb_cObject);
   rb_define_attr(r,"headersSent",1,0);
   rb_define_attr(r,"jobDone",1,0);
   rb_define_attr(r,"ttl",0,1);
   rb_define_attr(r,"body",1,1);
   rb_define_attr(r,"status",1,1);
   rb_define_attr(r,"status_message",1,1);
   rb_define_attr(r,"io",1,1);
   rb_define_attr(r,"header",1,1);
   rb_define_attr(r,"proto",1,1);
   rb_define_method(r,"initialize",response_init,-1);
   rb_define_method(r,"reset",response_reset,0);
   rb_define_method(r,"sendHeaders",response_sendHeaders,0);
   rb_define_method(r,"<<",response_puts,1);
   rb_define_method(r,"flush",response_flush,0);
//   rb_define_method(r,"setCookie",response_get_ttl,0);
   rb_define_method(r,"ttl",response_get_ttl,0);
   rb_define_method(r,"close",response_close,0);
   radical_response=r;
   
}
