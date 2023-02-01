from flask import Flask, request, jsonify
from flask_migrate import Migrate

app = Flask(__name__)
app.config.from_object('config')

from routes.user_bp import user_bp
from routes.admin_bp import admin_bp
from controllers.com_cntroller import home,login
from user.user import User,db

db.init_app(app)
migrate = Migrate(app,db)

app.register_blueprint(user_bp, url_prefix = '/user')
app.register_blueprint(admin_bp, url_prefix = '/admin')


app.route('/',methods=['GET'])(home)
app.route('/login',methods=['POST'])(login)


if __name__=='__main__':
  app.run(debug=True,port=5000)




# # Show All User
# @app.route('/user',methods=['GET'])
# def getAllUser():
#   all_users=User.query.all()
#   result=users_schema.dump(all_users)
#   return jsonify(result)

# # Show User By ID
# @app.route('/user/<id>',methods=['GET'])
# def getUserByid(id):
#   user=User.query.get(id)
#   return user_schema.jsonify(user)


# # Update User By ID
# @app.route('/user/<id>',methods=['PUT'])
# def UpdateUser(id):
#   user=User.query.get(id)
#   name=request.json['name']
#   contact=request.json['contact']
#   user.name=name
#   user.contact=contact
#   db.session.commit()
#   return user_schema.jsonify(user)

# # Delete User By ID
# @app.route('/user/<id>',methods=['DELETE'])
# def DeleteUserById(id):
#   user=User.query.get(id)
#   db.session.delete(user)
#   db.session.commit()
#   return user_schema.jsonify(user)