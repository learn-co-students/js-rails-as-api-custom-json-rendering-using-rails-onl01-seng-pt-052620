class BirdsController < ApplicationController

  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # We could also do if we had only a few keys to omit. 
    # render json: birds, except: [:created_at, :updated_at]

    # only and except come from to_json method. Shown completely looks like:
    # render json: birds.to_json(except: [:created_at, :updated_at])



  end

  def show
    bird = Bird.find_by(id: params[:id])

    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: "Where are you from, that's not a bird we have" }
    end

  end




end