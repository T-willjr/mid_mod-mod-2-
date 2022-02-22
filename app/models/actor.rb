class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.average_age
    average(:age)
  end

  def self.youngest_to_oldest
    order(:age)
  end
end
