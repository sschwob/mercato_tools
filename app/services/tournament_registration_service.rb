class TournamentRegistrationService
    attr_reader :tournament, :registration

    def initialize(tournament)
        @tournament = tournament
        @registration = tournament.registration
    end

    def register_all_users
        User.all.each { |user| @registration.users << user }
    end

    def open_registrations
        @registration.update(start_date: DateTime.now)
    end

    def close_registrations
        @registration.update(end_date: DateTime.now)
        @tournament.create_teams
    end

    def reopen_registrations
        @tournament.teams.destroy_all
        @registration.update(start_date: DateTime.now, end_date: DateTime.now.tomorrow)
    end
end
