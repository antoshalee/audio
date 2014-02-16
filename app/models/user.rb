class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :speaker
  accepts_nested_attributes_for :speaker
  validates :login, presence: true

  def to_param
    login
  end

  def speaker?
    speaker.present?
  end

end
