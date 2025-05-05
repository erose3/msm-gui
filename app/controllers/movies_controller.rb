class MoviesController < ApplicationController
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

  def add

    x = Movie.new
    x.title = params.fetch("movie_name_param")
    x.year = params.fetch("movie_year_param")
    x.duration = params.fetch("movie_dur_param")
    x.description = params.fetch("movie_desc_param")
    x.image = params.fetch("movie_image_param")
    x.director_id = params.fetch("director_id_param")
    x.save

    redirect_to("/movies")
  end

  def edit

    the_id = params.fetch("path_id")
    matching_movies = Movie.where(:id => the_id)
    
    x = matching_movies.at(0)

    x.title = params.fetch("movie_name_param")
    x.year = params.fetch("movie_year_param")
    x.duration = params.fetch("movie_dur_param")
    x.description = params.fetch("movie_desc_param")
    x.image = params.fetch("movie_image_param")
    x.director_id = params.fetch("director_id_param")
    x.save
    
    redirect_to("/movies/#{the_id}")
  
  end

  def delete
    the_id = params.fetch("path_id")
    matching_movies = Movie.where(:id => the_id)
    x = matching_movies.at(0)

    x.destroy

    redirect_to("/movies")
  end


end
