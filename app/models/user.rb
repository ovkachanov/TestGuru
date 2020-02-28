class User < ApplicationRecord
  has_and_belongs_to_many :tests

  validates :name, :email, presence: true

  def difficulty_tests(level)
    self.tests.where(level: level)
  end
end
