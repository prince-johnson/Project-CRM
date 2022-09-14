from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from os import path
from flask_login import LoginManager

db = SQLAlchemy() 
#DB_NAME = "database.db"


#DB_NAME = "chummaveruthe"
#DB_NAME = "CMS"

DB_NAME = "ProjectCRM-2"



SQL_SERVER_USER_PASS_IP_PORT = 'sa:123@192.168.5.74:1891' # change this to your own

#SQL_SERVER_USER_PASS_IP_PORT = 'DESKTOP-5AA8MOJ\MSSQLSERVER01'
# SQL_SERVER_USER_PASS_IP_PORT = 'LAPTOP-85QRUTE7\SQLEXPRESS' #prince
#SQL_SERVER_USER_PASS_IP_PORT = 'LAPTOP-R5LS4JCT\SQLEXPRESS' #ajmi
#SQL_SERVER_USER_PASS_IP_PORT = 'DESKTOP-CJEOG7N\SQLEXPRESS' #ajmi


basedir = path.abspath(path.dirname(__file__))

def create_app():
    app = Flask(__name__)
    # encrypts the cookie data
    # app.config['SQLALCHEMY_DATABASE_URI'] = r'mssql+pyodbc://sa:123@192.168.5.152:1891/chummaveruthe?driver=SQL+Server+Native+Client+11.0'.format(SQL_SERVER_USER_PASS_IP_PORT, DB_NAME)
    
    app.config['SQLALCHEMY_DATABASE_URI'] = r'mssql+pyodbc://{}/{}?driver=SQL+Server+Native+Client+11.0'.format(SQL_SERVER_USER_PASS_IP_PORT, DB_NAME)
    print("server connected!")
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = "123"
    db.init_app(app)

    from .views import views
    from .auth import auth
    from .userviews import userviews

    app.register_blueprint(views, url_prefix='/admin')
    app.register_blueprint(auth, url_prefix='/')
    app.register_blueprint(userviews, url_prefix='/user')

    from .models import Users
    
    #create_database(app)

    login_manager = LoginManager()
    login_manager.login_view = 'auth.login'
    login_manager.init_app(app)

    @login_manager.user_loader
    def load_user(id):
        return Users.query.get(int(id))

    return app


# def create_database(app):
#     # check if mssql database exists or not
#     db.create_all(app=app)
#     print('Created Database!')