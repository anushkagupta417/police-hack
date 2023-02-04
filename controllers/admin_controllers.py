
from user.user import User
from routes.admin_bp import admin_bp

from flask import request, json,jsonify,render_template,url_for

from .sendSignupEmail import SignUpEmail

@admin_bp.route("/addNewUser",methods = ['POST'])
def add_user():

    print("Entering")

    all = User.query.all()
    print(all)

    em = request.json['email']
    na = request.json['name']
    ro = request.json['role']

    exists = User.query.filter_by(email = em).first()

    if exists is None:
        print("New user")

        newUser = User.addUser(email=em,name=na,role=ro)

        User.addNewRecord(newUser)

        all = User.query.all()
        print(all)

        if(User.query.filter_by(email = em) is not None):
            print("db updated with new email")
            emSent = SignUpEmail(em)
            emSent.sendEmail()
            confirm_url = url_for('user_bp.signup_user',token = emSent.token)
            html = render_template('activate.html',confirm_url = confirm_url)
            emSent.send_email(to=em,subject = "Please confirm your email",template=html)

            if(emSent.status):
                print("Mail sent")
                resp = "User added successfully. Check inbox to sign up"
            else:
                resp = "Something went wrong"
    
    else:
        if exists.emVerified == True:
            resp = "User already exists, please login"
        else:
            resp = "Perfrom email verification from inbox"

    return jsonify({"resp" : resp})