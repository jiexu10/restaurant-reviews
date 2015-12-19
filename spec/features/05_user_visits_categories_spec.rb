# As a user
# I want to see categories of restaurants (e.g. *thai*, *italian*, *chinese*)
# So that I can see the different kinds of foods I could eat
# Acceptance Criteria
#
# I should see the name of all categories.
# I should get to this page by clicking on a "Categories" link which is located on the header of every page.

require 'rails_helper'

feature "visitors can view all categories of restaurants" do
  scenario "navigate to categories page from header" do
    thai = Category.create(name: 'Thai')
    italian = Category.create(name: 'Italian')

    visit restaurants_path

    click_link "Categories"

    expect(page).to have_content(thai.name)
    expect(page).to have_content(italian.name)
  end
end
