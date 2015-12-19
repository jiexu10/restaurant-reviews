class Category < ActiveRecord::Base
  has_many :restaurantcuisines
  has_many :restaurants, through: :restaurantcuisines
end
