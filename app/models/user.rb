class User < ApplicationRecord
  has_many :tests

  def difficulty_tests(level)
    self.tests.where(level: level)
  end
end
