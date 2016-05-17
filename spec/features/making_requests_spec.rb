feature 'making requests' do

  scenario 'listings have a booking option' do
    sign_up_and_create_space
    within 'ul#spaces' do
       find_button "Book"
    end
  end

  scenario "clicking button books the space" do
    sign_up_and_create_space
    within 'ul#spaces' do
       click_button "Book"
    end
    expect(page).to have_content "Booking Page"
    expect(page).to have_content "Title: Commercial Road"
    expect(page).to have_content "Description: Tidy little place"
    expect(page).to have_content "Price per night: £100"
    expect(page).to have_content "You have booked!!!"
  end
end
