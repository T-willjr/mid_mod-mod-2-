require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies)}
  end

  describe ".average_age" do
    it "returns actors average_age" do
      studio = Studio.create!(name: "Universal", location: "Hollywood")
      studio2 = Studio.create!(name: "Warner Bros", location: "Hollywood")

      jurassic_park = studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-fi/Adventure")


      jeff = jurassic_park.actors.create!(name: "Jeff Goldblum", age: 60)
      sam = jurassic_park.actors.create!(name: "Sam Neil", age: 70)
      laura = jurassic_park.actors.create!(name: "Laura Dern", age: 50)
      expect(Actor.average_age).to eq(60)
    end
  end

  describe ".youngest_to_oldest" do
    it "returns actors from youngest_to_oldest" do
      studio = Studio.create!(name: "Universal", location: "Hollywood")
      studio2 = Studio.create!(name: "Warner Bros", location: "Hollywood")

      jurassic_park = studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-fi/Adventure")


      jeff = jurassic_park.actors.create!(name: "Jeff Goldblum", age: 60)
      sam = jurassic_park.actors.create!(name: "Sam Neil", age: 70)
      laura = jurassic_park.actors.create!(name: "Laura Dern", age: 50)
      expect(Actor.youngest_to_oldest).to eq([laura,jeff,sam])
    end

  end

  describe ".is_an_actor" do
    xit "returns true or false if name is in actor database" do
      studio = Studio.create!(name: "Universal", location: "Hollywood")
      studio2 = Studio.create!(name: "Warner Bros", location: "Hollywood")

      jurassic_park = studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-fi/Adventure")
      mike = Actor.create!(name: "Mike Dao", age: 34)


      expect(Actor.is_an_actor?(mike.name)).to be true
    end
  end

end
