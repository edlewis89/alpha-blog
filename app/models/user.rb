require_dependency '../validators/email_validator.rb'
class User < ApplicationRecord

  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  validates :email, :presence => true,
            :uniqueness => true,
            length: { maximum: 105 },
            email: true
  has_many :articles

end
