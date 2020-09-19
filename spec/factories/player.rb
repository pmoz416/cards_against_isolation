# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    email { "player@example.com" }
    password { "Passw0rd" }
    confirmed_at { Time.zone.now }
  end
end
