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
end
