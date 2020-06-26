class Goal < ApplicationRecord
  belongs_to :project
  belongs_to :sprint, optional: true
  has_many :stories

  validates :name, presence: true, length: {in: 6..20}
  validates :description, length: {maximum: 600}

  def project_name
    project.name
  end
end
