class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def add

    x = Actor.new
    x.name = params.fetch("actor_name_param")
    x.dob = params.fetch("actor_dob_param")
    x.bio = params.fetch("actor_bio_param")
    x.image = params.fetch("actor_image_param")
    x.save

    redirect_to("/actors")
  end

  def edit

    the_id = params.fetch("path_id")
    matching_actors = Actor.where(:id => the_id)
    
    x = matching_actors.at(0)

    x.name = params.fetch("actor_name_param")
    x.dob = params.fetch("actor_dob_param")
    x.bio = params.fetch("actor_bio_param")
    x.image = params.fetch("actor_image_param")
    x.save
    
    redirect_to("/actors/#{the_id}")
  end

  def delete
    the_id = params.fetch("path_id")
    matching_actors = Actor.where(:id => the_id)
    x = matching_actors.at(0)

    x.destroy

    redirect_to("/actors")
  end




end
