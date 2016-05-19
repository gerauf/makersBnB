feature "availability" do
  scenario "choose availability for new space" do
    sign_up new_user
    click_button "Create Account"
    visit '/spaces/new'
    create_space
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-23'
    expect{click_button 'create space'}.to change(Availability, :count).by 1
  end

  scenario "choose start and end dates of booking" do
    visit '/spaces'
    fill_in :start_date, with: "2016-05-19"
    fill_in :end_date, with: "2016-05-23"
    click_button "Search"
    expect(current_path).to eq '/spaces'
  end

  scenario "only show spaces which are available for the whole period" do
    sign_up new_user
    click_button "Create Account"
    visit '/spaces/new'
    create_space
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-23'
    click_button 'create space'
    visit '/spaces/new'
    create_second_space
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-27'
    click_button 'create space'
    visit '/spaces'
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-27'
    within "ul#spaces" do
      expect(page).to have_content("Bow Road")
      expect(page).not_to have_content("Commercial Road")
    end




  end
end
