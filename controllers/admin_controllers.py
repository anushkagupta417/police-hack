
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
        if(User.query.filter_by(email = em) is not None):
            resp = "User added successfully"
            # Send email code to be added

        return 
    
    else:
        resp = "User already exists, please login"
        return jsonify({"resp" : resp})
