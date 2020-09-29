# frozen_string_literal: true

class CreateGamesPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :games_players, id: false do |t|
      t.references :game, null: false, index: true, foreign_key: true
      t.references :player, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
