module TChat
  
  attr_accessor :email, :password, :name

  @contacts
  @invitations_sent
  @invitations_received

  class User

    def initialize(email, password, name)
      @email = email
      @password = password
      @name = name
    end

    def is_contact?(user)

      @contacts.each do |usr|
        if usr.email == user.email
          return true
      end

      return false
    end

  end #class User

end #module TChat

