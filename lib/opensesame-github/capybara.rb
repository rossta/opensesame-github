module OpenSesame
  module Github
    module Capybara

      def setup_for_github_login(team_member = dummy_github_team_member)
        OmniAuth.config.mock_auth[:github] = {
          "provider" => 'github',
          "uid" => team_member.id
        }
        organization = mock('Organization', :find_team_member => team_member)
        OpenSesame::Github.stub(:organization).and_return(organization)
        team_member
      end

      def login_with_github
        setup_for_github_login
        visit root_path
        click_link 'github'
      end

      def dummy_github_team_member(attributes = {})
        OpenSesame::Github::TeamMember.new({:id => 171, :login => "rossta" }.merge(attributes))
      end

    end
  end
end