require 'rack/contrib/try_static'
require 'rack/contrib/not_found'
require 'rack/ssl'

$stdout.sync = true
$stderr.sync = true

use Rack::SSL if ENV["RACK_ENV"] == "production"

# Puma enables this by default in development :(
use Rack::CommonLogger, $stdout if ENV["RACK_ENV"] == "production"

use Rack::Deflater

use Rack::TryStatic,
  root: '_site',
  urls: ['/'],
  try:  ['.html', 'index.html', '/index.html']

run Rack::NotFound.new('_site/404.html')
