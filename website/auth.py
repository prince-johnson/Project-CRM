from flask import Blueprint, render_template, request
auth = Blueprint('auth', __name__)


@auth.route('/login#loginUser' , methods=['GET','POST']) #
def login():
    data =  request.form
    print(data)
    return render_template("login.html")

@auth.route('/login#registerUser' , methods=['GET','POST']) #
def register():
    data =  request.form
    print(data)
    return render_template("login.html")
#make two different pages for login and resistrations

