require 'appengine-rack'

AppEngine::Rack.configure_app(
    :application => 'jrubydemo',
    :precompilation_enabled => true,
    :sessions_enabled => true,
    :version => "dev")

run lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Hello world!"]] }
