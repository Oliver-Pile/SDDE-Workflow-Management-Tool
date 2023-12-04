class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable

  has_and_belongs_to_many :cards       

  validates :username, uniqueness: true, presence: true, format: { without: /[\W_]/ }

end
