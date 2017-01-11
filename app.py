import os
import pg
from flask import Flask, render_template, request, redirect, url_for, session
from weeklystats import *
import config

import sys
reload(sys)
sys.setdefaultencoding('utf8')


app = Flask(__name__)
app.secret_key = "herro"

@app.route('/')
def home():
    quarterback = Weeklystats.passing()

    return render_template("landing.html", p=query)
