class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
      end 
    
    def show 
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, include: [:bird, :location], except: [:updated_at, :created_at]
        else
            render json: { message: 'No sighting found with dat id'}
        end
    end
end
