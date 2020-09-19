# frozen_string_literal: true

describe "Player authentication", type: :feature do
  let(:unconfirmed_player) do
    Player.create!(
      email: "player@example.com",
      password: "Passw0rd"
    )
  end

  let(:confirmed_player) do
    unconfirmed_player.confirm
    unconfirmed_player
  end

  context "when the player is not authenticated" do
    it "sends them to the sign-in page" do
      dashboard = Pages::Dashboards::Index.new
      dashboard.load
      expect(dashboard.current_path).to eq(new_player_session_path)
    end

    context "when they enter the correct credentials into the sign-in form" do
      it "takes them to the dashboard" do
        confirmed_player

        signin_page = Pages::Players::SignIn.new
        signin_page.load

        signin_page.email_field.set("player@example.com")
        signin_page.password_field.set("Passw0rd")
        signin_page.login_button.click

        expect(page).to have_current_path("/")
        expect(page).to have_content("Dashboard")
      end
    end

    context "when they have not confirmed their account" do
      it "shows an error message" do
        unconfirmed_player

        signin_page = Pages::Players::SignIn.new
        signin_page.load

        signin_page.email_field.set("player@example.com")
        signin_page.password_field.set("Passw0rd")
        signin_page.login_button.click

        expect(signin_page.alert).to have_content(
          "You have to confirm your email address before continuing."
        )
      end
    end

    context "when they enter an incorrect email address" do
      it "shows an error message" do
        confirmed_player

        signin_page = Pages::Players::SignIn.new
        signin_page.load

        signin_page.email_field.set("invalid@example.com")
        signin_page.password_field.set("Passw0rd")
        signin_page.login_button.click

        expect(signin_page.alert).to have_content("Invalid Email or password.")
      end
    end

    context "when they enter an incorrect password" do
      it "shows an error message" do
        confirmed_player

        signin_page = Pages::Players::SignIn.new
        signin_page.load

        signin_page.email_field.set("player@example.com")
        signin_page.password_field.set("invalid")
        signin_page.login_button.click

        expect(signin_page.alert).to have_content("Invalid Email or password.")
      end
    end
  end
end
