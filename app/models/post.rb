class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  validate :click_baity

  def click_baity
    clickbait_words = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    if title.nil? || !clickbait_words.any? { |word| title.include?(word) }
      errors.add(:title, "not clickbait-y enough!")
    end
  end
end
