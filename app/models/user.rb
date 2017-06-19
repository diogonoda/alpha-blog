class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensivite: false },
                       length: { minimum: 3, maximum: 50 }

  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEXP }

  has_many :comments
end
