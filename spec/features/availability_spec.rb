feature "availability" do
  scenario "choose availability for new space" do
    sign_up new_user
    click_button "create account"
    visit '/spaces/new'
    create_space
    fill_in :start_date, with: '2016-05-19'
    fill_in :end_date, with: '2016-05-23'
    expect{click_button 'create space'}.to change(Availability, :count).by 1
  end



  scenario "only show spaces which are available for the whole period" do
    sign_up new_user
    click_button "create account"
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
    fill_in :start_date, with: '2016-05-20'
    fill_in :end_date, with: '2016-05-25'
    click_button "Search"
    within "ul#spaces" do
      expect(page).to have_content("Bow Road")
      expect(page).not_to have_content("Commercial Road")
    end
  end

  scenario "if no search criteria, show all spaces" do
    sign_up new_user
    click_button "create account"
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
    within "ul#spaces" do
      expect(page).to have_content("Bow Road")
      expect(page).to have_content("Commercial Road")
    end
  end
end
