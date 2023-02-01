
from user.user import User, db
from routes.admin_bp import admin_bp

from flask import request, json,jsonify

@admin_bp.route("/addNewUser",methods = ['POST'])
def add_user():
    em=request.json['email']
    na = request.json['name']
    ro = request.json['role']

    exists = User.query.filter_by(email = em).first()

    if exists is None:
        newUser = User(email=em,name=na,role=ro)
        User.addNewUser(newUser)

        return jsonify(['User added successfully, check inbox for registraion email'])
    
    else:

        return jsonify(['User already exists, please login'])
