module AnswersHelper
  def friendly_output(answer)
    if answer.correct
      'Правильный ответ'
    else
      'Неправильный ответ'
    end
  end
end
