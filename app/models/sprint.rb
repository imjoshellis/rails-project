class Sprint < ApplicationRecord
  has_many :goals
  has_many :issues
  belongs_to :project
  has_many :users, through: :project
end
