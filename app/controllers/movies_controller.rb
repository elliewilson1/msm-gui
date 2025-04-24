class MoviesController < ApplicationController
  def create
    m = Movie.new
    
    m.title = params.fetch("new_movie_title")
    m.year = params.fetch("new_movie_year")
    m.duration = params.fetch("new_movie_duration")
    m.description = params.fetch("new_movie_description")
    m.image = params.fetch("new_movie_image")
    m.director_id = params.fetch("new_movie_director")
    m.save

    redirect_to("/movies")  
  end
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
