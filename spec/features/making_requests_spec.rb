feature 'making requests' do

  scenario 'listings have a booking option' do
    sign_up_and_create_space
    within 'ul#spaces' do
       find_button "Request to book"
    end
  end

  scenario "clicking button sends a request" do
    sign_up_and_create_space
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
    within "ul.requests_received" do
      expect(page).to have_content "Requests I've received"
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Not confirmed"
    end
  end
end
