class Project < ApplicationRecord
  validates :title, presence: true,
                   uniqueness: true,
                   length: { maximum: 128 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :department, presence: true
end
