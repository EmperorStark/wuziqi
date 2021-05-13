from flask import Flask, render_template, request, jsonify
from flask_restful import Resource, Api,reqparse

app = Flask(__name__, static_url_path="", static_folder="static")

@app.route('/')
def home():
    return render_template("wuziqi.html")

app.run()