feature "accepting requests" do
  scenario "accepting a booking on one of your spaces" do
    sign_up_and_create_space
    within 'ul#spaces' do
       click_button "Book"
    end
    user_id = User.first(email: 'a@gmail.com').id
    visit '/users/' + user_id.to_s
  end
end
