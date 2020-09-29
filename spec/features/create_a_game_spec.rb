# frozen_string_literal: true

describe "Create a game", type: :feature do
  let(:player) { create(:player) }

  before { sign_in player }

  context "when the new game link on the dashboard is pressed" do
    it "redirects to the new game page" do
      dashboard = Pages::Dashboards::Index.new
      dashboard.load

      dashboard.new_game_link.click

      new_game_page = Pages::Games::New.new
      expect(new_game_page).to be_displayed
    end
  end

  context "when the new game form is submitted correctly" do
    it "creates the game and redirects to the game page" do
      new_game_page = Pages::Games::New.new
      new_game_page.load

      new_game_page.name_field.set("Isogame")
      new_game_page.create_button.click

      new_game = Game.find_by(name: "Isogame")
      expect(new_game).to have_attributes(
        name: "Isogame",
        owner_id: player.id
      )
      expect(new_game.players).to include player

      show_game_page = Pages::Games::Show.new
      expect(show_game_page).to be_displayed(id: new_game.id)
      expect(show_game_page).to have_content("Isogame")
    end
  end

  context "when the new game name matches an existing game" do
    before do
      Game.create!(
        name: "Isogame",
        owner: player
      )
    end

    it "shows an error message" do
      new_game_page = Pages::Games::New.new
      new_game_page.load

      new_game_page.name_field.set("Isogame")
      new_game_page.create_button.click

      expect(new_game_page).to have_error_message
    end
  end
end
