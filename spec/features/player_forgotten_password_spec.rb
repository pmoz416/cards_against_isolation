# frozen_string_literal: true

describe "Player forgotten password", type: :feature do
  let(:forgotten_password_page) { Pages::Players::ForgottenPassword.new }

  context "when a player clicks the forgotten password link" do
    it "takes them to the forgotten password page" do
      signin_page = Pages::Players::SignIn.new
      signin_page.load

      signin_page.forgotten_password_link.click

      expect(forgotten_password_page).to be_displayed
    end

    context "when the forgotten password form is filled in correctly" do
      let(:player) { create(:player) }

      it "sets reset_password_token on the player" do
        forgotten_password_page.load

        forgotten_password_page.email_field.set(player.email)

        expect { forgotten_password_page.reset_password_button.click }.
          to change { player.reload.reset_password_token }
      end

      context "when the player clicks the password reset link in their email" do
        it "allows them to change their email address" do
          token = player.send_reset_password_instructions

          reset_password_page = Pages::Players::ResetPassword.new
          reset_password_page.load(token: token)

          reset_password_page.password_field.set("Password_2")
          reset_password_page.password_confirmation_field.set("Password_2")

          expect { reset_password_page.reset_password_button.click }.
            to change { player.reload.encrypted_password }
        end
      end
    end

    context "when the email address is missing" do
      it "shows an error message" do
        forgotten_password_page.load

        forgotten_password_page.reset_password_button.click

        expect(forgotten_password_page).to have_error_container
      end
    end

    context "when the email address does not match a player" do
      it "shows an error message" do
        forgotten_password_page.load

        forgotten_password_page.email_field.set("invalid@example.com")
        forgotten_password_page.reset_password_button.click

        expect(forgotten_password_page).to have_error_container
      end
    end
  end
end
