class HospitalsController < ApplicationController
    def index
        @hospitals = Hospital.all
        render json: {data: @hospitals, status:200, message:"Success"}
    end
end
