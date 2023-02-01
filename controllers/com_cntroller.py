from user.user import User, db
from main import app
from flask import json, jsonify, request
import bcrypt

@app.route('/',methods=["GET"])
def home():
    dumm = User()
    User.addNewUser(dumm)
    return "Hello World"

@app.route('/login',methods=["POST"])
def login():
    
    email = request.json['email']
    password = request.json['password']

    all = User.query.all()
    print(all)
    login = User.query.filter_by(email = email).first()
    print("Inside login route")

    if login is not None:
        print("Login not empty")
        if(bcrypt.checkpw(password=password.encode('utf-8'),hashed_password=login.password.encode('utf-8'))):
            print("User success")
            return jsonify(['Success'])
        else:
            print("Unsuccessfull")
            return jsonify(['Wrong password'])
    else:
        print("User doesn't exists")
        return jsonify(['Username not allowed'])
