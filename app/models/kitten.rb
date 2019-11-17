# frozen_string_literal: true

class Kitten < ApplicationRecord
  validates :name, :age, presence: true
end
