# Change It Up


### Goal

To convert an image by passing the URL of the image and
conversion options in the brower's URL box.

Example:
http://change-it-up.herokuapp.com/http://example.com/image.png?width=100&height=100&crop_type=fill

## Technical Details

### System Dependencies

* Ruby 1.9.3
* Bundler
* PostgreSQL (Producton/Heroku)
* SQLite3 (Development/Test)
* QT (Capybara Webkit)

### Environment Setup

**ENV**: Authentication key for Cloudinary is exported as a environment variable:

* `CLOUDINARY_URL`
