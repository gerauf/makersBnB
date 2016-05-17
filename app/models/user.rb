require 'bcrypt'

class User
  include DataMapper::Resource
  has n, :spaces

    property :id, Serial
    property :first_name, String, required: true
    property :last_name, String, required: true
    property :email, String, required: true,
                             unique: true,
                             format: :email_address
    property :password_digest, Text

    attr_reader :password
    attr_accessor :password_confirmation
    validates_confirmation_of :password

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

end
