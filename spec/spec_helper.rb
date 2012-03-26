require 'bundler/setup'
require 'rspec'
require 'opensesame-github'

Dir[File.expand_path('../support/**/*', __FILE__)].each { |f| require f }

RSpec.configure do |config|

  config.after(:each) do
    OpenSesame::Github.organization_name = nil
  end
end