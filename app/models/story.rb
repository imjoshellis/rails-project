class Story < ApplicationRecord
  belongs_to :sprint
  belongs_to :goal
end
