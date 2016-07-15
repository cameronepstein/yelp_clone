require 'rails_helper'
require_relative '../helpers/web_helper'

feature 'reviewing' do
  let!(:kfc) { Restaurant.create name: 'KFC' }

  scenario 'allows user to review a restaurant' do
    visit '/restaurants'
    sign_up
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq "/restaurants/#{kfc.id}"
    expect(page).to have_content 'so so'
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('Ok', '3')
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: 4')
  end
end
