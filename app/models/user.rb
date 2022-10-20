class User < ApplicationRecord

  validates :name, :password, :password_confirmation, :email, :email_confirmation, presence: true
  validates :name, :email, uniqueness: true
  validates :password, :email, confirmation: true

  validates :name, format: {with: /[a-zA-Z0-9]+/, message: "only alphanumeric characters"}
  validates :name, length: {minimum: 2}

  validates :password, format: {with: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/, message: "must contain uppercase, lowercase and a number", multiline: true}
  validates :password, length: {minimum: 8}
end
