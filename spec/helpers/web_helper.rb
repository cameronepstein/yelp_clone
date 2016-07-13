def sign_up_and_sign_in
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end
