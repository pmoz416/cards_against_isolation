# frozen_string_literal: true

class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    game = Game.new(
      name: game_params[:name],
      owner: current_player
    )

    if game.save
      game.players << current_player
      redirect_to game
    else
      render_form_errors(game)
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def render_form_errors(game)
    error_messages = game.errors.full_messages.join(". ")
    flash[:alert] = error_messages

    render "new"
  end
end
