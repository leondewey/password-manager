set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :livereload

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
end

activate :sync do |sync|
  sync.fog_provider = 'AWS' # Your storage provider
  sync.fog_directory = 'passwords.leondewey.com' # Your bucket name
  sync.fog_region = 'ap-southeast-2' # Sydney
  sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID'] # Your Amazon S3 access key
  sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY'] # Your Amazon S3 access secret
  sync.existing_remote_files = 'delete' # What to do with your existing remote files? ( keep or delete )
  sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end