require_dependency '../validators/email_validator.rb'
class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  validates :email, :presence => true,
            :uniqueness => true,
            length: { maximum: 105 },
            email: true


end
