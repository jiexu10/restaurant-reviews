class CreateRestaurantcuisines < ActiveRecord::Migration
  def change
    create_table :restaurantcuisines do |t|
      t.belongs_to :restaurant, null: false
      t.belongs_to :category, null: false
    end
  end
end
