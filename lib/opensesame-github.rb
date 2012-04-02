require 'warden'
require 'omniauth-github'

module OpenSesame
  module Github
    extend self

    autoload :API, 'opensesame/github/api'
    autoload :Base, 'opensesame/github/base'
    autoload :Collection, 'opensesame/github/collection'
    autoload :Organization, 'opensesame/github/organization'
    autoload :TeamMember, 'opensesame/github/team_member'

    def organization_name
      @@organization_name
    end

    def organization_name=(organization_name)
      @@organization_name = organization_name
    end

    def organization
      @@organization ||= Organization.new(:name => organization_name)
    end

    def api
      @@api ||= API.new
    end

    def reset!
      @@organization_name = nil
      @@organization = nil
      @@api = nil
    end

  end
end

require 'opensesame/github/version'
require 'opensesame/github/strategy'