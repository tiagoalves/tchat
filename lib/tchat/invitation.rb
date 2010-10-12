module TChat
  
  class Invitation

    attr_accessor :inviter, :invitee
    attr_writer :status

    def initialize(inviter, invitee)
      @inviter = inviter
      @invitee = invitee
    end

  end #class Invitation

end #module TChat

