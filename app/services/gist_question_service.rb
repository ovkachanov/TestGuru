class GistQuestionService

  attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => Rails.application.credentials.github[:access_token])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    self.client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
