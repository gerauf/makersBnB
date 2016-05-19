feature "accepting requests" do
  scenario "accepting a booking on one of your spaces" do
    sign_up_and_create_space
    click_button "log out"
    sign_up keith_lemon
    click_button 'create account'
    visit '/spaces'
    click_button "Request to book"
    click_button 'log out'
    click_link 'log in'
    fill_in :login_email, with: "a@gmail.com"
    fill_in :login_password, with: "123"
    click_button 'log in'
    visit '/requests'
    within 'ul.requests_received' do
      expect(page).to have_content "Requests I've Received"
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Confirm"
      expect(page).to have_content "Reject"
    end
  end

end
