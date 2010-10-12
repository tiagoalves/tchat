module TChat

  class User

    attr_accessor :email, :password, :name
    attr_accessor :contacts, :invitations_sent, :invitations_received


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
      end

      return false

    end

    def has_invited?(user)

      @invitations_sent.invitee.each do |usr|
        if usr.email == user.email
          return true
        end
      end

      return false

    end

    def has_been_invited_by?(user)

      @invitations_received.inviter.each do |usr|
        if usr.email == user.email
          return true
        end
      end

      return false

    end


  end #class User

end #module TChat

