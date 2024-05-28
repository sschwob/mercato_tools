class TournamentRegistrationService
    attr_reader :tournament, :registration

    def initialize(tournament)
        @tournament = tournament
        @registration = tournament.registration
    end

    def register_all_users
        User.all.each { |user| @registration.users << user }
    end

    def close_registration
        @registration.update(end_date: DateTime.now)
        @tournament.create_teams
    end
end
