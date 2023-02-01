from user.user import User, db
from main import app
from flask import json, jsonify, request
import bcrypt

@app.route('/',methods=['GET'])
def home():
    return "Hello World"

@app.route('/login',methods=['POST'])
def login():
    email = request.json['email']
    password = request.json['password']

    login = User.query.filter_by(email = email).first()

    if login is not None:
        if(bcrypt.checkpw(password=password.encode('utf8'),hashed_password=login.password)):
            return jsonify(['Success'])
        else:
            return jsonify(['Wrong password'])
