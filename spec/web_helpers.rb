def sign_up(details={})
  visit '/users/new'
    fill_in :first_name, with: details[:first_name]
    fill_in :last_name, with: details[:last_name]
    fill_in :email, with: details[:email]
    fill_in :password, with: details[:password]
    fill_in :password_confirm, with: details[:password_confirm]
end
