require 'spec_helper'
require 'opensesame-github/capybara'

describe OpenSesame::Github::Capybara do
  include OpenSesame::Github::Capybara

  it { dummy_github_team_member.should be_a(OpenSesame::Github::TeamMember) }
end