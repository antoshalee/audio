class Ability
  include CanCan::Ability

  def initialize(user)
    if user.speaker
      can [:deny_by_speaker, :start], Order,
        speaker_id: user.speaker.id, state: ['active']
      can :attach_record_to, Order,
        speaker_id: user.speaker.id, state: ['started']
    end

    can [:accept, :decline], Order,
      client_id: user.id, state: ['record_attached']


  end
end
