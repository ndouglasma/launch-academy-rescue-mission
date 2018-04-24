class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :title, presence: true, uniqueness: true, exclusion: { in: [nil] }, length: { minimum: 20 }
  validates :description, presence: true, exclusion: { in: [nil] }, length: { minimum: 50 }
end
