feature 'Sessions' do
  scenario 'log out' do
    sign_up new_user
    expect{click_button "create account"}.to change(User, :count).by 1
    click_button 'log out'
    expect(page).not_to have_content "logged in as: andy peters"
  end

  scenario 'delete session when logged out' do
    sign_up new_user
    click_button "create account"
    click_button 'log out'
    expect(page).to have_content 'log out complete. Thanks!'
  end

 let!(:user) do
    User.create(email: 'a@gmail.com',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'log in' do
    sign_up new_user
    click_button "create account"
    click_button 'log out'
    click_link 'log in'
    fill_in :login_email, with: "a@gmail.com"
    fill_in :login_password, with: "123"
    click_button 'log in'
    expect(page).to have_content "logged in as:"
  end

end
