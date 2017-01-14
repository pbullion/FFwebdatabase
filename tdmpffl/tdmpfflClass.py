# import json
# import pycurl
# import StringIO
# import urllib
# import mysql.connector
# import sys
import pg
import os
import nflgame
from config import *


class Owners(object):
    def __init__(self):
        self.name = ""
        self.yearstarted = 0
        self.yearended = 0
        self.idowners = 0
    @staticmethod
    def getOwners():
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        query = db.query("SELECT * FROM owners order by yearstarted asc")
        result_list = query.namedresult()
        db.close()
        print result_list
        return result_list
    @staticmethod
    def alltime():
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        query = db.query("select owner,sum(wins) wins,sum(loss) loss,idowners,ROUND(sum(wins)*1.0/sum(wins+loss)::numeric,4) percent from winloss group by owner,idowners order by percent desc")
        result_list = query.namedresult()
        db.close()
        return result_list
    @staticmethod
    def standings(year):
        year = year
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        db.debug = True
        query = db.query("select team,owner,sum(wins) wins,sum(loss) loss,idowners from winloss where year ='%s' group by team,owner,idowners order by sum(wins) desc" % year)
        result_list = query.namedresult()
        db.close()
        return result_list
    @staticmethod
    def topscores():
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        db.debug = True
        query = db.query("select year,week,teamone,teamonescore from schedule team1 where year=2016 union select year,week,teamtwo,teamtwoscore from schedule team1 where year=2016 order by 4 desc limit 5")
        result_list = query.namedresult()
        db.close()
        return result_list
    @staticmethod
    def lowscores():
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        db.debug = True
        query = db.query(
            "select year,week,teamone,teamonescore from schedule team1 where year=2016 union select year,week,teamtwo,teamtwoscore from schedule team1 where year=2016 order by 4 asc limit 5")
        result_list = query.namedresult()
        db.close()
        return result_list

#   @staticmethod
    # def owneryears(idowners):
    #     db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
    #     query = db.query("select 'year',sum(wins) wins,sum(loss) loss,idowners from winloss where idowners='%d' group by 'year',idowners order by year asc" % idowners)
    #     result_list = query.namedresult()
    #     db.close()
    #     return result_list

class Teams(object):
    def __init__(self,idowners=0):
        self.idteamnames=0
        self.teamname = ""
        self.yearstarted = 0
        self.yearended = 0
        self.idowners = idowners
    @staticmethod
    def get_team_list(idowners):
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        query = db.query("SELECT * FROM teamnames where idowners='%s' order by yearstarted asc" % idowners)
        result_list = query.namedresult()
        db.close()
        return result_list

    # working on stats for each team
    # @staticmethod
    # def get_team_list(idowners):
    #     db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
    #     query = db.query("SELECT * FROM teamnames left join where idowners='%s' order by yearstarted asc" % idowners)
    #     result_list = query.namedresult()
    #     db.close()
    #     return result_list

class Weeklystats():
    def passing():
        games = nflgame.games(2016, week=16)
        players = nflgame.combine_game_stats(games)
        for p in players.passing().sort('passing_yds').limit(5):
            msg = '%s %d of %d passing for %d yards and %d TDs'
            print msg % (p, p.passing_comp, p.passing_att, p.passing_yds, p.passing_tds)

    def receiving():
        games = nflgame.games(2016, week=16)
        players = nflgame.combine_game_stats(games)
        for p in players.receiving().sort('receiving_yds').limit(5):
            msg = '%s %d catches for %d yards and %d TDs'
            print msg % (p, p.receiving_rec, p.receiving_yds, p.receiving_tds)

    def rushing():
        games = nflgame.games(2016, week=14)
        players = nflgame.combine_game_stats(games)
        for p in players.rushing().sort('rushing_yds').limit(5):
            msg = '%s %d carries for %d yards and %d TDs'
            print msg % (p, p.rushing_att, p.rushing_yds, p.rushing_tds)



# class Database(object):
#     @staticmethod
#     def getConnection():
#         db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
#         return
#     @staticmethod
#     def escape(value):
#         return value.replace("'","''")
#     @staticmethod
#     def getResult(query,getOne=False):
#
#         Cursor.close()
#         return result_set
#     @staticmethod
#     def doQuery(query):
#         conn = Database.getConnection()
#         cur = conn.cursor()
#         cur.execute(query)
#         conn.commit()
#         lastId = cur.lastrowid
#         cur.close()
#         conn.close()
#         return lastId