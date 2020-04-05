class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: 'user_id'
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def difficulty_tests(level)
    self.tests.where(level: level)
  end

  def successful_tests_uniq_ids
    self.test_passages.successfully_completed.map(&:test_id).uniq
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
