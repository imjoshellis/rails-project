class Story < ApplicationRecord
  belongs_to :sprint, optional: true
  belongs_to :goal

  validates :name, presence: true, length: {in: 6..40}
  validates :description, length: {maximum: 600}
  validates :status, inclusion: {in: %w[todo doing closed], message: "%{value} is not a valid status"}
  validates :effort, inclusion: 1..10

  scope :todo, -> { where(status: "todo") }
  scope :doing, -> { where(status: "doing") }
  scope :closed, -> { where(status: "closed") }
end
