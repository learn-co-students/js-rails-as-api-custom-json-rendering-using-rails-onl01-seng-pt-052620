class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: birds
    render json: birds, only: [:id, :name, :species]   #produces only these for each bird 
    render json: birds, except: [:created_at, :updated_at]
    render json: birds.to_json(except: [:created_at, :updated_at])  
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json:{id: bird.id, name: bird.name, species: bird.species}
    else
      render json: {message: "Bird not found"}
    render json:{id: bird.id, name: bird.name, species: bird.species}
    render json: bird.slice(:id, :name, :species) #produces only these for the requested bird 
  end
end


# The slice() method returns a shallow copy of a portion of an array into a new array object selected from start to end (end not included) where start and end represent the index of items in that array. The original array will not be modified.