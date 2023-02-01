from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow

db = SQLAlchemy()
ma = Marshmallow()

# User Table Model
class User(db.Model):
  __tablename__ = "user"

  id = db.Column(db.Integer,primary_key = True,autoincrement = True)
  email=db.Column(db.String, unique = True)
  name = db.Column(db.String(100))
  phone = db.Column(db.String(10))
  role = db.Column(db.String(1))
  password = db.Column(db.String(100))
  designation = db.Column(db.String(25))
  emVerified = db.Column(db.Boolean,default = False)
  phVerified = db.Column(db.Boolean,default = False)

  def __init__(self,email,name,role) :
    self.email = email
    self.name = name
    self.role = role

  def __init__(self,email,name,phone,password) :
    self.email = email
    self.name = name
    self.phone = phone
    self.password = password

  def get_id(self):
    return self.id


class UserSchema(ma.Schema):
  class Meta:
    fields = ('id','email','name','password','phone','role','designation','emVerified','phVerified')

user_schema = UserSchema()
users_schema=UserSchema(many=True)