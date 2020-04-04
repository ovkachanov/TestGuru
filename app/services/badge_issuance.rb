class BadgeIssuance

  def initialize(test_passage)
   @test_passage = test_passage
   @user = @test_passage.user
   @test = @test_passage.test
  end

  def distributor
    Badge.all.each do |badge|
      case badge.rule
      when 'test_first_try'
        add_badge(badge) if passed_first_time?
      when 'all_tests_category'
        add_badge(badge) if passed_all_tests_with_category?(badge.parameter)
      when 'all_tests_level'
        add_badge(badge) if passed_all_tests_with_level?(badge.parameter.to_i)
      end
    end
  end

  def add_badge(badge)
    @user.badges << badge
  end

  private

  def passed_first_time?
    @test_passage.successfully? && @user.tests.where(id: @test.id).count == 1
  end

  def passed_all_tests_with_level?(level)
    tests_by_level_ids = Test.where(level: level).ids
    (tests_by_level_ids - @user.successful_tests_uniq_ids).empty?
  end

  def passed_all_tests_with_category?(category_title)
    category_tests_ids = Category.find_by(title: category_title).tests.ids
    (category_tests_ids - @user.successful_tests_uniq_ids).empty?
  end
end
