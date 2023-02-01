from flask import Blueprint

from controllers.admin_controllers import add_user

admin_bp = Blueprint('admin_bp',__name__)

admin_bp.route("/addUser",methods = 'POST')(add_user)
