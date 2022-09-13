from tkinter.tix import ROW
from flask import Blueprint, render_template, request, jsonify, url_for, redirect, flash
from . import db
from .models import Category, Batches, Courses, Enquiries, Users, Qualifications, ActivityLog, Instructor
import json
from sqlalchemy import func, Date, desc
from datetime import date
from flask_login import login_user, login_required, logout_user, current_user
from functools import wraps

ROWS_PER_PAGE = 5


def admin_required(func):
    @wraps(func)
    def isadmin(*args,**kwargs):
        if(current_user.userRoleId != 1):
            return render_template('warning.html')
        return func(*args,**kwargs)
    return isadmin

views = Blueprint('views', __name__)

categories =[]
batches =[]
enquiries = []

def get_instructor_dict():
    instructor_dict = {}
    instructors = Instructor.query.all()
    for instructor in instructors:
        instructor_dict[instructor.instructorId] = instructor.instructorName
    return instructor_dict

def get_category_dict():
    category_dict = {}
    categories = Category.query.all()
    for category in categories:
        category_dict[category.categoryId] = category.categoryName
    return category_dict

def get_qualification_dict():
    qualification_dict = {}
    qualifications = Qualifications.query.all()
    for qualification in qualifications:
        qualification_dict[qualification.qualificationId] = qualification.qualificationName
    return qualification_dict   

#dashboard
@views.route('/dashboard')
@login_required
@admin_required
def dashboard():
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    dates = ActivityLog.query.with_entities(func.cast(ActivityLog.time, Date).label('Date'), func.count(ActivityLog.userId).label('logincount')).group_by(func.cast(ActivityLog.time, Date)).order_by('Date').paginate(page=page, per_page=ROWS_PER_PAGE)
    # dates = ActivityLog.query(cast(ActivityLog.time, Date)).distinct().all()
    return render_template('dashboard.html', obj=dates,dates=dates, user=current_user, url_fn='views.dashboard')

#user
@views.route('/users', methods=['GET', 'POST'])
@login_required
@admin_required
def  users():
    page = request.args.get('page', 1, type=int)
    users = Users.query.order_by(Users.userId).paginate(page=page, per_page=ROWS_PER_PAGE)
    if request.method == 'POST':
        last_user = Users.query.order_by(Users.userId.desc()).first()
        userCode = f"USER{last_user.userId+1}"
        userName = request.form.get('userName')
        userPassword = 'password'
        userEmail = request.form.get('userEmail')
        userRoleId = request.form.get('userRole')
        userPhone = request.form.get('userPhone')
        userCountry = request.form.get('userCountry')
        userState = request.form.get('userState')
        userCity = request.form.get('userCity')
        userNew = 0
        userStatus = 1
        new_user = Users(userCode=userCode, userName=userName, userEmail=userEmail, userPassword=userPassword, userRoleId=userRoleId, userPhone=userPhone, userCountry=userCountry, userState=userState, userCity=userCity, userNew=userNew, userStatus=userStatus)
        db.session.add(new_user)
        db.session.commit()
        flash('User added!', category='success')
    if request.args.get('roles') :
        print(request.args.get('roles').split(','))
        listAll = False
        users = Users.query.filter(Users.userRoleId.in_(request.args.get('roles').split(','))).order_by(Users.userId).paginate(page=page, per_page=ROWS_PER_PAGE)
        if len(request.args.get('roles').split(',')) == 2:
            listAll = True
        elif request.args.get('roles').split(',') == ['']:
            listAll = True
            users = Users.query.order_by(Users.userId).paginate(page=page, per_page=ROWS_PER_PAGE)
        return render_template('users.html', user=current_user, users=users, listAll=listAll)
    return render_template('users.html', user=current_user, users=users, listAll=True)

# Search user
@views.route('/users/<searchBy>/<searchConstraint>')
@login_required
@admin_required
def searchUser(searchBy, searchConstraint):
    page = request.args.get('page', 1, type=int)
    if searchBy == 'id':
        users = Users.query.filter(Users.userId.like("%"+searchConstraint+"%")).order_by(Users.userId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        users = Users.query.filter(Users.userName.like("%"+searchConstraint+"%")).order_by(Users.userId).paginate(page=page, per_page=ROWS_PER_PAGE)
    return render_template('users.html', user=current_user, users=users, listAll=False)

#batches
@views.route('/batches', methods=['GET', 'POST'])
@login_required
@admin_required
def batches():
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if request.method == 'POST':
        batchId = "BA" + f"{(len(Batches.query.all()) + 1):03}"
        batchName = request.form.get('batchName')
        batchStrength = int(request.form.get('batchStrength'))
        batchCourseId = request.form.get('batchCourseId')
        batchStatus = bool(request.form.get('batchStatus'))
        batchStartDate = request.form.get('batchStartDate')
        batchEndDate = request.form.get('batchEndDate')
        print(batchStatus)
        new_batch = Batches(batchId=batchId,batchName=batchName,batchStrength=batchStrength,batchCourseId=batchCourseId,batchStatus=batchStatus,batchStartDate=batchStartDate,batchEndDate=batchEndDate)
        db.session.add(new_batch)
        db.session.commit()
    batches = Batches.query.order_by(Batches.batchId).paginate(page=page, per_page=ROWS_PER_PAGE)
    courses = Courses.query.with_entities(Courses.courseId, Courses.courseName).distinct().all()
    categories = Category.query.with_entities(Category.categoryId, Category.categoryName).distinct().all()
    if request.args.get('status') :
        print(request.args.get('status').split(','))
        listAll = False
        batches = Batches.query.filter(Batches.batchStatus.in_((request.args.get('status')).split(','))).order_by(Batches.batchId).paginate(page=page, per_page=ROWS_PER_PAGE)
        if len(request.args.get('status').split(',')) == 2:
            listAll = True
        elif request.args.get('status').split(',') == ['']:
            listAll = True
            batches = Batches.query.order_by(Batches.batchId).paginate(page=page, per_page=ROWS_PER_PAGE)
        return render_template('batches.html',user=current_user, batches=batches, listAll=listAll, courses=courses, categories=categories)
    return render_template('batches.html',user=current_user, batches=batches, listAll=True, courses=courses, categories=categories)

#delete batch
@views.route('/batches/<batchId>', methods=['DELETE'])
@login_required
@admin_required
def deleteBatch(batchId):
    batch = Batches.query.filter_by(batchId=batchId).first()
    if batch:
        db.session.delete(batch)
        db.session.commit()
    return jsonify({})

#edit batch
@views.route('/batches/<batchId>', methods=['PUT', 'PATCH'])
@login_required
@admin_required
def editBatch(batchId):
    batch = Batches.query.filter_by(batchId = batchId).first()
    print(batch)
    value = json.loads(request.data)
    # batch.batchId = value['batchId']
    # batch.batchName = value['batchName']
    batch.batchStrength = value['batchStrength']
    # batch.batchCourseId = value['batchCourseId']
    batch.batchStatus = value['batchStatus']
    # batch.batchStartDate = value['batchStartDate']
    # batch.batchEndDate = value['batchEndDate']
    print(value)
    db.session.add(batch)
    db.session.commit()
    return jsonify({})

#search batch
@views.route('/batches/<searchBy>/<searchConstraint>')
@login_required
@admin_required
def searchBatch(searchBy, searchConstraint):
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    if searchBy == 'id':
        batches = Batches.query.filter(Batches.batchId.like("%"+searchConstraint+"%")).order_by(Batches.batchId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        batches = Batches.query.filter(Batches.batchName.like("%"+searchConstraint+"%")).order_by(Batches.batchId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'date':
        dateList = searchConstraint.split()
        print(dateList)
        searchConstraint = dateList[2] + "-" + f"{(months.index(dateList[0])+1):02}" + "-" + f"{dateList[1][:-1]:02}"
        print(searchConstraint)
        batches = Batches.query.filter(Batches.batchStartDate.like("%"+searchConstraint+"%")).order_by(Batches.batchId).paginate(page=page, per_page=ROWS_PER_PAGE)
    return render_template('batches.html',user=current_user, batches=batches, listAll=False)

#enquiry
@views.route('/enquiries', methods=['GET', 'POST'])
@login_required
@admin_required
def enquiries():
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if request.method == 'POST':
        enquiryId = request.form.get('enquiryId')
        enquiryUserId = request.form.get('enquiryUserId')
        enquiryCourseId = request.form.get('enquiryCourseId')
        enquiryStatus = bool(request.form.get('enquiryStatus'))
        enquiryDescription = request.form.get('enquiryDescription')
        enquiryUpdate = request.form.get('enquiryUpdate')
        print(enquiryId, enquiryUserId, enquiryStatus, enquiryDescription,enquiryUpdate)
        new_enquiry = Enquiries(enquiryId=enquiryId, enquiryUserId=enquiryUserId, enquiryCourseId=enquiryCourseId, enquiryStatus=enquiryStatus, enquiryDescription=enquiryDescription,enquiryUpdate=enquiryUpdate)
        db.session.add(new_enquiry)
        db.session.commit()
    enquiries=Enquiries.query.order_by(Enquiries.enquiryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    courses = Courses.query.with_entities(Courses.courseId, Courses.courseName).distinct().all()
    users = Users.query.with_entities(Users.userId).distinct().all()
    enquiryStatus = Enquiries.query.with_entities(Enquiries.enquiryStatus).distinct().all()
    return render_template('enquiries.html',user=current_user, enquiries=enquiries, listAll=True, users=users, courses=courses, enquiryStatus=enquiryStatus)

# #delete enquiry
# @views.route('/enquiries/<enquiryId>', methods=['DELETE'])
# @login_required
# @admin_required
# def deleteEnquiry(enquiryId):
#     enquiry = Enquiries.query.get(enquiryId)
#     if enquiry:
#         db.session.delete(enquiry)
#         db.session.commit()
#     return jsonify({})

#serach enquiry
@views.route('/enquiries/<searchBy>/<searchConstraint>')
@login_required
@admin_required
def searchEnquiry(searchBy, searchConstraint):
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    courses = Courses.query.with_entities(Courses.courseId, Courses.courseName).distinct().all()
    if searchBy == 'id':
        enquiries = Enquiries.query.filter(Enquiries.enquiryCode.like("%"+searchConstraint+"%")).order_by(Enquiries.enquiryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'uid':
        enquiries = Enquiries.query.filter(Enquiries.enquiryUserId.like("%"+searchConstraint+"%")).order_by(Enquiries.enquiryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        enquiries = Enquiries.query.filter(Enquiries.enquiryCourseId.like("%"+searchConstraint+"%")).order_by(Enquiries.enquiryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    
    return render_template('enquiries.html',user=current_user, enquiries=enquiries, courses=courses, listAll=False)

# Edit enquiry
@views.route('/enquiries/<enquiryId>', methods=['PUT', 'PATCH'])
@login_required
@admin_required
def editEnquiry(enquiryId):
    enquiry = Enquiries.query.get_or_404(enquiryId)
    value = json.loads(request.data)
    enquiry.enquiryUserId = value['enquiryUserId']
    enquiry.enquiryCourseId = value['enquiryCourseId']
    enquiry.enquiryDescription = value['enquiryDescription']
    enquiry.enquiryStatus = bool(value['enquiryStatus'])
    db.session.add(enquiry)
    db.session.commit()
    print(value)
    return jsonify({})

#categories
@views.route('/categories', methods=['GET', 'POST'])
@login_required
@admin_required
def categories():
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if request.method == 'POST':
        #batchId = "BA" + f"{(len(Batches.query.all())):03}"
        categoryId = len(Category.query.all()) + 1
        categoryName = request.form.get('categoryName')
        categoryStatus = bool(request.form.get('categoryStatus'))
        categoryComments = request.form.get('categoryComments')
        print(categoryId, categoryName, categoryStatus, categoryComments)
        new_category = Category(categoryId=categoryId, categoryName=categoryName, categoryStatus=categoryStatus, categoryComments=categoryComments)
        db.session.add(new_category)
        db.session.commit()
    categories=Category.query.order_by(Category.categoryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    return render_template('categories.html',user=current_user, categories=categories, listAll=True)

#delete category
@views.route('/categories/<categoryId>', methods=['DELETE'])
@login_required
@admin_required
def deleteCategory(categoryId):
    category = Category.query.get(categoryId)
    if category:
        db.session.delete(category)
        db.session.commit()
    return jsonify({})

#search category
@views.route('/categories/<searchBy>/<searchConstraint>')
@login_required
@admin_required
def searchCategory(searchBy, searchConstraint):
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if searchBy == 'id':
        categories = Category.query.filter(Category.categoryId.like("%"+searchConstraint+"%")).order_by(Category.categoryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        categories = Category.query.filter(Category.categoryName.like("%"+searchConstraint+"%")).order_by(Category.categoryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    return render_template('categories.html', user=current_user, categories=categories, listAll=False)

#edit category
@views.route('/categories/<categoryId>', methods=['PUT','PATCH'])
@login_required
@admin_required
def editCategory(categoryId):
    category = Category.query.get_or_404(categoryId)
    value = json.loads(request.data)
    category.categoryId=int(value['categoryId'])
    category.categoryName=value['categoryName']
    category.categoryStatus=value['categoryStatus']
    category.categoryComments=value['categoryComments']
    db.session.add(category)
    db.session.commit()
    return jsonify({})

#qualifications
@views.route('/qualification', methods=['GET', 'POST'])
@login_required
@admin_required
def qualifications():
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if request.method == 'POST':
        # qualificationId = qualificationId
        qualificationName = request.form.get('qualificationName')
        qualificationStatus = bool(request.form.get('qualificationStatus'))
        print( qualificationName, qualificationStatus)
        new_qualification = Qualifications(qualificationName=qualificationName, qualificationStatus=qualificationStatus)
        db.session.add(new_qualification)
        db.session.commit()
    qualifications=Qualifications.query.order_by(Qualifications.qualificationId).paginate(page=page, per_page=ROWS_PER_PAGE)
    return render_template('qualification.html',user=current_user,qualifications=qualifications, listAll=True)

#delete qualification
@views.route('/qualification/<qualificationId>', methods=['DELETE'])
@login_required
@admin_required
def deleteQualification(qualificationId):
    qual = Qualifications.query.get(qualificationId)
    if qual:
        db.session.delete(qual)
        db.session.commit()
    return jsonify({})

#search qualifiactaion
@views.route('/qualification/<searchBy>/<searchConstraint>')
@login_required
@admin_required
def searchQualification(searchBy, searchConstraint):
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if searchBy == 'id':
        qualifications = Qualifications.query.filter(Qualifications.qualificationId.like("%"+searchConstraint+"%")).order_by(Qualifications.qualificationId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        qualifications = Qualifications.query.filter(Qualifications.qualificationName.like("%"+searchConstraint+"%")).order_by(Qualifications.qualificationId).paginate(page=page, per_page=ROWS_PER_PAGE)
    return render_template('qualification.html', user=current_user, qualifications=qualifications, listAll=False)

#edit qualifiaction
@views.route('/qualification/<qualificationId>', methods=['PUT','PATCH'])
@login_required
@admin_required
def editQualification(qualificationId):
    qual = Qualifications.query.get_or_404(qualificationId)
    value = json.loads(request.data)
    qual.qualificationName=value['qualificationName']
    qual.qualificationStatus=bool(value['qualificationStatus'])
    db.session.add(qual)
    print(value)
    db.session.commit()
    print(value)
    return jsonify({})

#courses
@views.route('/courses', methods=['GET', 'POST'])
@login_required
@admin_required
def courses():
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    categories = Category.query.all()
    qualifications = Qualifications.query.all()
    instructors=Instructor.query.all()
    instructor_dict = {}
    category_dict = {}
    qualification_dict = {}

    for instructor in instructors:
        instructor_dict[instructor.instructorId] = instructor.instructorName
    for category in categories:
        category_dict[category.categoryId] = category.categoryName
    for qualification in qualifications:
        qualification_dict[qualification.qualificationId] = qualification.qualificationName
        
    if request.method == 'POST':
        courseName = request.form.get('courseName')
        courseCategoryId = request.form.get('courseCategoryId')
        courseDuration = request.form.get('courseDuration')
        courseMinQualification = request.form.get('courseMinQualification')
        courseInstructorId = request.form.get('courseInstructorId')
        courseStatus = request.form.get('courseStatus') in ['true', 'True', '1']
        courseDescription = request.form.get('courseDescription')
        courseBatchSize = request.form.get('courseBatchSize')
        courseSyllabus = request.form.get('courseSyllabus')
        courseVideoLink = request.form.get('courseUrl')
        courseId = courseCategoryId+courseName+'0'
        for i in Courses.query.all():
            if i.courseId == courseId:
                courseId = courseCategoryId+courseName+str(int(i.courseId[-1])+1)
        course = Courses(courseName=courseName, courseId=courseId, courseCategoryId=courseCategoryId, courseDuration=courseDuration, courseMinQualificationId=courseMinQualification, courseInstructorID=courseInstructorId, courseStatus=courseStatus, courseDescription=courseDescription, courseBatchSize=courseBatchSize, courseVideoLink=courseVideoLink) #, courseSyllabus=None
        db.session.add(course)
        db.session.commit()  
    if request.args.get('status'):
        print(request.args.get('status').split(',')) 
        listAll = False
        courses = Courses.query.filter(Courses.courseStatus.in_((request.args.get('status')).split(','))).order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
        if len(request.args.get('status').split(',')) == 2:
            listAll = True
        elif request.args.get('status').split(',') == ['']:
            listAll = True
            courses = Courses.query.order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
        print(courses)
        return render_template('courses.html', courses = courses, categories = Category.query.all(), qualifications = Qualifications.query.all(), instructors=Instructor.query.all(), listAll = listAll)
    return render_template('courses.html', user=current_user,courses = Courses.query.order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE), categories = category_dict, qualifications = qualification_dict, instructors=instructor_dict, listAll=True)

#edit courses
@views.route('/courses/<courseId>', methods=['PUT', 'PATCH'])
@login_required
@admin_required
def editCourse(courseId):
    c = Courses.query.filter_by(courseId = courseId).first()
    value = json.loads(request.data)
    courseName = value['courseName']
    courseCategoryId = value['courseCategoryId']
    courseDuration = value['courseDuration']
    courseStatus = value['courseStatus'] in ['true', 'True', '1']
    courseDescription = value['courseDescription']
    courseMinQualification = value['courseMinQualificationId']
    courseBatchSize = value['courseBatchSize']
    courseInstructorId = value['courseInstructorId']
    #courseSyllabus = request.form.get['courseSyllabus']
    courseVideoLink = value['courseUrl']
    print(value)

    c.courseName = courseName
    c.courseCategoryId = courseCategoryId
    c.courseDuration = courseDuration
    c.courseMinQualification = courseMinQualification
    c.courseInstructorId = courseInstructorId
    c.courseStatus = courseStatus
    c.courseDescription = courseDescription
    c.courseBatchSize = courseBatchSize
    #c.courseSyllabus = courseSyllabus
    c.courseVideoLink = courseVideoLink
    db.session.add(c)
    db.session.commit()
    return jsonify({})

# Search Course
@views.route('/courses/<searchBy>/<searchConstraint>')
@login_required
@admin_required
def searchCourse(searchBy, searchConstraint):
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if searchBy == 'id':
        courses = Courses.query.filter(Courses.courseId.like("%"+searchConstraint+"%")).order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        courses = Courses.query.filter(Courses.courseName.like("%"+searchConstraint+"%")).order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
    return render_template('courses.html',user=current_user, courses=courses, categories = get_category_dict(), qualifications =get_qualification_dict(), instructors=get_instructor_dict(), listAll=False)

# Delete Course
@views.route('/courses/<courseId>', methods=['DELETE'])
@login_required
@admin_required
def deleteCourse(courseId):
    course = Courses.query.filter_by(courseId=courseId).first()
    if course:
        db.session.delete(course)
        db.session.commit()
    return jsonify({})

@views.route('/profile', methods=['GET'])
def profile():
    return render_template('profile.html', user=current_user)