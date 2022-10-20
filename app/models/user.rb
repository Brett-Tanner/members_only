class User < ApplicationRecord
  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, format: {with: /[a-zA-Z0-9]+/, message: "only alphanumeric characters"}
  validates :name, length: {minimum: 2}
end
