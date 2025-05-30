class ActorsController < ApplicationController
  def create
    a = Actor.new
    
    a.name = params.fetch("new_actor_name")
    a.dob = params.fetch("new_actor_dob")
    a.bio = params.fetch("new_actor_bio")
    a.image = params.fetch("new_actor_image")
    a.save

    redirect_to("/actors")  
  end
  def destroy
    the_id = params.fetch("an_id")
    matching_records = Actor.where({ :id => the_id })
    the_actor = matching_records.at(0)
    the_actor.destroy
    redirect_to("/actors")
  end
  def modify
    the_id = params.fetch("the_id")
    matching_records = Actor.where({ :id => the_id })
    the_actor = matching_records.at(0)
    the_actor.name = params.fetch("updated_name")
    the_actor.dob = params.fetch("updated_dob")
    the_actor.bio = params.fetch("updated_bio")
    the_actor.image = params.fetch("updated_image")
    the_actor.save
    redirect_to("/actors/#{the_actor.id}")
  end
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
end
