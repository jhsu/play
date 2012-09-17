module Play
  class User
    attr_accessor :login, :email

    def self.create(login, email)
      new(login, email)
    end

    def self.find(login)
      new login
    end

    def initialize(login, email=nil)
      @login = login
      @email = email
    end

    # Songs the user has starred
    def stars
      []
    end

  end
end
