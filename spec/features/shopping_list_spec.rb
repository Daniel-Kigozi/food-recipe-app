require 'rails_helper'

RSpec.describe 'Shopping List Page', type: :system do
  it 'displays the shopping list details' do
    # Create sample data
    food = Food.create(name: 'Sample Food', measurement_unit: 'g', price: 1.5)
    recipe_food = RecipeFood.create(food: food, quantity: 500)

    visit shopping_lists_path

    # Check for Back to Recipes List link
    back_to_recipes_link = find_link('Back to Recipes List')
    expect(back_to_recipes_link[:href]).to eq('/recipes')
    expect(page).to have_link('Back to Recipes List', href: '/recipes', class: 'btn btn-primary ml-5')
    expect(back_to_recipes_link[:class]).to eq('btn btn-primary ml-5')

    # Check for Amount of food items to buy alert
    expect(page).to have_selector('.alert.alert-info', text: "Amount of food items to buy: #{recipe_food.quantity}")

    # Check for recipe foods details
    within('.card.mb-3') do
      expect(page).to have_content('Sample Food')
      expect(page).to have_content('500g')
      expect(page).to have_content('$750.00') # (1.5 * 500 = 750)
    end

    # Check for Total value of food needed alert
    expect(page).to have_selector('.alert.alert-info', text: 'Total value of food needed: $750.00')
  end
end
