class Conversion < ActiveRecord::Base

  attr_accessor :width,
    :height, :crop_type

  attr_accessible :crop_type, :height, :image, :width

  validates :url, :presence => true

  with_options :numericality => { :greater_than => 0 } do |inner|
    inner.validates :height
    inner.validates :width
  end

  validates :crop_type, :inclusion => { :in => %w(fill fit), :message => "value must be either 'fit' or 'fill'" }
end
