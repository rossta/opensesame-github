module OpenSesame
  module Github
    extend self

    autoload :API, 'opensesame/github/api'
    autoload :Base, 'opensesame/github/base'
    autoload :Collection, 'opensesame/github/collection'
    autoload :Organization, 'opensesame/github/organization'
    autoload :TeamMember, 'opensesame/github/team_member'
    autoload :Strategy, 'opensesame/github/strategy'

    def organization_name
      @@organization_name
    end

    def organization_name=(organization_name)
      @@organization_name = organization_name
    end

    def organization
      Organization.new(:name => organization_name)
    end

    def api
      @@api ||= API.new
    end

  end
end

require "opensesame/github/version"
