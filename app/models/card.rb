class Card < ApplicationRecord
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: ["Backlog", "Ready", "In Progress", "Completed"] }
  belongs_to :project
end
