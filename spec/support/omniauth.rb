# OmniAuth.config.test_mode = true

# module OmniauthHelpers
#   def setup_for_github_login(user)
#     OmniAuth.config.mock_auth[:github] = {
#       "provider" => 'github',
#       "uid" => user.id
#     }
#   end

#   def login_as(user)
#     setup_for_github_login user
#     visit root_path
#     click_link 'login with github'
#   end
# end

# RSpec.configuration.send :include, OmniauthHelpers