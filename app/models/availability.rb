class Availability
  include DataMapper::Resource

  property :id, Serial
  property :start_date, DateTime
  property :end_date, DateTime

  belongs_to :space


end
