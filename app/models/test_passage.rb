class TestPassage < ApplicationRecord
  THRESHOLD_SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: [:create, :update]

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def success_rate
    (correct_questions / test.questions.count) * 100
  end

  def success?
    success_rate >= THRESHOLD_SUCCESS
  end

  def completed?
    current_question.nil?
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids != nil
  end

  def correct_answers
    current_question.answers.correct_awnser
  end

  def before_validation_set_first_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end
end
