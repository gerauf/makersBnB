feature "viewing all spaces" do
  scenario "visiting index page" do
    visit '/'
    expect(page.status_code).to eq 200
  end
end
