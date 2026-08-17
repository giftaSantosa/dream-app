class Message < ApplicationRecord
  belongs_to :dream

  validates :content, presence: true
  validates :role, presence: true
end
