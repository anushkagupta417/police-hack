from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import bcrypt

db = SQLAlchemy()
ma = Marshmallow()

# User Table Model
class User(db.Model):

  __tablename__ = "user"

  id = db.Column(db.Integer,primary_key = True,autoincrement = True)
  email=db.Column(db.String, unique = True)
  name = db.Column(db.String(100))
  phone = db.Column(db.String(10))
  role = db.Column(db.Boolean,default=False)
  password = db.Column(db.String(100))
  designation = db.Column(db.String(25))
  emVerified = db.Column(db.Boolean,default = False)
  phVerified = db.Column(db.Boolean,default = False)


  def __init__(self,email,name,role) :
    self.email = email
    self.name = name
    self.role = role

  def __init__(self,email,name,phone,password,emVerified) :
    self.email = email
    self.name = name
    self.phone = phone
    self.password = password
    self.emVerified = emVerified

  def __init__(self):
    
    self.id = 1
    self.email = "abc@gmail.com"
    self.name = "ABC"
    self.phone = "1234567809"
    self.role = True
    self.password = "!Sporthi1234"
    self.designation = "Student"
    self.password = bcrypt.hashpw(self.password.encode('utf-8'),bcrypt.gensalt()).decode('utf-8')

    return self

  def get_id(self):
    return self.id
  
  def addNewUser(record):
    db.session.add(record)
    db.session.commit()

class UserSchema(ma.Schema):
  class Meta:
    fields = ('id','email','name','password','phone','role','designation','emVerified','phVerified')

user_schema = UserSchema()
users_schema=UserSchema(many=True)
