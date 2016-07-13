require 'rails_helper'
require_relative '../helpers/web_helper'

feature 'restaurants' do
  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    scenario 'it should create a restaurant' do
      visit '/'
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/'
      sign_up_and_sign_in
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'creating restaurants' do
    scenario 'should display a restaurant once added' do
      visit '/'
      sign_up_and_sign_in
      click_link 'Add a restaurant'
      fill_in('Name', with: 'Cams Chicken Hut')
      click_button 'Create Restaurant'
      expect(page).to have_content 'Cams Chicken Hut'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do
    let!(:kfc){ Restaurant.create(name:'KFC') }

    scenario 'lets a user view a restaurant' do
      visit '/'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants' do
    before { Restaurant.create name: 'KFC', description: 'Finger Clickin Chick-chick-hicken' }

    scenario 'lets a user edit a restaurant' do
      visit '/'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      fill_in 'Description', with: 'Finger Lickin Chick-chick-hicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(page).to have_content 'Finger Lickin Chick-chick-hicken'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'deleting restaurants' do
    before { Restaurant.create name: 'Nobu', description: 'Sushi' }

    scenario 'lets a user delete a restaurant' do
      visit '/'
      click_link 'Delete Nobu'
      expect(page).not_to have_content 'Nobu'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

  context 'invalid restaurant' do
    it 'does not let you submit a name that is too short' do
      visit '/'
      sign_up_and_sign_in
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KF'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'KF'
      expect(page).to have_content 'error'
    end
  end
end
