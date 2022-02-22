require 'rails_helper'

RSpec.describe "Movies Show Page" do
  it "Displays all a movies information" do
    studio = Studio.create!(name: "Universal", location: "Hollywood")
    studio2 = Studio.create!(name: "Warner Bros", location: "Hollywood")

    jurassic_park = studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-fi/Adventure")

    jaws = studio.movies.create!(title: "Jaws", creation_year: 1993, genre: "Adventure/Thriller")

    jeff = jurassic_park.actors.create!(name: "Jeff Goldblum", age: 69)
    sam = jurassic_park.actors.create!(name: "Sam Neil", age: 74)
    laura = jurassic_park.actors.create!(name: "Laura Dern", age: 55)

    rich = jaws.actors.create!(name: "Richard Dreyfuss", age: 74)
    ellen = jaws.actors.create!(name: "Ellen Brody", age: 84)

    visit movie_path(jurassic_park)

    expect(page).to have_content(jurassic_park.title)
    expect(page).to have_content(jurassic_park.creation_year)
    expect(page).to have_content(jurassic_park.genre)
    expect(laura.name).to appear_before(jeff.name)
    expect(jeff.name).to appear_before(sam.name)
    expect(sam.name).to_not appear_before(laura.name)
    expect(page).to have_content("Average Actor Age:\n#{jurassic_park.actors.average_age}")

    expect(page).to_not have_content(jaws.title)
    expect(page).to_not have_content(jaws.genre)
    expect(page).to_not have_content(rich.name)
    expect(page).to_not have_content(ellen.name)
  end

  it "can add an actor to the list of actors" do
    studio = Studio.create!(name: "Universal", location: "Hollywood")

    jurassic_park = studio.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-fi/Adventure")

    jaws = studio.movies.create!(title: "Jaws", creation_year: 1993, genre: "Adventure/Thriller")

    jeff = jurassic_park.actors.create!(name: "Jeff Goldblum", age: 69)
    sam = jurassic_park.actors.create!(name: "Sam Neil", age: 74)
    laura = jurassic_park.actors.create!(name: "Laura Dern", age: 55)
    mike = Actor.create!(name: "Mike Dao", age: 34)


    visit movie_path(jurassic_park)

    fill_in 'Name', with: 'Mike Dao'
    fill_in 'Age', with: 34
    click_on("Submit")

    expect(current_path).to eq(movie_path(jurassic_park))
    expect(page).to have_content(mike.name)
  end
end
