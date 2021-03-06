class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true

  scope :easy_test, -> { where(level: 0..1) }
  scope :middle_test, -> { where(level: 2..4) }
  scope :hard_test, -> { where(level: 5..Float::INFINITY) }
  scope :sorting_tests_by_category, -> (name) { joins(:category).where(categories: { title: name}) }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :title, presence: true, uniqueness: { scope: :level }

  def self.by_title(title)
    sorting_tests_by_category(title).order(title: :desc).pluck(:title)
  end

  def have_timer?
    timer.positive?
  end
end
