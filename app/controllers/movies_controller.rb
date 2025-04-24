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
  def destroy
    the_id = params.fetch("an_id")
    matching_records = Movie.where({ :id => the_id })
    the_movie = matching_records.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end
  def modify
    the_id = params.fetch("the_id")
    matching_records = Movie.where({ :id => the_id })
    the_movie = matching_records.at(0)
    the_movie.title = params.fetch("updated_title")
    the_movie.year = params.fetch("updated_year")
    the_movie.duration = params.fetch("updated_duration")
    the_movie.description = params.fetch("updated_description")
    the_movie.image = params.fetch("updated_image")
    the_movie.director_id = params.fetch("updated_director")
    the_movie.save
    redirect_to("/movies/#{the_movie.id}")
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
