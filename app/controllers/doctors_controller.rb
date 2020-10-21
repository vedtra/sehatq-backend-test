class DoctorsController < ApplicationController
    def index
    @doctors = Doctor.all
    render json: {data: @doctors, status: 200, message: "Success"}
    end

    def schedule
        @data = Doctor.find(params[:id])
        render json: @data

    end
    
end
