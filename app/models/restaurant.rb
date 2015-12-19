class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :restaurantcuisines
  has_many :categories, through: :restaurantcuisines

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }, numericality: true

  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end

  def show_categories
    array = []
    categories.each do |category|
      array << category.name
    end
    array.join(', ')
  end
end
