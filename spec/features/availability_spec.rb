feature "availability" do
  scenario "choose availability for new space" do
    sign_up new_user
    click_button "Create Account"
    visit '/spaces/new'
    create_space
    check :Monday
    check :Tuesday
    check :Wednesday
    check :Thursday
    check :Friday
    click_button 'create space'
  end

  scenario "choose start and end dates of booking" do
    visit '/spaces'
    select "Monday", from: :start_date
    select "Thursday", from: :end_date
    click_button "Search"
    expect(current_path).to eq '/spaces'
  end

  scenario "only show spaces which are available for the whole period" do
    sign_up new_user
    click_button "Create Account"
    visit '/spaces/new'
    create_space
    check :Monday
    check :Tuesday
    check :Wednesday
    click_button 'create space'
    visit '/spaces/new'
    create_second_space
    check :Monday
    check :Tuesday
    check :Wednesday
    check :Thursday
    check :Friday
    click_button 'create space'
    visit '/spaces'
    select "Monday", from: :start_date
    select "Thursday", from: :end_date
    within "ul#spaces" do
      expect(page).to have_content("Bow Road")
      expect(page).not_to have_content("Commercial Road")
    end




  end
end
