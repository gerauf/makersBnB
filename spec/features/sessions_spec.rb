feature 'Sessions' do
  scenario 'log out' do
    sign_up new_user
    expect{click_button "Create Account"}.to change(User, :count).by 1
    click_button 'Log Out'
    expect(page).not_to have_content "Logged in as: andy peters"
  end

  scenario 'delete session when logged out' do
    sign_up new_user
    click_button "Create Account"
    click_button 'Log Out'
    expect(page).to have_content 'Log Out complete. Thanks!'
  end

 let!(:user) do
    User.create(email: 'a@gmail.com',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'log in' do
    sign_up new_user
    click_button "Create Account"
    click_button 'Log Out'
    click_link 'login'
    fill_in :login_email, with: "a@gmail.com"
    fill_in :login_password, with: "123"
    click_button 'Log In'
    expect(page).to have_content "Logged in as:"
  end

end
