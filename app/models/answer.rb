class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_awnser, -> { where(correct: true)}

  validates :body, presence: true
  validate :validate_quantity_answer, on: :create

  def validate_quantity_answer
    errors.add(:answers_count, message: "Invalid number of answers") if self.question.answers.count > 4
  end
end
