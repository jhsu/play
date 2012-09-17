module Play
  module Views
    class Layout < Mustache
      def login
        @current_user.login
      end
    end
  end
end
