class Lesson < ApplicationRecord
  validates :user_id, presence: true
  validates :category_id, presence: true
 
  belongs_to :user
  belongs_to :category

  has_many :answers, foreign_key: "lesson_id", dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers
  has_many :activities, as: :action, dependent: :destroy







end
