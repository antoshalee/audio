class Ability
  include CanCan::Ability

  def initialize(user)
    if user.speaker
      can [:deny_by_speaker, :accept_by_speaker], Order,
        speaker_id: user.speaker.id, state: ['active']
    end
  end
end