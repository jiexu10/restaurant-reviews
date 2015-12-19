class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :body, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (1..5), message: "Must be between 1 - 5"}
  def parse_create_date
    "#{created_at.strftime("%B %d %Y")}"
  end
end
