# frozen_string_literal: true

module Pages
  module Players
    class ForgottenPassword < SitePrism::Page
      set_url "/players/password/new"

      element :email_field, "#new_player input[name='player[email]']"
      element :reset_password_button, "#new_player input[type=submit]"

      element :error_container, "#error_explanation"
    end
  end
end
