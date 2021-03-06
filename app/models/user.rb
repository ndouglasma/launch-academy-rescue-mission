class User < ApplicationRecord
  has_many :questions
  has_many :answers
  validates :name, presence: true, uniqueness: true, exclusion: { in: [nil] }
end
