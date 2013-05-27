require 'net/http'

class ConvertController < ApplicationController
  def show
    uri = "#{params[:url]}.#{params[:format]}"

    # Rails routing strips off one of the slashes after the URI
    # We need to put it back
    re = /(http:|https:)\/([^\/])/
    uri.gsub!(re, "\\1//\\2")
    image = MiniMagick::Image.open uri

    @conversion = Conversion.new(:width => params[:width].to_i,
                    :height => params[:height].to_i,
                    :conv_type => params[:conv_type],
                    :image => image)

    render template: 'convert/show',
      handlers: [:haml],
      formats:  [:html]
  end
end
