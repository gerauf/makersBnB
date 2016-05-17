feature 'Sessions' do
  scenario 'log out' do
    sign_up new_user
    click_button 'Log Out'
    expect(page).not_to have_content "Logged in as: andy peters"
  end
end
