require 'spec_helper'

feature ConvertController do
  subject { page}

  describe 'when a user converts an image' do
    context "fill type is 'fit'" do
      it 'displays a converted image' do
        visit '/http://change-it-up.herokuapp.com/assets/test.jpg?width=500&height=500&crop_type=fit'
        image = Conversion.last

        # build url from Cloudinary so we can check page for it
        options = {:format=>:jpg, :width => 500, :height => 500, :crop => 'fit'}
        result = Cloudinary::Utils.cloudinary_url(image.public_id, options)

        should have_xpath("//img[@src=\"#{result}\"]")
      end
    end

    context "fill type is 'fill'" do
      it 'displays a converted image' do
        visit '/http://change-it-up.herokuapp.com/assets/test.jpg?width=200&height=100&crop_type=fill'
        image = Conversion.last

        # build url from Cloudinary so we can check page for it
        options = {:format=>:jpg, :width => 200, :height => 100, :crop => 'fill'}
        result = Cloudinary::Utils.cloudinary_url(image.public_id, options)

        should have_xpath("//img[@src=\"#{result}\"]")
      end
    end
  end
end
