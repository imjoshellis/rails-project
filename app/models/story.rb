class Story < ApplicationRecord
  belongs_to :sprint
  belongs_to :project, through => :sprint
end
