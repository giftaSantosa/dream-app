class Dream < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user

  before_validation :set_default_date, on: :create
  validates :input, presence: true
  validates :date, presence: true
  validates :mood, presence: true

  private

  def set_default_date
    self.date ||= Date.yesterday
  end
end
