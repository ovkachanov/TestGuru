class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def difficulty_tests(level)
    self.tests.where(level: level)
  end
end
