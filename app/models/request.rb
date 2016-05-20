class Request
  include DataMapper::Resource

  property :id, Serial
  property :start_date, DateTime, required: true
  property :end_date, DateTime, required: true
  property :booked, Boolean, default: false
  belongs_to :space
  belongs_to :user

end
