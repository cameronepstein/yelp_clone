require 'rails_helper'


feature 'restaurants' do
  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    scenario 'it should create a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'creating restaurants' do
    scenario 'should display a restaurant once added' do
      visit '/restaurants'
      click_link('Add a restaurant')
      fill_in('Name', with: 'Cams Chicken Hut')
      click_button 'Create Restaurant'
      expect(page).to have_content 'Cams Chicken Hut'
      expect(current_path).to eq '/restaurants'
    end
  end
end
