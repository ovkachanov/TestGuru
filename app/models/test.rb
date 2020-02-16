class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  def self.sorting_tests_by_category(name)
    self.joins(:category).where(categories: { title: name}).order('tests.title DESC')
  end
end
