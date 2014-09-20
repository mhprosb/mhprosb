
# Change Compass configuration
compass_config do |config|
  require "bootstrap-sass"
  # config.output_style = :compact
  # config.add_import_path File.join root, 'bower/bootstrap-sass-official/assets/stylesheets'
  config.add_import_path File.join root, 'bower/bootswatch-scss'
end

# CSS Autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.inline   = true
end

# Reload the browser automatically whenever files change
activate :livereload

# Enable cache buster
# activate :asset_hash

# not using layout at all
# set :layout, false

# Paths
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/images'
set :partials_dir, 'partials'
set :build_dir, '../taufikandtailor.github.io'

# Proxies
# 1. readme
proxy '/README.md', '/README.txt', :layout => false

# Ignores
ignore '/README.txt'
ignore /^.*\.psd/

# Build-specific configuration
configure :build do

  activate :imageoptim
  activate :minify_css
  activate :minify_javascript

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end