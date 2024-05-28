class TournamentsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    before_action :find_tournament, only: [:register, :unregister]

    def index
        @coming_tournament = Tournament.find_by(status: "coming")
        @registration = @coming_tournament.registration if @coming_tournament.present?
        @current_tournament = Tournament.find_by(status: "ongoing")
        @ended_tournaments = Tournament.where(status: "ended")
    end
    
    def new
        @tournament = Tournament.new
        @tournament.registrations.build
    end

    def create
        @tournament = Tournament.new(tournament_params)
        if @tournament.save
            redirect_to tournaments_path(@tournament), notice: "Le Tournoi a été crée avec succès"
        else
            render :new, status: 422
        end
    end

    def register
        @registration = @tournament.registration
        @registration.user_registrations << UserRegistration.create(registration: @registration, user: current_user)
        redirect_to root_path, notice: "Félicitations, vous êtes inscrit au tournoi."
    end

    def unregister
        @registration = @tournament.registration
        user_registration = UserRegistration.find_by(registration: @registration, user: current_user)
        user_registration.destroy if user_registration
        redirect_to root_path, notice: "Vous n'êtes plus inscrit à ce tournoi."
    end

    private

    def tournament_params
        params.require(:tournament).permit(
            :name, :start_date, :end_date, 
            registrations_attributes: [:id, :start_date, :end_date, :_destroy]
        )
    end

    def find_tournament
        @tournament = Tournament.find(params["id"])
    end
end
