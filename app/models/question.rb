class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_quantity_answer
end
