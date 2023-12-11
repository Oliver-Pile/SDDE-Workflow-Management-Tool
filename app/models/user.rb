class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :rememberable, :validatable, :registerable
  
  VALID_ROLE = ["Operator", "Observer", "Admin"]

  has_and_belongs_to_many :cards       

  validates :username, uniqueness: true, presence: true, format: { without: /[\W_]/ }
  validates :role, presence: true, inclusion: { in: VALID_ROLE}

  def self.valid_roles
    VALID_ROLE
  end

end
