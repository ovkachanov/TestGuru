class Test < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def self.sorting_tests_by_category(name)
    self.joins(:category).where(categories: { title: name}).order('tests.title DESC')
  end
end
