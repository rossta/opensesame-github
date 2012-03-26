# OpenSesame

OpenSesame-Github is a [Warden](https://github.com/hassox/warden) strategy for providing "walled garden" authentication for access to Rack-based applications via Omniauth. For example, your company has internal apps and/or staging enviroments for multiple projects and you want something better than HTTP basic auth. The intent is protect the visibility of your app from the outside world.

Enter OpenSesame-Github. To authenticate, OpenSesame-Github currently uses Omniauth and the Github API to require that a user is both logged in to Github and a member of the configurable Github organization. You can use any other authentication framework or strategy behind the OpenSesame-Github to authenticate your current user.

## Usage

Register your application(s) with Github for OAuth access. For each application, you need a name, the site url,
and a callback for OAuth. The OmniAuth-Github OAuth strategy used under the hood will expect the callback at '/auth/github/callback'. So the development version of your client application might be registered as:

    Name: MyApp - local
    URL: http://localhost:3000
    Callback URL: http://localhost:3000/auth/github/callback

In your Gemfile:

    $ gem "opensesame-github"

Insert the middleware components in your Rails `config/initializers` or in your Sinatra/Rack app file:

Rails

```ruby
# Rails config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Strategies::GitHub,
  GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET

Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.scope_defaults :team_member, :strategies => [:github_team_member]
  manager.failure_app = lambda { |env| HomeController.action(:show).call(env) }
end
```

Sinatra/Rack

```ruby
# Sinatra app.rb
require 'opensesame-github'

class MyApplication < Sinatra::Base
  # ...

  use OmniAuth::Strategies::GitHub, GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET

  use Warden::Manager do |manager|
    manager.scope_defaults :team_member, :strategies => [:github_team_member]
    manager.failure_app = lambda { |env| HomeController.action(:show).call(env) }
  end
end
```

Configure your Github organization:

```ruby
# Rails config/initializers/omniauth.rb or Sinatra app.rb

OpenSesame::Github.configure do |c|
  c.organization = 'challengepost'
end
```