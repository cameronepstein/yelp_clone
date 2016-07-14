def sign_up(email = 'test@example.com', password = 'password', password_confirmation = 'password')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end


def add_a_restaurant(name)
  click_link 'Add a restaurant'
  fill_in 'Name', with: name
  click_button 'Create Restaurant'
end
