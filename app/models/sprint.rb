class Sprint < ApplicationRecord
  has_many :goals
  has_many :stories
  belongs_to :project
  has_many :users, through: :project

  validates :name, presence: true, length: {in: 6..20}

  def project_name
    project.name
  end
end
