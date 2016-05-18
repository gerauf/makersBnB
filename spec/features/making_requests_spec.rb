feature 'making requests' do

  scenario 'listings have a booking option' do
    sign_up_and_create_space
    within 'ul#spaces' do
       find_button "Request to book"
    end
  end

  scenario "clicking button makes a request" do
    sign_up_and_create_space
    click_button 'Log Out'
    sign_up keith_lemon
    click_button "Create Account"
    within 'ul#spaces' do
       expect{click_button "Request to book"}.to change(Request, :count).by 1
    end
    visit '/requests'
    within "h1" do
      expect(page).to have_content "Requests"
    end
    within "ul.requests_made" do
      expect(page).to have_content "Requests I've made"
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Not confirmed"
    end
  end

  scenario "can't book own space" do
    sign_up_and_create_space
      within 'ul#spaces' do
        expect{click_button "Request to book"}.not_to change(Request, :count)
      end
  end

  scenario "can't book same space more than once" do
    sign_up_and_create_space
    click_button 'Log Out'
    sign_up keith_lemon
    click_button "Create Account"
    within 'ul#spaces' do
      expect{click_button "Request to book"}.to change(Request, :count).by 1
      expect{click_button "Request to book"}.not_to change(Request, :count)
    end
  end

end
