class Goal < ApplicationRecord
  belongs_to :project
  belongs_to :sprint, optional: true

  validates :name, presence: true, length: {in: 6..20}
  validates :description, length: {maximum: 600}
end
