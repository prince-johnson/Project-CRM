from flask import Blueprint, render_template, request, flash, redirect, url_for
from flask_login import current_user, login_user
from website import views, auth
from .models import Users, ActivityLog
from . import db
from werkzeug.security import generate_password_hash, check_password_hash
import json
from sqlalchemy import update

auth = Blueprint('auth', __name__)


@auth.route('/' , methods=['GET','POST'])
def login():
    if request.method == "POST":
        userEmail = request.form.get('userEmail')
        userPassword = request.form.get('userPassword')

        user = Users.query.filter_by(userEmail=userEmail).first()
        if user:
            if user.userNew == 0:
                if user.userPassword == 'password':
                    print(userEmail)
                    return redirect(url_for('auth.changepassword'))
            elif check_password_hash(user.userPassword,userPassword):
                login_user(user, remember=True)
                print("logged in successfully!")
                userId = user.userId
                new_log = ActivityLog(userId=userId)
                db.session.add(new_log)
                db.session.commit()

                # roleId = 1 for admin, 2 for user

                if user.userRoleId == 1:
                    return redirect(url_for('views.dashboard'))
                elif user.userRoleId == 2:
                    return redirect(url_for('userviews.dashboard'))

            else:
                err_res = "Invalid E-mail or password"
                print(err_res)
                err = True
                flash(err)
                return render_template("login.html", user=current_user, err = err, err_res = err_res)
        else:
            err_res = "Email does not exist!"
            err = True
            flash(err)
            return render_template("login.html", user=current_user, err = err, err_res = err_res)
        
    return render_template("login.html", user=current_user, err=False, err_res="")

@auth.route('/register' , methods=['GET','POST'])
def register():
    if request.method == "POST":

        userRoleId = 2 # 1- for admin, 2- for user
        userCode = f"USER0{len(Users.query.all())+1}"
        userEmail = request.form.get('userEmail')
        userName = request.form.get('userName')
        userPassword = request.form.get('userPassword')
        userCountry = request.form.get('userCountry')
        userPhone = request.form.get('userPhone')
        userState = request.form.get('userState')
        userCity = request.form.get('userCity')
        userNew = 1
        userStatus = 1
        
        user = Users.query.filter_by(userEmail=userEmail).first()
        if user:
            print("Email already exists")
            err_res = "Email already exists"
            err = True
            flash(err)
            return render_template("register.html", user=current_user, err = err, err_res = err_res)
            
        elif len(userPassword) < 7:
            print('Password must be atleast 7 characters')
        else:
            #userCode = "USER0" + f"{Users.userId}" 
            print(userCode)
            new_user = Users(userCode=userCode, userRoleId=userRoleId,userEmail=userEmail, userPhone=userPhone, userName = userName, userPassword = generate_password_hash(userPassword, method = 'sha256'), userCity=userCity, userCountry=userCountry, userState = userState, userNew=userNew, userStatus=userStatus)

            db.session.add(new_user)
            db.session.commit()
            print('Account created!')
            return redirect(url_for('userviews.dashboard'))
    return render_template("register.html", user = current_user)

@auth.route('/changepassword' , methods=['GET','POST'])
def changepassword():
    if request.method == 'POST':
        values = json.loads(request.data)
        email = values['email']
        print(email)
        password = values['pass']
        user = Users.query.filter_by(userEmail=email).first()
        if user:
            # # user.userId = current_user.userId
            # user.userCode = current_user.userCode
            # user.userName = current_user.userName
            user.userPassword = generate_password_hash(password)
            # user.userEmail = email
            # user.userRoleId = current_user.userRoleId
            # user.userPhone = current_user.userPhone
            # user.userCountry = current_user.userCountry
            # user.userState = current_user.userState
            # user.userCity = current_user.userCity
            user.userNew = 1
            # user.userStatus = 1
            db.session.add(user)
            db.session.commit()
            return redirect(url_for('auth.login'))
        else:
            print('Email not registered!')
            return redirect(url_for('auth.changepassword'))

    return render_template('changePass.html')
