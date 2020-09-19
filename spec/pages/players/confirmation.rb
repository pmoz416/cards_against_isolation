# frozen_string_literal: true

module Pages
  module Players
    class Confirmation < SitePrism::Page
      set_url "/players/confirmation?confirmation_token={token}"
    end
  end
end
