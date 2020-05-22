class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { minimum:3, maximum: 15 },
            uniqueness: { case_sensitive: false }

  has_many :messages

  def appear
    self.update(online: true)
    ActionCable.server.broadcast "appearence_channel", {event: 'appear', nickname: self.nickname}
  end

  def away
    self.update(online: false)
    ActionCable.server.broadcast "appearence_channel", {event: 'away', nickname: self.nickname}
  end
end
