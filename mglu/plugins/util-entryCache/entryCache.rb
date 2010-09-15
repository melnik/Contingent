

module Util
   
   # EntryCache is Hash limited in it's size, when it reaches @maxsize certain
   # entries are flushed - which one is determined by the algorithms defined
   # in the sub-modules, by default LAFO is used
   class EntryCache < Hash
      DEFAULT_SIZE=20
      
      module Flush
	 ONE=0
	 FIVE=1
	 TENTH=2
	 QUATER=3
	 HALF=4
	 FULL=5
      end
      
      def initialize(size=DEFAULT_SIZE,flush=Flush::ONE,mode=EntryCache::LAFO)
	 @maxsize=size
	 case flush
	 when Flush::ONE
	    @flush=1
	 when Flush::FIVE
	    @flush=5
	 when Flush::TENTH
	    @flush=0.1
	 when Flush::QUATER
	    @flush=0.25
	 when Flush::HALF
	    @flush=0.5
	 when Flush::FULL
	    @flush=1.0
	 end
	 self.extend(mode)
	 extend_mode
	 super()
      end
      
      def []=(key,value)
	 if length>=@maxsize then
	    if @flush.class==Fixnum
	       1.upto(@flush) { cache_full }
	    else
	       1.upto((length*@flush).round) { cache_full }
	    end
	 end
	 super
      end
      
      # Overriden by mode modules, called after doing the mix-in
      def extend_mode()
      end
      
      # Overriden by mode modules, called when the cache is full
      def cache_full()
      end
      
      # FIFO stands of course for First-In-First-Out, in this mode key insertion
      # order is kept in an array, when the cache is full the oldest entry is removed
      module FIFO
	 
	 def extend_mode
	    @keys=[]
	 end
	 
	 def cache_full()
	    delete(@keys.shift)
	 end
	 
	 def []=(key,value)
	    ret=super
	    @keys << key
	    ret
	 end
      end
      
      # Quick&Dirty flushing, delete the top of the array returned from Hash#keys
      module QAD
	 def cache_full()
	    delete(keys.pop)
	 end
      end
      
      # LIFO stands of course for Last-In-First-Out, in this mode key insertion
      # order is kept in an array, when the cache is full the most recent entry is removed
      module LIFO
	 
	 def extend_mode
	    @keys=[]
	 end
	 
	 def cache_full()
	    delete(@keys.pop)
	 end
	 
	 def []=(key,value)
	    ret=super
	    @keys << key
	    ret
	 end
      end
      # LAFO - Least-Accessed-First-Out, in this mode value fetching order is
      # tracked, so when items needs to be flushed it shall be the least accessed items
      module LAFO
	 
	 def extend_mode
	    @keys=[]
	 end
	 
	 def cache_full()
	    delete(@keys.shift)
	 end
	 
	 def []=(key,value)
	    ret=super
	    @keys << key
	    ret
	 end
	 
	 def [](key)
	    @keys.delete(key)
	    @keys << key
	    super(key)
	 end
	 
	 
      end
      
      
   end
   
   
end	       
