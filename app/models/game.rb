# frozen_string_literal: true

class Game < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
end
