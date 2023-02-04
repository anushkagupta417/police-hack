from flask import Blueprint
admin_bp = Blueprint('admin_bp',__name__)

from controllers.admin_controllers import add_user

admin_bp.route("/addNewUser",methods = ['POST'])(add_user)
