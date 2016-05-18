feature "account page" do
  scenario "user has their own account page" do
    sign_up_and_create_space
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
