import nflgame

games = nflgame.games(2016, week=16)
players = nflgame.combine_game_stats(games)
for p in players.receiving().sort('receiving_yds').limit(5):
    msg = '%s %d catches for %d yards and %d TDs'
    print msg % (p, p.receiving_rec, p.receiving_yds, p.receiving_tds)
