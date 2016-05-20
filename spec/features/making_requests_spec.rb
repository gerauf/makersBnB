feature 'making requests' do

  scenario 'listings have a booking option' do
    sign_up_and_create_space
    within 'ul#spaces' do
       find_button "Request to book"
    end
  end

  scenario "clicking button makes a request" do
    sign_up_and_create_space
    click_button 'log out'
    sign_up keith_lemon
    click_button "create account"
    visit '/spaces'
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-20'
    click_button "Search"
    within 'ul#spaces' do
       expect{click_button "Request to book"}.to change(Request, :count).by 1
    end
    visit '/requests'
    within "h1" do
      expect(page).to have_content "Requests"
    end
    expect(page).to have_content "Requests I've made"
    within "ul.requests_made" do
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Awaiting confirmation"
    end
  end

  scenario "can't book own space" do
    sign_up_and_create_space
      click_button 'log out'
      click_link 'log in'
      fill_in :login_email, with: 'a@gmail.com'
      fill_in :login_password, with: '123'
      click_button "log in"
      visit '/spaces'
      fill_in :start_date, with: '2016-05-19'
      fill_in :end_date, with: '2016-05-20'
      click_button "Search"
      within 'ul#spaces' do
        expect{click_button "Request to book"}.not_to change(Request, :count)
      end
  end

  scenario "can't book same space more than once" do
    sign_up_and_create_space
    click_button 'log out'
    sign_up keith_lemon
    click_button "create account"
    visit '/spaces'
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-20'
    click_button "Search"
    within 'ul#spaces' do
      expect{click_button "Request to book"}.to change(Request, :count).by 1
      expect{click_button "Request to book"}.not_to change(Request, :count)
    end
  end

  scenario "can't make a request if not signed in" do
    sign_up_and_create_space
    click_button 'log out'
    visit '/spaces'
    within 'ul#spaces' do
      expect(page).not_to have_content "Request to book"
    end
  end

  scenario "request should have start and end date of booking" do
    sign_up new_user
    click_button "create account"
    visit '/spaces/new'
    create_space
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-23'
    click_button 'create space'
    click_button 'log out'
    sign_up keith_lemon
    click_button "create account"
    visit '/spaces'
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-20'
    click_button "Search"
    click_button "Request to book"
    visit '/requests'
    within 'ul.requests_made' do
      expect(page).to have_content "2016-5-19"
      expect(page).to have_content "2016-5-20"
    end
  end

  scenario "can't book without selecting dates first" do
    sign_up new_user
    click_button "create account"
    visit '/spaces/new'
    create_space
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-23'
    click_button 'create space'
    click_button 'log out'
    sign_up keith_lemon
    click_button "create account"
    visit '/spaces'
    expect{click_button "Request to book"}.not_to change(Space, :count)
    expect{click_button "Request to book"}.not_to change(Availability, :count)
  end
end
