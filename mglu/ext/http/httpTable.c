#include "st.h"
#include "ruby.h"
#include "rubysig.h"
#include "httpC.h"

const char*  __httpTable_servername="Radical/0.6";



VALUE httpTable_init(VALUE self)
{
   VALUE arr;
   
   arr=rb_ary_new();
   rb_iv_set(self,"@multiple",arr);
   return self;
}

VALUE httpTable_alloc(void)
{
   VALUE t;
   t=rb_hash_new();
   RBASIC(t)->klass=radical_httpTable;
   return t;
}

VALUE httpTable_new(void)
{
   VALUE t;
   t=httpTable_alloc();
   t=httpTable_init(t);
   return t;
}

VALUE httpTable_new2(VALUE self)
{
   VALUE t;
   t=httpTable_alloc();
   t=httpTable_init(t);
   return t;
}


VALUE httpTable_addMultiple(VALUE self,VALUE key,VALUE val)
{
   VALUE arr;
   arr=rb_iv_get(self,"@multiple");
   return rb_funcall(arr,rb_intern("push"),1,rb_ary_new3(2,key,val));
}

VALUE httpTable_get(VALUE self,VALUE key)
{
   return rb_hash_aref(self,rb_funcall(key,rb_intern("capitalize"),0));
}

VALUE httpTable_set(VALUE self,VALUE key,VALUE val)
{
   return rb_hash_aset(self,rb_funcall(key,rb_intern("capitalize"),0),val);
}


static int httpTable__iterate(VALUE key,VALUE value, VALUE port)
{
   char *str;
   if (TYPE(value)!=T_STRING)
     {
	value=rb_funcall(value,rb_intern("to_s"),0);
     }
   str=malloc(RSTRING(key)->len+RSTRING(value)->len+10);
   str=strcpy(str,RSTRING(key)->ptr);
   str=strcat(str,": ");
   str=strcat(str,RSTRING(value)->ptr);
   str=strcat(str,"\r\n");
   rb_funcall(port,rb_intern("<<"),1,rb_str_new2(str));
   free(str);
 
   return 0;
}

VALUE httpTable_writeTo(VALUE self,VALUE port)
{
   VALUE arr;
   VALUE *a;
   int c;
   st_foreach(RHASH(self)->tbl,&httpTable__iterate,port);
   arr=rb_iv_get(self,"@multiple");
   for (c=0;c<RARRAY(arr)->len;++c)
     {
	a=RARRAY(RARRAY(arr)->ptr[c])->ptr;
	httpTable__iterate(RARRAY(a[0]),RARRAY(a[1]),port);
     }
   return port;
}


