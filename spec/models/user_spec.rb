require "./app/models/user"

describe "User" do

  it 'does not authenticate when given an incorrect password' do
    user = User.create(first_name: 'bob', last_name: 'bob', email: 'bob@bob.com', password: 123, password_confirmation: 123)
    expect(User.authenticate('bob@bob.com', 'wrong_stupid_password')).to be_nil
  end
  
  it 'does authenticate when given correct password' do
    user = User.create(first_name: 'bob', last_name: 'bob', email: 'bob@bob.com', password: 123, password_confirmation: 123)
    expect(User.authenticate('bob@bob.com', 123)).to eq user
  end
end