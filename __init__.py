import os, sys
import pg
from flask import Flask, render_template, request, redirect, url_for, session
from fantasyclass import *
import stripe
from config import *

import sys
reload(sys)
sys.setdefaultencoding('utf8')

# stripe_keys = {
#   'secret_key': ['SECRET_KEY'],
#   'publishable_key':['PUBLISHABLE_KEY']
# }
secret_key = SECRET_KEY
publishable_key = PUBLISHABLE_KEY


stripe.api_key = secret_key

app = Flask(__name__)
app.config['SECRET_KEY'] = os.environ.get('SECRET_KEY', 'herro')

@app.route('/')
def home():
    print(session)
    receiving_result = Weeklystats.receiving()
    rushing_results = Weeklystats.rushing()
    quarterback_result = Weeklystats.passing()
    return render_template("landing.html",receiving_result=receiving_result,rushing_results=rushing_results,quarterback_result=quarterback_result,session=session)

@app.route('/submitlogin', methods=['POST', 'GET'])
def submitlogin():
   session['loggedin'] = False
   username = request.form.get('username')
   password = request.form.get('password')
   query = db.query("SELECT * FROM userinfo WHERE username = '%s'" % username)
   results = query.namedresult()
   # if we find a user with the username
   if len(results) > 0:
       user = results[0]

       #if the password matches
       if user.password == password:
           session['username'] = username
           session['firstname'] = user.firstname
           session['lastname'] = user.lastname
           session['loggedin'] = True
           return redirect('/')
       else:
           #found user but wrong password
           message="Invalid username or password"
           return render_template('login.html',message=message)
   else:
       #invalid username (or password)
       message="Invalid username or password"
       return render_template('login.html',message=message)

@app.route('/register', methods=['POST', 'GET'])
def register():
  username = request.form.get('username')
  password = request.form.get('password')
  firstname = request.form.get('firstname')
  lastname = request.form.get('lastname')
  leaguesite = request.form.get('leaguesite')
  leagueID = request.form.get('leagueID')
  leaguename = request.form.get('leaguename')
  q = "INSERT INTO public.userinfo (firstname, lastname, username, password, leaguesite, \"leagueID\", leaguename) values ('%s','%s','%s','%s','%s','%s','%s')" % (firstname, lastname, username, password, leaguesite, leagueID, leaguename)
  query = db.query(q)
  session['username'] = username
  return redirect('/')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/login')
def login():
    return render_template('login.html',message=message)

@app.route('/logout')
def logout():
    print("about to logout")
    if session.get('loggedin'):
        session['loggedin']=False
    if session.get('firstname'):
        del session['firstname']
    if session.get('lastname'):
        del session['lastname']
    if session.get('username'):
        del session['username']
    print session
    return redirect('/')

@app.route('/premium')
def premium():
    return render_template('premium.html', key=publishable_key)

@app.route('/charge', methods=['POST'])
def charge():
    # Amount in cents
    amount = 5000
    customer = stripe.Customer.create(
        email='customer@example.com',
        source=request.form['stripeToken']
    )
    #  uncomment when site is ready to accept charges :)
    # charge = stripe.Charge.create(
    #     customer=customer.id,
    #     amount=amount,
    #     currency='usd',
    #     description='Flask Charge'
    # )

    return render_template('charge.html',key=publishable_key, amount=amount)

@app.route('/hometdmpffl')
def hometdmpffl():
    if session['loggedin'] == True:
        top_list = Owners.topscores()
        low_list = Owners.lowscores()
        return redirect("http://www.tdmpffl.com")
    else:
        return render_template("login.html", message=" Please log in to continue:")

@app.route('/homeftg')
def homeftg():
    if session['loggedin'] == True:
        top_list = Owners.topscores()
        low_list = Owners.lowscores()
        return render_template("homeftg.html",top_list=top_list,low_list=low_list)
    else:
        return render_template("login.html", message=" Please log in to continue:")

@app.route("/teamnamesftg")
def teamnamesftg(idowners):
    idowners = idowners
    result_list = Teams.get_team_list(idowners)
    return render_template("teamnamesftg.html",team_names=result_list,title="All Teams for")

@app.route("/<year>/standingsftg")
def standingsftg(year):
    result_list = Owners.standings(year)
    return render_template("standingsftg.html",title="Standings",result_list=result_list)

@app.route("/ownersftg")
def ownersftg():
    result_list = Owners.getOwners()
    return render_template("ownersftg.html",result_list=result_list,title="Members of For the Girls")

@app.route("/alltimeftg")
def alltime():
    result_list = Owners.alltime()
    return render_template("alltimeftg.html",result_list=result_list,title="All time stats")

if __name__ == "__main__":
    app.run(debug=True)
