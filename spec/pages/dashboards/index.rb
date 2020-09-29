# frozen_string_literal: true

module Pages
  module Dashboards
    class Index < SitePrism::Page
      set_url "/dashboards"

      element :new_game_link, "a.new_game"
    end
  end
end
