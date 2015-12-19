# As a user
# I want to see the categories that a restaurant belongs to
# So that I know the different kinds of cuisine that the restaurant serves
# Acceptance Criteria
#
# On the page for a restaurant's details, I should see all the categories that a restaurant belongs to.
# Clicking on the name of a category should take me to the page with the list of all the restaurants for that particular category.

require 'rails_helper'

feature "visitors can see restaurant categories" do
  scenario "navigate to restaurant show page" do
    chinese = Category.create(name: 'Chinese')
    pizza = Category.create(name: 'Pizza')

    dumpling_king_and_pizza = Restaurant.create(name: 'Dumpling King And Pizza', address: '33 Harrison Ave', city: 'Boston', state: 'MA', zip: '02111')

    Restaurantcuisine.create(restaurant: dumpling_king_and_pizza, category: chinese)
    Restaurantcuisine.create(restaurant: dumpling_king_and_pizza, category: pizza)

    visit restaurants_path

    click_link dumpling_king_and_pizza.name

    expect(page).to have_content(dumpling_king_and_pizza.name)
    expect(page).to have_content(chinese.name)
    expect(page).to have_content(pizza.name)
  end
end
