import nflgame

# receivers = []
# for item in receiving_result:
#     receivers.append(Weeklystats())


class Weeklystats():

    @staticmethod
    def passing():
        games = nflgame.games(2016, week=16)
        players = nflgame.combine_game_stats(games)
        quarterback_result=[]
        for p in players.passing().sort('passing_yds').limit(5):
            message = '%s %d of %d passes for %d yards and %d TDs'
            quarterback_result.append(message % (p, p.passing_cmp, p.passing_att, p.passing_yds, p.passing_tds))
        return quarterback_result
    @staticmethod
    def receiving():
        games = nflgame.games(2016, week=16)
        players = nflgame.combine_game_stats(games)
        receiving_result=[]
        for p in players.receiving().sort('receiving_yds').limit(5):
            message = '%s %d catches for %d yards and %d TDs'
            receiving_result.append(message % (p, p.receiving_rec, p.receiving_yds, p.receiving_tds))
        return receiving_result

    @staticmethod
    def rushing():
        games = nflgame.games(2016, week=16)
        players = nflgame.combine_game_stats(games)
        rushing_results = []
        for p in players.rushing().sort('rushing_yds').limit(5):
            message = '%s %d rushes for %d yards and %d TDs'
            rushing_results.append(message % (p, p.rushing_att, p.rushing_yds, p.rushing_tds))
        return rushing_results
