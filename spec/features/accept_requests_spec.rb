feature "accepting requests" do
  scenario "accepting a booking on one of your spaces" do
    sign_up_and_create_space
    click_button "Log Out"
    sign_up keith_lemon
    click_button 'Create Account'
    visit '/spaces'
    click_button "Request to book"
    click_button 'Log Out'
    click_link 'log in'
    fill_in :login_email, with: "a@gmail.com"
    fill_in :login_password, with: "123"
    click_button 'Log In'
    visit '/requests'
    within 'ul.requests_received' do
      expect(page).to have_content "Requests I've Received"
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Confirm"
      expect(page).to have_content "Reject"
    end
  end

end
