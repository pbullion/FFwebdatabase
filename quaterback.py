import nflgame

games = nflgame.games(2016, week=16)
players = nflgame.combine_game_stats(games)
for p in players.passing().sort('passing_yds').limit(5):
    msg = '%s %d of %d passes for %d yards and %d TDs'
    print msg % (p, p.passing_comp, p.passing_att, p.passing_yds, p.passing_tds)
