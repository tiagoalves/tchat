module TChat
  
  attr_accessor :inviter, :invitee  #users
  attr_accessor :status

  class Invitation

    def initialize(inviter, invitee)
      @inviter = inviter
      @invitee = invitee
    end

  end #class Invitation

end #module TChat

