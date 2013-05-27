class ConvertController < ApplicationController
  def show
    uri = "#{params[:url]}.#{params[:format]}"

    # Rails routing strips off one of the slashes after the URI
    # We need to put it back
    re = /(http:|https:)\/([^\/])/
    uri.gsub!(re, "\\1//\\2")

    begin
      image = MiniMagick::Image.open uri
      @conversion = Conversion.new(:width => params[:width].to_i,
                      :height => params[:height].to_i,
                      :conv_type => params[:conv_type],
                      :image => image)

      # Check for validation errors that may have failed the conversion
      @conversion.valid?
      flash[:alert] = @conversion.errors.full_messages

    rescue OpenURI::HTTPError
      # tell the user their image wasn't good enough
      flash[:alert] = 'Image not found, pleae check URL.'
    end

    render template: 'convert/show',
      handlers: [:haml],
      formats:  [:html]
  end
end
