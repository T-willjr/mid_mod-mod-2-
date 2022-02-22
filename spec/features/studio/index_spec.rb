require 'rails_helper'

RSpec.describe "Studio Index Page" do
  it "Displays all studios information on index page" do
    studio = Studio.create!(name: "Universal", location: "Hollywood")
    studio2 = Studio.create!(name: "Warner Bros", location: "Hollywood")
    jurassic_park = studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-fi/Adventure")
    jaws = studio.movies.create!(title: "Jaws", creation_year: 1993, genre: "Adventure/Thriller")

    tenet = studio2.movies.create!(title: "Tenet", creation_year: 2020, genre: "Action/Sci-fi")
    dark_knight_rises = studio2.movies.create!(title: "The Dark Knight Rises", creation_year: 2012, genre: "Action/Thriller")
    visit '/studio'
    expect(page).to have_content(studio.name)
    expect(page).to have_content(jurassic_park.title)
    expect(page).to have_content(jaws.title)
    expect(page).to have_content(studio.location)
    expect(page).to have_content(studio2.name)
    expect(page).to have_content(tenet.title)
    expect(page).to have_content(dark_knight_rises.title)
    expect(page).to have_content(studio2.location)
  end
end
