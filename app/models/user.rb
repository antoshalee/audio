class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :speaker, dependent: :destroy
  has_many :orders, foreign_key: 'client_id' # as client
  has_many :favorites, dependent: :destroy
  has_many :favorite_speakers, through: :favorites, source: :speaker

  accepts_nested_attributes_for :speaker
  validates :login, presence: true

  mount_uploader :avatar, UserAvatarUploader

  def speaker?
    speaker.present?
  end

  def total_orders_count
    orders.not_draft.count + (speaker.present? ? speaker.orders.not_draft.count : 0)
  end

  def random_login= value
    if value == "1" || value == true
      self.login = RandomLogin.generate
    end
  end

end
