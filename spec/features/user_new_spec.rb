feature "registering" do
  scenario "creating an account" do
    generic_sign_in
    expect{click_button "Create Account"}.to change(User, :count).by 1
    expect(current_path).to eq '/'
    expect(page).to have_content "Logged in as: Alice Cooper"
  end

  scenario 'email address should be unique' do
    generic_sign_in
    click_button "Create Account"
    generic_sign_in
    expect {click_button "Create Account"}.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('Email is already taken')
  end
end
