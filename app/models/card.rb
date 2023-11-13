class Card < ApplicationRecord
  VALID_CARD_STATUS = ["Backlog", "Ready", "In Progress", "Completed"]
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: VALID_CARD_STATUS}
  belongs_to :project

  def self.valid_status 
    VALID_CARD_STATUS
  end
end
