class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true

  def difficulty_tests(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
