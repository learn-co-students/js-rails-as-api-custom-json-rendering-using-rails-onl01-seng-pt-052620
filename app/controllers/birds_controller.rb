class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # array of hashes, you need to use the only option to display specific attributes
    # render json: birds, only: [:id, :name, :species]

    # also can use except
    # render json: birds, except: [:created_at, :updated_at]

    # show me the magic!
    render json: birds.to_json(except: [:created_at, :updated_at]) #same as above except
  end

  # additional action for show route
    def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species } 
    else 
      render json: {message: 'Bird Not Found: Flew the Coop!'}
    # slice method
    # good for single object
    # render json: bird.slice(:id, :name, :species)
    end
  end
end