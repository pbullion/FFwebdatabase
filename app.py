import os
import pg
from flask import Flask, render_template, request, redirect, url_for, session
from weeklystats import *


import sys
reload(sys)
sys.setdefaultencoding('utf8')


app = Flask(__name__)
app.secret_key = "herro"

@app.route('/')
def home():
<<<<<<< HEAD
    receiving_result = Weeklystats.receiving()
    return render_template("landing.html",receiving_result=receiving_result)


if __name__ == "__main__":
    app.run(debug=True)
=======
    quarterbacks_list = Weeklystats.passing()
    receiving_list = Weeklystats.passing()
    rushing_list = Weeklystats.rushing()
    return render_template("landing.html", quarter=quarterbacks_list, receiving = receiving_list)
>>>>>>> origin/master
