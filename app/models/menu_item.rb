class MenuItem < ActiveRecord::Base
  validates :title, length: { minimum: 5 }
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'Must be a URL for a GIF, JPG, or PNG image'
  }
 end
