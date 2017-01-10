import nflgame

games = nflgame.games(2016, week=14)
players = nflgame.combine_game_stats(games)
for p in players.rushing().sort('rushing_yds').limit(15):
    msg = '%s %d carries for %d yards and %d TDs'
    print msg % (p, p.rushing_att, p.rushing_yds, p.rushing_tds)



# import yql
# from yql.storage import FileTokenStore
# import os
# import pypyodbc

# y3 = yql.ThreeLegged('Your Consume KEY', 'YOUR CONSUMER SECRET')
# _cache_dir = '/Users/Kristine/Documents/Digital Crafts/Class Work/Week6/FFProject'
# if not os.access(_cache_dir, os.R_OK):
#     os.mkdir(_cache_dir)
# token_store = FileTokenStore(_cache_dir, secret='adfkja;jk')
#
# stored_token = token_store.get('foo')
#
# if not stored_token:
#     # Do the dance
#     request_token, auth_url = y3.get_token_and_auth_url()
#     print "Visit url %s and get a verifier string" % auth_url
#     verifier = raw_input("Enter the code: ")
#     token = y3.get_access_token(request_token, verifier)
#     token_store.set('foo', token)
# else:
#     # Check access_token is within 1hour-old and if not refresh it
#     # and stash it
#     token = y3.check_token(stored_token)
#     if token != stored_token:
#         token_store.set('foo', token)


# query ="select * from fantasysports.teams.roseter.stats where team_key'" + teamid + "' and week in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)"
# data_yql = y3.execute(query, token=token)
# data = data_yql.rows
#
#
# #I am connecting to a SQL Server to grab some data and store the data.
# cnn = pyodbc.connect('DRIVER={SQL Server};SERVER=127.0.0.1;DATABASE=FFProject;UID=root;PWD="";')
# cur = cnn.cursor()
#
# f = open('/Users/Kristine/Documents/Digital Crafts/Class Work/Week6/FFProject/yahoo_roster.txt','w')
# f2 = open('/Users/Kristine/Documents/Digital Crafts/Class Work/Week6/FFProject/yahoo_roster_stats.txt','w')
#
# y3 = yql.ThreeLegged('CONSUMER KEY ', 'CONSUMER SECRET')
# _cache_dir = '/Users/Kristine/Documents/Digital Crafts/Class Work/Week6/FFProject'
# if not os.access(_cache_dir,os.R_OK):
#  os.mkdir(_cache_dir)
# token_store = FileTokenStore(_cache_dir, secret='sasfasdfdasfdaf')
#
# stored_token = token_store.get('foo')
#
# if not stored_token:
#     # Do the dance
#     request_token, auth_url = y3.get_token_and_auth_url()
#     print "Visit url %s and get a verifier string" % auth_url
#     verifier = raw_input("Enter the code: ")
#     token = y3.get_access_token(request_token, verifier)
#     token_store.set('foo', token)
# else:
#     # Check access_token is within 1hour-old and if not refresh it
#     # and stash it
#     token = y3.check_token(stored_token)
#     if token != stored_token:
#         token_store.set('foo', token)
#
# #I execute a Stored procedure here on my SQL Server to grab a list of teams.
# #then i loop through them.
# cur.execute("EXEC yahoo_ff_getTeams")
# for row in cur:
#
#  teamid = row[0]
#
#  stats_query = "select * from fantasysports.teams.roster.stats where team_key='" + teamid + "' and  week in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)"
#  stats_yql = y3.execute(stats_query, token=token)
#  stats = stats_yql.rows
#
#  for week in stats:
#   for roster in week['roster']['players']['player']:
#    fname = roster['name']['first']
#    if not roster['name']['last']:
#     lname = "none"
#    else:
#     lname = roster['name']['last']
#    team = roster['editorial_team_abbr']
#    weeknum = roster['player_stats']['week']
#    totalpoints = roster['player_points']['total']
#
#    f.write(teamid + '|' + fname + '|' + lname + '|' + team + '|' + roster['player_id'] + '|' + roster['player_key'] + '|' + str(weeknum) + '|' + str(totalpoints) + '|' + roster['selected_position']['position'] + '\n')
#
#    for stat in roster['player_stats']['stats']['stat']:
#     f2.write(roster['player_id']  + '|' + str(weeknum) + '|' + roster['player_key'] + '|' + stat['stat_id'] + '|' + stat['value'] + '\n')
#
# f.close()
# f2.close()
#
# #I then execute a Stored procedure to Load the data from the pipe delimited text file
# cur.execute("EXEC yahoo_ff_roster_load")
# cur.commit()
