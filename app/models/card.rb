class Card < ApplicationRecord
  VALID_CARD_STATUS = ["Backlog", "Ready", "In Progress", "Completed"]
  validates :content, presence: true
  validates :status, presence: true, inclusion: { in: VALID_CARD_STATUS}
  belongs_to :project
  has_and_belongs_to_many :users

  def self.valid_status 
    VALID_CARD_STATUS
  end

  def user_names
    users.pluck(:username).join(', ')
  end
end
