class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :detail, presence: true, exclusion: { in: [nil] }, length: { minimum: 50 }
  validates :best_answer, inclusion: { in: [true, false] }, exclusion: { in: [nil] }
end
