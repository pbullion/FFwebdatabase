import os
import pg
from flask import Flask, render_template, request, redirect, url_for, session
from fantasyclass import *
import stripe


import sys
reload(sys)
sys.setdefaultencoding('utf8')

# stripe_keys = {
#   'secret_key': os.environ['SECRET_KEY'],
#   'publishable_key': os.environ['PUBLISHABLE_KEY']
# }
#
# stripe.api_key = stripe_keys['secret_key']

app = Flask(__name__)
app.secret_key = "herro"

@app.route('/')
def home():
    receiving_result = Weeklystats.receiving()
    rushing_results = Weeklystats.rushing()
    quarterback_result = Weeklystats.passing()
    return render_template("landing.html",receiving_result=receiving_result,rushing_results=rushing_results,quarterback_result=quarterback_result)

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/premium')
def premium():
    return render_template('premium.html', key=stripe_keys['publishable_key'])

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

    return render_template('charge.html',key=stripe_keys['publishable_key'], amount=amount)

@app.route('/ownersftg')
def ownersftg():
    return render_template('ownersftg.html')

@app.route("/teamnamesftg")
def teamnamesftg(idowners):
    idowners = idowners
    result_list = Teams.get_team_list(idowners)
    return render_template("teamnamesftg.html",team_names=result_list,title="All Teams for")

@app.route("/membersftg")
def membersftg():
    result_list = Owners.getOwners()
    return render_template("ownersftg.html",result_list=result_list,title="Members of For the Girls")

if __name__ == "__main__":
    app.run(debug=True)
