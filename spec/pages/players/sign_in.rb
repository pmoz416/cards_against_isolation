# frozen_string_literal: true

module Pages
  module Players
    class SignIn < SitePrism::Page
      class << self
        private

        def registration_path
          url_helpers = Rails.application.routes.url_helpers
          url_helpers.new_player_registration_path
        end

        def forgotten_password_path
          url_helpers = Rails.application.routes.url_helpers
          url_helpers.new_player_password_path
        end
      end

      set_url "/players/sign_in"

      element :email_field, "#new_player input[name='player[email]']"
      element :password_field, "#new_player input[name='player[password]']"
      element :login_button, "#new_player input[type=submit]"

      element :registration_link, "a[href='#{registration_path}']"
      element :forgotten_password_link, "a[href='#{forgotten_password_path}']"

      element :alert, ".alert"
    end
  end
end
