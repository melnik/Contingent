
extern VALUE mtserver_init(VALUE self,VALUE port,VALUE host,VALUE minWorkers,VALUE maxWorkers,VALUE tempWorkers);
extern VALUE mtserver_accept(VALUE self);
extern VALUE mtserver_workers_count(VALUE self);
extern VALUE mtserver_get_avail(VALUE self);
extern VALUE mtserver_get_avail_fix(VALUE self);
extern VALUE mtserver_avail_dec(VALUE self);
extern VALUE mtserver_avail_add(VALUE self);
extern VALUE mtserver_start(VALUE self);
extern int __mtserver_avail;

