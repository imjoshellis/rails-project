class Sprint < ApplicationRecord
  has_many :goals
  has_many :stories
  belongs_to :project
  has_many :users, through: :project

  validates :name, presence: true, length: {in: 6..40}
  validate :match_project_goals

  def project_name
    project.name
  end

  private

  def match_project_goals
    return unless goals.length > 0
    goals.each do |g|
      errors.add(:goals, "must match project") unless project.goals.include?(g)
    end
  end
end
