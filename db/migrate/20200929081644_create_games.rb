# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name, null: false, index: { unique: true }
      t.references :owner, null: false, foreign_key: { to_table: :players }
      t.timestamps
    end
  end
end
