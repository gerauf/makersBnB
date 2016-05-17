feature "create spaces" do
  scenario "create new space" do
    visit '/users/new'
      sign_up(new_user)
      click_button "Create Account"

    visit '/spaces/new'
    create_space
    expect{click_button("create space")}.to change(Space, :count).by 1
    expect(current_path).to eq '/'
    within "ul#spaces" do
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Tidy little place"
      expect(page).to have_content "Cost per night £100"
    end
  end

  scenario "user can create multiple spaces" do
    visit '/users/new'
      sign_up(new_user)
      click_button "Create Account"
    visit '/spaces/new'
    create_space
    click_button("create space")
    visit '/spaces/new'
    create_second_space
    click_button("create space")
      expect(page).to have_content "Commercial Road"
      expect(page).to have_content "Tidy little place"
      expect(page).to have_content "Cost per night £100"
      expect(page).to have_content "Bow Road"
      expect(page).to have_content "Near tube station"
      expect(page).to have_content "Cost per night £90"
  end
end
