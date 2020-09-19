# frozen_string_literal: true

module Pages
  module Players
    class ResetPassword < SitePrism::Page
      set_url "/players/password/edit?reset_password_token={token}"

      element :password_field, "#new_player input[name='player[password]']"
      element :password_confirmation_field, "#new_player input[name='player[password_confirmation]']"
      element :reset_password_button, "#new_player input[type=submit]"
    end
  end
end
