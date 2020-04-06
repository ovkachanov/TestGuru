class BadgeIssuance

  def initialize(test_passage)
   @test_passage = test_passage
   @user = @test_passage.user
   @test = @test_passage.test
  end

  def distributor
    Badge.all.find_each do |badge|
      add_badge(badge) if self.send("passed_#{badge.rule}?", badge.parameter)
    end
  end

  def add_badge(badge)
    @user.badges << badge
  end

  private

  def passed_test_first_try?(params)
    @test_passage.successfully_completed && @user.tests.where(id: @test.id).count == 1
  end

  def passed_all_tests_level?(level)
    tests_by_level_ids = Test.where(level: level).ids
    (tests_by_level_ids - @user.successful_tests_uniq_ids).empty?
  end

  def passed_all_tests_category?(category_title)
    category_tests_ids = Category.find_by(title: category_title).tests.ids
    (category_tests_ids - @user.successful_tests_uniq_ids).empty?
  end
end
