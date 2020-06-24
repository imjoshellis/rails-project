class Story < ApplicationRecord
  belongs_to :sprint, optional: true
  belongs_to :goal

  validates :name, presence: true, length: {in: 6..20}
  validates :description, length: {maximum: 600}
  validates :status, inclusion: {in: %w[todo doing closed], message: "%{value} is not a valid status"}
  validates :effort, inclusion: 1..10
end
