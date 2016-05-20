

class SpaceImage
  include DataMapper::Resource

  property :id, Serial
  mount_uploader :image, MyUploader
  belongs_to :space
end
