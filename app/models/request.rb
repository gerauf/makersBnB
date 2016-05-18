class Request
  include DataMapper::Resource

  property :id, Serial
  belongs_to :space
  belongs_to :user

end
