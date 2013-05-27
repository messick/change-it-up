class Conversion < ActiveRecord::Base

  attr_accessor :width,
    :height, :conv_type

  attr_accessible :conv_type, :height, :image, :width
  mount_uploader :image, ImageUploader
end
