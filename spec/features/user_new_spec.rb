feature "registering" do

  scenario "creating an account" do
    sign_up new_user
    expect{click_button "create account"}.to change(User, :count).by 1
    expect(page).to have_content "logged in as: andy peters"
  end

  scenario 'email address should be unique' do
    sign_up new_user
    click_button "create account"
    sign_up new_user
    expect {click_button "create account"}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'
  end

 scenario 'all fields need to be filled in' do
   sign_up
   expect {click_button 'create account'}.not_to change(User, :count)
   expect(current_path).to eq '/users'
   expect(page).to have_content 'First name must not be blank'
   expect(page).to have_content 'Last name must not be blank'
   expect(page).to have_content 'Email must not be blank'
 end

 scenario 'Password confirmation must match password' do
   sign_up bad_password_user
   expect {click_button 'create account'}.not_to change(User, :count)
   expect(current_path).to eq '/users'
   expect(page).to have_content 'Password does not match the confirmation'
 end

 scenario 'Email must be correct format' do
   sign_up(bad_email_user)
   expect {click_button 'create account'}.not_to change(User, :count)
   expect(current_path).to eq '/users'
   expect(page).to have_content 'Email has an invalid format'
 end

 # scenario 'On error first name, last name and email persist' do
 #   sign_up(bad_password_user)
 #   expect {click_button 'create account'}.not_to change(User, :count)
 #   expect(page).to have_content('andy')
 #   expect(page).to have_content('peters')
 #   expect(page).to have_content('a@gmail.com')
 # end
end
