class Conversion < ActiveRecord::Base

  attr_accessor :width,
    :height, :conv_type

  attr_accessible :conv_type, :height, :image, :width
  mount_uploader :image, ImageUploader

  with_options :presence => true do |inner|
    inner.validates :conv_type
    inner.validates :height
    inner.validates :image
    inner.validates :width
  end

  with_options :numericality => { :greater_than => 0 } do |inner|
    inner.validates :height
    inner.validates :width
  end
end
