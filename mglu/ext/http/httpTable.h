extern const char*  __httpTable_servername;
extern VALUE httpTable_new(void);
extern VALUE httpTable_new2(VALUE self);
extern VALUE httpTable_alloc(void);
extern VALUE httpTable_init(VALUE self);
extern VALUE httpTable_addMultiple(VALUE self,VALUE key,VALUE val);
extern VALUE httpTable_get(VALUE self,VALUE key);
extern VALUE httpTable_set(VALUE self,VALUE key,VALUE val);
extern int httpTable__iterate(VALUE key,VALUE value, VALUE port);
extern VALUE httpTable_writeTo(VALUE self,VALUE port);

