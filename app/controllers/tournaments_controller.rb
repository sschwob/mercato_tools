class TournamentsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    before_action :check_user_admin, except: [:index]
    before_action :find_tournament, except: [:index, :new, :create]

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
            redirect_to tournaments_path, notice: "Le Tournoi a été crée avec succès"
        else
            render :new, status: 422
        end
    end

    def register
        UserRegistration.create(registration: @tournament.registration, user: current_user)
        redirect_to tournaments_path, notice: "Félicitations, vous êtes inscrit au tournoi."
    end

    def unregister
        @registration = @tournament.registration
        user_registration = UserRegistration.find_by(registration: @registration, user: current_user)
        user_registration.destroy if user_registration
        redirect_to tournaments_path, notice: "Vous n'êtes plus inscrit à ce tournoi."
    end

    def open_registrations
        TournamentRegistrationService.new(@tournament).open_registrations
        redirect_to tournaments_path, notice: "Les inscriptions sont ouvertes pour ce tournoi."
    end

    def close_registrations
        TournamentRegistrationService.new(@tournament).close_registrations
        redirect_to root_path, notice: "Les inscriptions sont fermées pour ce tournoi."
    end

    def reopen_registrations
        TournamentRegistrationService.new(@tournament).reopen_registrations
        redirect_to tournaments_path, notice: "Les inscriptions sont réouvertes pour ce tournoi."
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
