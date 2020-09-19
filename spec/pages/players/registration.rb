# frozen_string_literal: true

module Pages
  module Players
    class Registration < SitePrism::Page
      set_url "/players/sign_up"

      element :email_field, "#new_player input[name='player[email]']"
      element :password_field, "#new_player input[name='player[password]']"
      element :password_confirmation_field, "#new_player input[name='player[password_confirmation]']"
      element :register_button, "#new_player input[type=submit]"
      element :error_container, "#error_explanation"
    end
  end
end
