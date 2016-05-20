feature "accepting requests" do
  scenario "accepting a booking on one of your spaces" do
    sign_up_and_create_space
    click_button "log out"
    sign_up keith_lemon
    click_button 'create account'
    visit '/spaces'
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-20'
    click_button "Search"
    click_button "Request to book"
    click_button 'log out'
    click_link 'log in'
    fill_in :login_email, with: "a@gmail.com"
    fill_in :login_password, with: "123"
    click_button 'log in'
    visit '/requests'
    expect(page).to have_content "Requests I've received"
    within 'ul.requests_received' do
      expect(page).to have_content "Commercial Road"
      expect(page).to have_button "confirm"
      expect(page).to have_button "reject"
    end
  end

end
