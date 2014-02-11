class Ability
  include CanCan::Ability

  def initialize(user)
    if user.speaker
      can [:deny_by_speaker, :start], Order,
        speaker_id: user.speaker.id, state: ['active']
      can :attach_record_to, Order,
        speaker_id: user.speaker.id, state: ['started', 'declined']
    end

    can :accept, Order,
      client_id: user.id, state: ['record_attached']

    can :decline, Order,
      client_id: user.id, state: ['record_attached'], declines_count: 0..(Order::DECLINES_LIMIT-1)

    can :reject, Order,
      client_id: user.id, state: ['record_attached'], declines_count: Order::DECLINES_LIMIT
  end
end
