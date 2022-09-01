from flask import Blueprint, render_template, request, flash, redirect, url_for

from website import views
from .models import Users
from . import db
from werkzeug.security import generate_password_hash, check_password_hash
auth = Blueprint('auth', __name__)


@auth.route('/login' , methods=['GET','POST'])
def login():
    return render_template("login.html", boolean=True)

@auth.route('/register' , methods=['GET','POST'])
def register():
    if request.method == "POST":
        userId = request.form.get('userId')
        userEmail = request.form.get('userEmail')
        userName = request.form.get('first_name')
        userPassword = request.form.get('userPassword')
        userCountry = request.form.get('userCountry')
        userPhone = request.form.get('userPhone')
        userState = request.form.get('userState')
        userCity = request.form.get('userCity')
        
        if len(userPassword) < 7:
            flash('Password must be atleast 7 characters', category='error')
        else:
            new_user = Users(userId=1,userEmail=userEmail, userPhone=userPhone, userName = userName, userPassword = generate_password_hash(userPassword, method = 'sha256'), userCity=userCity, userCountry=userCountry, userState = userState)
            db.session.add(new_user)
            db.session.commit()
            flash('Account created!', category='success')
            return redirect(url_for(views.dashboard))
    return render_template("register.html")


