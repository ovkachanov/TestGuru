module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit '#{question.body}' Question"
    else
      "Create New 'Test Title' Question"
    end
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Test-Guru', "https://github.com/#{author}/#{repo}"
  end
end
