class OrderDecorator < Draper::Decorator
  delegate_all

  # "18:32, 20 июля"
  def created_at_short
    I18n.l(created_at, format: "%H:%M, %d %B")
  end

end
