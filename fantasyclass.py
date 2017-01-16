import nflgame
import os
import pg
from config import *


db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)


class Login:
    def __init__(self, username):
        self.username = username
        self.kpassword = password
        query = "SELECT username, password FROM userinfo where username= '%s'" % username
        result_set= Database.getResult(query, True)

    def login(self,password):
        if result_list and len(result_list) > 0:
            user = result_list[0]
            if password == user.password:
                #successfully logged in
                session['username'] = user.username
        return loginsuccess

    def logout(self):
        del session['username']

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

class Teams(object):
    def __init__(self,idowners=0):
        self.idteamnames=0
        self.teamname = ""
        self.yearstarted = 0
        self.yearended = 0
        self.idowners = idowners

    @staticmethod
    def get_team_list(idowners):
        # db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        query = db.query("SELECT * FROM teamnames where idowners='%s' order by yearstarted asc" % idowners)
        result_list = query.namedresult()
        db.close()
        return result_list

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
        query = db.query("SELECT owner,sum(wins) wins,sum(loss) loss,idowners,ROUND(sum(wins)*1.0/sum(wins+loss)::numeric,4) percent from winloss group by owner,idowners order by percent desc")
        result_list = query.namedresult()
        db.close()
        return result_list
    @staticmethod
    def standings(year):
        year = year
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        db.debug = True
        query = db.query("SELECT team,owner,sum(wins) wins,sum(loss) loss,idowners from winloss where year ='%s' group by team,owner,idowners order by sum(wins) desc" % year)
        result_list = query.namedresult()
        db.close()
        return result_list
    @staticmethod
    def topscores():
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        db.debug = True
        query = db.query("SELECT year,week,teamone,teamonescore from schedule team1 where year=2016 union select year,week,teamtwo,teamtwoscore from schedule team1 where year=2016 order by 4 desc limit 5")
        result_list = query.namedresult()
        db.close()
        return result_list
    @staticmethod
    def lowscores():
        db = pg.DB(host=DBHOST, user=DBUSER, passwd=DBPASS, dbname=DBNAME)
        db.debug = True
        query = db.query(
            "SELECT year,week,teamone,teamonescore from schedule team1 where year=2016 union select year,week,teamtwo,teamtwoscore from schedule team1 where year=2016 order by 4 asc limit 5")
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
