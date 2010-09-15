module RPortal
   class Auth < Radical::Auth::AuthSource
      def initialize(sql)
	 @sql=sql
      end
      
      def auth(realm,user,password)
	 @sql.validateUser(user,password)
      end
   end
end
