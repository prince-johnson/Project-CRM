from flask import Blueprint, render_template, request, flash, redirect, url_for
from flask_login import current_user, login_user
from website import views
from .models import Users, ActivityLog
from . import db
from werkzeug.security import generate_password_hash, check_password_hash
auth = Blueprint('auth', __name__)


@auth.route('/' , methods=['GET','POST'])
def login():
    if request.method == "POST":
        userEmail = request.form.get('userEmail')
        userPassword = request.form.get('userPassword')

        user = Users.query.filter_by(userEmail=userEmail).first()
        if user:
            if check_password_hash(user.userPassword,userPassword):
                login_user(user, remember=True)
                print("logged in successfully!")
                userId = user.userId
                new_log = ActivityLog(userId=userId)
                db.session.add(new_log)
                db.session.commit()
                if user.userRoleId == 2:
                    return redirect(url_for('views.dashboard'))
                elif user.userRoleId == 1:
                    return redirect(url_for('userviews.dashboard'))

            else:
                print("Incorrect password")
        else:
            print("Email does not exist!")
        
    return render_template("login.html", user=current_user)

@auth.route('/register' , methods=['GET','POST'])
def register():
    if request.method == "POST":
        userRoleId = 1
        userEmail = request.form.get('userEmail')
        userName = request.form.get('userName')
        userPassword = request.form.get('userPassword')
        userCountry = request.form.get('userCountry')
        userPhone = request.form.get('userPhone')
        userState = request.form.get('userState')
        userCity = request.form.get('userCity')
        # userNew = 1
        # userCode = "CRM" + f"{len(Users.query.all()):03}"
        
        user = Users.query.filter_by(userEmail=userEmail).first()
        if user:
            print("Email already exists")
        elif len(userPassword) < 7:
            print('Password must be atleast 7 characters')
        else:
            new_user = Users(userRoleId=userRoleId,userEmail=userEmail, userPhone=userPhone, userName = userName, userPassword = generate_password_hash(userPassword, method = 'sha256'), userCity=userCity, userCountry=userCountry, userState = userState)
            db.session.add(new_user)
            db.session.commit()
            print('Account created!')
            return redirect(url_for('views.dashboard'))
    return render_template("register.html", user = current_user)


