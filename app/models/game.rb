# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :owner, class_name: "Player"

  has_and_belongs_to_many :players

  validates :name, presence: true
  validates :name, uniqueness: true
end
