from unicodedata import category
from flask import Blueprint, render_template, request,  jsonify, url_for, redirect

from website import views
from . import db
from .models import Category, Batches, CourseEnrollment, Courses, Enquiries, Users, Qualifications, ActivityLog, Instructor,UserQualification
import json
from sqlalchemy import and_
from datetime import date
from flask_login import login_user, login_required, logout_user, current_user
from functools import wraps

ROWS_PER_PAGE = 5

def user_required(func):
    @wraps(func)
    def isuser(*args,**kwargs):
        if(current_user.userRoleId != 2):
            return render_template('warning.html')
        return func(*args,**kwargs)
    return isuser

userviews = Blueprint('userviews', __name__)

userEnquiries = []

ROWS_PER_PAGE = 5


@userviews.route('/', methods=['GET', 'POST'])
@login_required
@user_required
def dashboard():
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if request.method == 'POST':
        enquiryUserId = request.form.get('enquiryUserId')
        enquiryCourseId = request.form.get('enquiryCourseId')
        course = Courses.query.filter_by(courseId=enquiryCourseId).first()
        enquiryStatus = 1
        enquiryUpdate = 'ENQUIRED'
        enquiryDescription = request.form.get('enquiryDescription')
        print(enquiryCourseId, enquiryStatus, enquiryUpdate, enquiryDescription)
        new_enquiry = Enquiries(enquiryUserId=enquiryUserId, enquiryCourseId=course.id, enquiryStatus=enquiryStatus, enquiryDescription=enquiryDescription)
        db.session.add(new_enquiry)
        db.session.commit()
    courses = Courses.query.filter_by(courseStatus = 1).order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
    category_id_name = dict()
    category_ = Category.query.all()
    for c in category_:
        category_id_name[c.categoryId] = c.categoryName
    teachers = Instructor.query.all()
    teacher_id_name = dict()
    for t in teachers:
        teacher_id_name[t.instructorId] = t.instructorName 
    minQuali = Qualifications.query.all()
    min_quali_id_name = dict()
    for i in minQuali:
        min_quali_id_name[i.qualificationId]=i.qualificationName

    return render_template('userDashboard.html', courses=courses, instructor_id_name = teacher_id_name, category_id_name = category_id_name,min_quali_id_name=min_quali_id_name, listAll=True, user=current_user)

@userviews.route('/<searchBy>/<searchConstraint>')
@login_required
@user_required
def userSearchCourse(searchBy, searchConstraint):
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if searchBy == 'id':
        courses = Courses.query.filter(and_(Courses.courseId.like("%"+searchConstraint+"%"), Courses.courseStatus == 1)).order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        courses = Courses.query.filter(and_(Courses.courseName.like("%"+searchConstraint+"%"), Courses.courseStatus == 1)).order_by(Courses.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
    category_id_name = dict()
    category_ = Category.query.all()
    for c in category_:
        category_id_name[c.categoryId] = c.categoryName
    teachers = Instructor.query.all()
    teacher_id_name = dict()
    for t in teachers:
        teacher_id_name[t.instructorId] = t.instructorName 
    minQuali = Qualifications.query.all()
    min_quali_id_name = dict()
    for i in minQuali:
        min_quali_id_name[i.qualificationId]=i.qualificationName
    return render_template('userDashboard.html', courses=courses, instructor_id_name = teacher_id_name, category_id_name = category_id_name,min_quali_id_name=min_quali_id_name, listAll=False, user=current_user)

#enquiry
@userviews.route('/enquiries', methods=['GET', 'POST'])
@login_required
@user_required
def userEnquiries():
    user=current_user
    # Set the pagination configuration
    page = request.args.get('page', 1, type=int)
    if request.method == 'POST':
        userEnquiryId = request.form.get('enquiryId')
        print(userEnquiryId)
        userEnquiryUserId = request.form.get('enquiryUserId')
        userEnquiryCourseId = request.form.get('enquiryCourseId')
        userEnquiryStatus = bool(request.form.get('enquiryStatus'))
        userEnquiryDescription = request.form.get('enquiryDescription')
        print(userEnquiryId, userEnquiryUserId, userEnquiryCourseId, userEnquiryDescription, userEnquiryStatus)
        new_enquiry = Enquiries(enquiryId=userEnquiryId, enquiryUserId=userEnquiryUserId, enquiryCourseId=userEnquiryCourseId, enquiryDescription=userEnquiryDescription)
        db.session.add(new_enquiry)
        db.session.commit()
    #print(userEnquiryId, userEnquiryUserId, userEnquiryCourseId, userEnquiryDescription, userEnquiryStatus)
    user = current_user
    userEnquiries=Enquiries.query.filter_by(enquiryUserId=user.userId).order_by(Enquiries.enquiryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    courses = Courses.query.with_entities(Courses.courseId, Courses.courseName).distinct().all()
    #enquiry_course=Enquiries.query.filter_by(enquiryCourseId=courses.userId)
    course_id_names = dict()
    course_obj = Courses.query.all()
    for i in course_obj:
        course_id_names[i.id] = i.courseName
    print(userEnquiries)
    #print(courses)
    #print(enquiry_course)
    #users = Users.query.with_entities(Users.userId).distinct().all()
    userEnquiryStatus = Enquiries.query.with_entities(Enquiries.enquiryStatus).distinct().all()
    return render_template('/userEnquiries.html', userEnquiries=userEnquiries, listAll=True, user=current_user, courses=courses, userEnquiryStatus=userEnquiryStatus, course_id_names =course_id_names)


#search enquiry 
@userviews.route('/enquiries/<searchBy>/<searchConstraint>')
@login_required
@user_required
def userSearchEnquiry(searchBy, searchConstraint):
    page = request.args.get('page', 1, type=int)
    courses = Courses.query.with_entities(Courses.courseId, Courses.courseName).distinct().all()
    course_id_names = dict()
    course_obj = Courses.query.all()
    for i in course_obj:
        course_id_names[i.id] = i.courseName
    if searchBy == 'id':
        userEnquiries = Enquiries.query.filter(Enquiries.enquiryCode.like("%"+searchConstraint+"%")).order_by(Enquiries.enquiryId).paginate(page=page, per_page=ROWS_PER_PAGE)
    elif searchBy == 'name':
        
        
        userEnquiries = Enquiries.query.filter_by(enquiryUserId = current_user.userId).order_by(Enquiries.enquiryId).paginate(page=page, per_page=ROWS_PER_PAGE)
        for i in userEnquiries.items:
            if i.enquiryCourseId in course_id_names.keys():
                courses = i
                print(courses)
                found = True
        if not found:
            course = []
        
            
    
    return render_template('/userEnquiries.html', userEnquiries=userEnquiries, courses=courses, listAll=False,course_id_names = course_id_names, user=current_user)



@userviews.route('/enrolledCourses')
@login_required
@user_required
def enrolledCourses():
    page = request.args.get('page', 1, type=int)
    course_instructor = dict()
    courseIds = []
    courses = []
    category_name = dict()
    user = current_user.userId
    #user = 1698
    enrollments = CourseEnrollment.query.filter_by(userId=user).order_by(CourseEnrollment.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
    #print(type(enrollments))
    for enrollment in enrollments.items:
        courseIds.append(enrollment.courseId)
    #print(courseIds)
    for id in courseIds:
        #print(id)
        course = Courses.query.filter_by(id=id).first()
        #print(course)
        courses.append(course)
        result = Category.query.filter_by(categoryId=course.courseCategoryId).first()
        #print(result)
        category_name[course.courseCategoryId] = result.categoryName
    #print(courses)
    for course in courses:
        #print(course)
        instructor = Instructor.query.filter_by(instructorId=course.courseInstructorID).first()
        course_instructor[instructor.instructorId] = instructor.instructorName
    #courses = courses.paginate(1, per_page=ROWS_PER_PAGE)
    return render_template('/enrolledCourses.html', user=current_user, courses = courses, category_name=category_name,course_instructor = course_instructor, enrollments=enrollments, listAll=True)


@userviews.route('/enrolledCourses/<searchBy>/<searchConstraint>')
@login_required
@user_required
def userSearchEnrolledCourses(searchBy, searchConstraint):
    page = request.args.get('page', 1, type=int)
    course_instructor = dict()
    courseIds = []
    courses = []
    category_name = dict()
    user = current_user.userId
    enrollments = CourseEnrollment.query.filter_by(userId=user).order_by(CourseEnrollment.courseId).paginate(page=page, per_page=ROWS_PER_PAGE)
    #print(type(enrollments))
    if searchBy == 'id':
        for enrollment in enrollments.items:
            courseIds.append(enrollment.courseId)
        for courseId in courseIds:            
            course = Courses.query.filter_by(id=courseId).first()
            print(course)
            courses.append(course)
            result = Category.query.filter_by(categoryId=course.courseCategoryId).first()
            category_name[course.courseCategoryId] = result.categoryName   
        found = False
        new_courses = []
        for course in courses:
            if course.courseId == searchConstraint:
                found = True
                new_courses.append(course)
            instructor = Instructor.query.filter_by(instructorId=course.courseInstructorID).first()
            course_instructor[instructor.instructorId] = instructor.instructorName
        #courses = courses.paginate(1, per_page=ROWS_PER_PAGE)
    
    elif searchBy == 'name':
        for enrollment in enrollments.items:
            courseIds.append(enrollment.courseId)
        for courseId in courseIds:            
            course = Courses.query.filter_by(id=courseId).first()
            print(course)
            courses.append(course)
            result = Category.query.filter_by(categoryId=course.courseCategoryId).first()
            category_name[course.courseCategoryId] = result.categoryName   
        found = False
        new_courses = []
        for course in courses:
            if course.courseName == searchConstraint:
                found = True
                new_courses.append(course)
            instructor = Instructor.query.filter_by(instructorId=course.courseInstructorID).first()
            course_instructor[instructor.instructorId] = instructor.instructorName
        #courses = courses.paginate(1, per_page=ROWS_PER_PAGE)

    return render_template('/enrolledCourses.html', user=current_user, courses = new_courses, category_name=category_name,course_instructor = course_instructor, enrollments=enrollments, listAll=False)



@userviews.route('/profile')
@login_required
@user_required
def profile():
    user_all=[]
    # #userCode = f"USER{last_user.userId+1}"
    # userName = request.form.get('userName')
    # userPassword = 'password'
    # userEmail = request.form.get('userEmail')
    # #userRoleId = request.form.get('userRole')
    # userPhone = request.form.get('userPhone')
    # userCountry = request.form.get('userCountry')
    # userState = request.form.get('userState')
    # userCity = request.form.get('userCity')
    user_all = Users.query.filter_by(userId=current_user.userId).first()
    user_qualification=Qualifications.query.with_entities(Qualifications.qualificationName).filter(Qualifications.qualificationId.in_(UserQualification.query.with_entities(UserQualification.qualificationId).filter_by(userId = current_user.userId))).all()
    # user_qualification = Qualifications.query.get(user_qualificationId)
    # user_quali_name = Qualifications.query.with_entities(Qualifications.qualificationName).filter_by(qualificationId =user_qualifications)
    print(user_qualification)
    return render_template('profile.html', user_all=user_all,user=current_user,user_qualifications=user_qualification)


