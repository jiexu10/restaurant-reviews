# As a user
# I want to specify what categories a restaurant belongs to when creating it
# So people know what kind of cuisine the new restaurant serves
# Acceptance Criteria
#
# On the page to create a new restaurant, I should see checkboxes for all the categories.
# Upon successful form submission, I should see the names of the categories which were selected on the form to be present on the restaurant's details page.

require 'rails_helper'

feature "visitors adds new restaurant with categories" do
  scenario "navigate to restaurant new page" do
    thai = Category.create(name: 'Thai')
    chinese = Category.create(name: 'Chinese')
    italian = Category.create(name: 'Italian')

    visit new_restaurant_path

    expect(page).to have_content "New Restaurant Form"

    fill_in 'Name', with: "Figaro's"
    fill_in 'Address', with: "105 Beach St"
    fill_in 'City', with: "Boston"
    fill_in 'State', with: "Massachusetts"
    fill_in 'Zip', with: "02111"
    fill_in 'Description', with: "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."

    check(chinese.name)
    check(thai.name)
    check(italian.name)

    click_button "Add Restaurant"

    save_and_open_page
    expect(page).to have_content "Restaurant added successfully"
    expect(page).to have_content "Figaro's"
    expect(page).to have_content "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."
    expect(page).to have_content(chinese.name)
    expect(page).to have_content(italian.name)
    expect(page).to have_content(thai.name)
  end
end
