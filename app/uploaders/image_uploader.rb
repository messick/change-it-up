# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file

  process :dynamic_conversion

  def dynamic_conversion
    type = model.conv_type ||= 'resize'

    if type == 'resize'
      resize_to_fit model.width, model.height
    else
      resize_to_fill model.width, model.height
    end
  end

end
