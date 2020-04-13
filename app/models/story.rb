class Story < ApplicationRecord
  belongs_to :sprint, optional: true
  belongs_to :goal
end
