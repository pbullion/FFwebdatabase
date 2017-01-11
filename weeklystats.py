import nflgame


class Weeklystats():
    @staticmethod
    def passing():
        games = nflgame.games(2016, week=16)
        players = nflgame.combine_game_stats(games)
        for p in players.passing().sort('passing_yds').limit(5):
            msg = '%s %d of %d passing for %d yards and %d TDs'
            print msg % (p, p.passing_comp, p.passing_att, p.passing_yds, p.passing_tds)
            return msg

    @staticmethod
    def receiving():
        games = nflgame.games(2016, week=16)
        players = nflgame.combine_game_stats(games)
        for p in players.receiving().sort('receiving_yds').limit(5):
            msg = '%s %d catches for %d yards and %d TDs'
            print msg % (p, p.receiving_rec, p.receiving_yds, p.receiving_tds)

    @staticmethod
    def rushing():
        games = nflgame.games(2016, week=14)
        players = nflgame.combine_game_stats(games)
        for p in players.rushing().sort('rushing_yds').limit(15):
            msg = '%s %d carries for %d yards and %d TDs'
            print msg % (p, p.rushing_att, p.rushing_yds, p.rushing_tds)
