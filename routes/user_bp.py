from flask import Blueprint

user_bp = Blueprint('user_bp',__name__)

from controllers.user_controllers import signup_user

user_bp.route("/confirm/<token>",methods = ["POST"])(signup_user)