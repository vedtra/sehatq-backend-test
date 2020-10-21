class BookingsController < ApplicationController
    before_action :authorize_request
    
    def  create
        if check == 1
            booking = Booking.new
            booking.user_id = @current_user.id
            booking.doctor_id = doctorid
            booking.time_start = start
            booking.time_end = finish
            booking.save

            if booking.save
                render json: {data: booking, status: 200, message: "Success"} 
            else
                render json: booking.errors
            end
        else
            render json: {data: check, status: :unprocessable_entity, message: "Not required to book a doctor"}
        end
    end

    
    def check

        #check if times is 30 minutes before the doctor starts the schedule.
        doctor = Doctor.find doctorid
        min = (Time.parse(doctor.time_start.strftime('%H:%M')) - Time.parse("0:30")) / 60
        x= time_conversion(min.floor)
        if Time.parse(start) > Time.parse(x)
            return 0
        end 

        #check if total of book the same doctor less than 10.
        count_book = Booking.where(doctor_id: doctorid).count

        if count_book >= 10
            return 0
        end
        return 1
    end

    def doctorid 
        params[:doctor_id]
    end
    
    def start
        params[:time_start]
    end

    def finish
        params[:time_end]
    end

    def time_conversion(minutes)
        hours = minutes / 60
        rest = minutes % 60
        # return minutes
        return hours.to_s + ":"+rest.to_s
    end
end
