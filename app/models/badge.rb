class Badge < ApplicationRecord

  BADGES_NAMES = { 'С первой попытки' => :test_first_try ,
                   'Все тесты категории' => :all_tests_category,
                   'Все тесты уровня' => :all_tests_level
                 }.freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :rule, presence: true

  before_save :set_image

  private

  def set_image
    self.image = "/images/badge.jpg" if image.blank?
  end
end
