class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  scope :correct_awnser, -> { where(correct: true)}

  validates :body, presence: true
  validate :validate_quantity_answer

  def validate_quantity_answer
    errors.add(:answers_count, message: "Invalid number of answers") self.answers.count < 1 || self.answers.count > 4
  end
end
