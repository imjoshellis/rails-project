class Goal < ApplicationRecord
  belongs_to :project
  belongs_to :sprint, optional: true

  validates :name, presence: true, length: {in: 6..40}
  validates :description, length: {maximum: 600}
  validate :match_project_goals

  def project_name
    project.name
  end

  private

  def match_project_goals
    return unless sprint
    errors.add(:sprint, "must match project") unless project.sprints.include?(sprints)
  end
end
