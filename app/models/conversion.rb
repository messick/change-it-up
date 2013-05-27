class Conversion < ActiveRecord::Base

  attr_accessor :width,
    :height, :crop_type

  attr_accessible :conv_type, :height, :image, :width

  with_options :presence => true do |inner|
    inner.validates :crop_type
    inner.validates :height
    inner.validates :url
    inner.validates :width
  end

  with_options :numericality => { :greater_than => 0 } do |inner|
    inner.validates :height
    inner.validates :width
  end
end
