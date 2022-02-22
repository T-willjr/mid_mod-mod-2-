class MovieController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:id])
    @movie.actors.create!(actor_params)
    redirect_to movie_path(@movie)
  end
end

private

def actor_params
  params.permit(:name, :age)
end
