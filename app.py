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
    receiving_result = Weeklystats.receiving()
    rushing_results = Weeklystats.rushing()
    quarterback_result = Weeklystats.passing()
    return render_template("landing.html",receiving_result=receiving_result,rushing_results=rushing_results,quarterback_result=quarterback_result)


if __name__ == "__main__":
    app.run(debug=True)
