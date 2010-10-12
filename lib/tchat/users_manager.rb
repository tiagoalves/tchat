module TChat

  class UsersManager

    @users = nil
    @users_signedin = nil

    def initialize
      @users = {}
      @users_signedin = {}
    end

    def get_user(email)
      @users[email]
    end

    def email_registered?(email)
      @users.has_key?(email)
    end

    def user_signedin?(user)
      @users_signedin.has_key?(user.email)
    end

    def user_register(user)
      @users[user.email] = user
    end

    def user_signin(user)
      @users_signedin[user.email] = user
    end

    def user_signout(user)
      @users_signedin.delete(user.email)
    end

  end # class UsersManager
  
end # module TChat
