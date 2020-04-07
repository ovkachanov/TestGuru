class TestPassage < ApplicationRecord
  THRESHOLD_SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: [:create, :update]

  scope :successfully_completed, -> { where(successfully_completed: true) }

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def progress
    (self.current_question.id - 1) * 100 / questions_count
  end

  def question_number
    test.questions.index(current_question) + 1
  end

  def success_rate
    (correct_questions / test.questions.count.to_f) * 100
  end

  def successfully?
    completed? && success?
  end

  def success?
    success_rate >= THRESHOLD_SUCCESS
  end

  def completed?
    current_question.nil?
  end


  def active_time
    self.created_at + self.test.timer.seconds
  end

  def timeout?
    Time.current > active_time
  end

  def time_left
    (active_time - Time.current).to_i
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

  def questions_count
    self.test.questions.count
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end
end
