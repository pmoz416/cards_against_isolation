# frozen_string_literal: true

module Pages
  module Games
    class New < SitePrism::Page
      set_url "/games/new"

      element :error_message, ".alert"

      element :name_field, ".new_game input[name='game[name]']"
      element :create_button, ".new_game input[type=submit]"
    end
  end
end
