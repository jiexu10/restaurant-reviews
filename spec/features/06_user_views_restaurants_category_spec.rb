# As a user
# I want to see the restaurants belonging to a category
# So that I can pick a restaurant for a specific category
# Acceptance Criteria
#
# I should see the name of the category at the top of the page.
# I should see the name of all restaurants that belong to this category.
# I should be taken to restaurant's details page if I click on the name of a restaurant while on this page.
# I should get to this page by clicking on the name of a category while on the page with the names of all the categories.

require 'rails_helper'

feature "visitors can view restaurants in a category" do
  scenario "navigate to category restaurants page" do
    thai = Category.create(name: 'Thai')
    chinese = Category.create(name: 'Chinese')

    dumpling_king = Restaurant.create(name: 'Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')
    otherdumpking = Restaurant.create(name: 'Other Dumpling King', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')

    Restaurantcuisine.create(restaurant: dumpling_king, category: chinese)
    Restaurantcuisine.create(restaurant: otherdumpking, category: chinese)

    visit restaurants_path

    click_link "Categories"

    click_link chinese.name

    expect(page).to have_content(chinese.name)
    expect(page).to have_content(dumpling_king.name)
    expect(page).to have_content(otherdumpking.name)

    click_link dumpling_king.name

    expect(current_path).to eq(restaurant_path(dumpling_king))
  end
end
