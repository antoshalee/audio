class Ability
  include CanCan::Ability

  def initialize(user)
    if user.speaker
      can [:deny_by_speaker, :start, :ask_clarification], Order,
        speaker_id: user.speaker.id, state: %w(active clarified)
      can :attach_record, Order,
        speaker_id: user.speaker.id, state: %w(started declined)
    end

    can :clarify, Order,
      client_id: user.id, state: ['clarification_asked']

    can :accept, Order,
      client_id: user.id, state: ['record_attached']

    can :decline, Order,
      client_id: user.id, state: ['record_attached'], declines_count: 0..(Order::DECLINES_LIMIT-1)

    can :reject, Order,
      client_id: user.id, state: ['record_attached'], declines_count: Order::DECLINES_LIMIT

  end
end
