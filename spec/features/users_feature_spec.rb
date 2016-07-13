require 'rails_helper'
require_relative '../helpers/web_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    it 'should see a sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it 'should not see sign out link' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end

    it 'should not see add new restaurant link' do
      visit '/'
      expect(page).not_to have_link 'Add a restaurant'
    end
end
    context 'user signed in on the homepage' do
      before do
        sign_up_and_sign_in
      end

      it 'should see sign out link' do
        visit '/'
        expect(page).to have_link 'Sign out'
      end

      it 'should not see sign in or sign up' do
        visit '/'
        expect(page).not_to have_link 'Sign in'
        expect(page).not_to have_link 'Sign up'
      end

      it 'should show add new restaurant link' do
        visit '/'
        expect(page).to have_link 'Add a restaurant'
      end
    end
  end
