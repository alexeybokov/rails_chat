class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  scope :recently_ten_messages, -> { order(:created_at).last(10) }
end
