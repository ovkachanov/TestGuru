class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: [:index, :update_inline]
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start, :update_inline]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path, notice: t('.success')
    else
      render 'new'
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.success')
    else
      render 'edit'
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render 'index'
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
