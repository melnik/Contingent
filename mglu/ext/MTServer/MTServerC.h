extern VALUE radical_mtServer;
extern VALUE radical_mtWorker;
extern VALUE radical_logger;
struct MTServer
{
   struct RBasic basic;
   struct st_table *iv_tbl;
   long avail; // Idle workers
   long workers; // Total number of workers
};
#define RMTServer(obj) (R_CAST(MTServer)(obj))
