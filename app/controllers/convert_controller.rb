class ConvertController < ApplicationController
  def show
    uri = "#{params[:url]}.#{params[:format]}"

    # Rails routing strips off one of the slashes after the URI
    # We need to put it back
    re = /(http:|https:)\/([^\/])/
    uri.gsub!(re, "\\1//\\2")

    # set our instance vars
    @image = Conversion.find_or_create_by_url(uri)
    @image.width = params[:width]
    @image.height = params[:height]
    @image.crop_type = params[:crop_type]

    # make sure we have all the correct params, otherwise add errors
    # and skip to render
    unless @image.valid?
      flash[:alert] = @image.errors.full_messages
      @image = nil # don't want to show a  prevously loaded image if there are errors
    else
      # if we have a public id, we've already uploaded this image
      # in the past, no need to do it again.
      if @image.public_id.nil?
        begin
          image = MiniMagick::Image.open uri

          cloud_image = Cloudinary::Uploader.upload(image.path)
          @image.public_id = cloud_image["public_id"]
          @image.format = cloud_image["format"]
          @image.save!
        rescue OpenURI::HTTPError
          # tell the user their image wasn't good enough
          flash[:alert] = 'Image not found, pleae check URL.'
        end
      end
    end

    render template: 'convert/show',
      handlers: [:haml],
      formats:  [:html]
  end
end
