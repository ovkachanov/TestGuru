require 'pry'
class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: [:gist, :show, :update, :result]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage), notice: t('.completed')
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    new_gist = GistQuestionService.new(question)
    request = new_gist.call
    gist_url = request[:html_url]

    if new_gist.seccuss?
      gist = current_user.gists.create(question_id: question.id, url: gist_url )
      redirect_to @test_passage, notice: t('.success', gist_url: gist_url)
    else
      redirect_to @test_passage, notice: t('.failure')
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
