feature "account page" do
  scenario "user has their own account page" do
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
    within 'ul#spaces' do
       click_button "Request to book"
    end
    visit '/users'
    within "article.user_info" do
      expect(page).to have_content "Name: andy peters"
      expect(page).to have_content "Email: a@gmail.com"
    end
    within "ul.user_spaces" do
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Tidy little place"
      expect(page).to have_content "Cost per night £100"
    end
  end
end
