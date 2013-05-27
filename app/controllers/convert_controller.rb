require 'net/http'

class ConvertController < ApplicationController
  def show
    uri = "#{params[:url]}.#{params[:format]}"

    # Rails routing strips off one of the slashes after the URI
    # We need to put it back
    re = /(http:|https:)\/([^\/])/
    uri.gsub!(re, "\\1//\\2")

    @file = Net::HTTP.get(URI(uri))

    binding.pry
    render template: 'convert/show',
      handlers: [:haml],
      formats:  [:html]
  end
end
