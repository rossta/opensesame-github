# encoding: utf-8
module OpenSesame::Github
  class TeamMember < Base
    lazy_attr_reader :id, :login, :url, :avatar_url, :gravatar_id
  end
end