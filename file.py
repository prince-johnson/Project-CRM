import csv
from website.models import Users
import hashlib
# from flask_sqlalchemy import SQLAlchemy
import sqlalchemy
from sqlalchemy import create_engine
import random

#DB_NAME = "database.db"
#DB_NAME = "chummaveruthe"
DB_NAME = "ProjectCRM"
SQL_SERVER_USER_PASS_IP_PORT = 'sa:123@192.168.5.197:1891'
# SQL_SERVER_USER_PASS_IP_PORT = 'DESKTOP-5AA8MOJ\MSSQLSERVER01'
#SQL_SERVER_USER_PASS_IP_PORT = 'LAPTOP-85QRUTE7\SQLEXPRESS'

engine = create_engine(r'mssql+pyodbc://{}/{}?driver=SQL+Server+Native+Client+11.0'.format(SQL_SERVER_USER_PASS_IP_PORT, DB_NAME))


user_count = 0
with engine.connect() as conn:
    result = conn.execute("SELECT * FROM Users")
    user_count = len(result.fetchall()) + 1

def read_csv(filename):
    with open(filename, 'r') as f:
        reader = csv.reader(f)
        return list(reader)

# function to insert users into the database
# def sql_users(user_count):
#     file = read_csv('users_copy.csv')
    
#     for row in file:
#         userName = row[0]
#         userCode = 'USER0' + str(user_count)
#         # password sha256 hash
#         userPassword = hashlib.sha256('user123'.encode('utf-8')).hexdigest()
#         userRoleId = 2
#         userEmail = row[1]
#         userPhone = row[2]
#         userCountry = 'India'
#         userState = 'Karnataka'
#         userCity = 'Bangalore'
#         userNew = True
#         userStatus = True
#         #user = Users(userName=userName, userCode=userCode, userPassword=userPassword, userRoleId=userRoleId, userEmail=userEmail, userPhone=userPhone, userCountry=userCountry, userState=userState, userCity=userCity, userNew=userNew, userStatus=userStatus)
#         with engine.connect() as conn:
#             conn.execute("INSERT INTO Users (userName, userCode, userPassword, userRoleId, userEmail, userPhone, userCountry, userState, userCity, userNew, userStatus) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')".format(userName, userCode, userPassword, userRoleId, userEmail, userPhone, userCountry, userState, userCity, userNew, userStatus))
#             #commit
#             #conn.commit()
#         user_count += 1
# print(user_count)
#sql_users(user_count) # uncomment this line to insert users into the database

# def sql_insert_role():
#     with engine.connect() as conn:
#         conn.execute("INSERT INTO role (roleName) VALUES ('Admin')")
#         conn.execute("INSERT INTO role (roleName) VALUES ('User')")
#         #conn.execute("INSERT INTO UserRoles (userRoleId, userRoleName) VALUES (3, 'Guest')")
#         print('Inserted roles!')
# #sql_insert_role()

# course_count = 0
# with engine.connect() as conn:
#     result = conn.execute("SELECT * FROM courses")
#     user_count = len(result.fetchall()) + 1


# insert sql instructor
# def sql_insert_instructors():
#     instructor_names = ['Rajesh', 'Ramesh', 'Suresh', 'Ganesh', 'Mahesh', 'Rakesh', 'Sachin', 'Sandeep', 'Srinivas', 'Sudhir']
    
#     instructor_email = [i+str(random.randint(1,10)) + '@gmail.com' for i in instructor_names]
#     instructor_phone = [random.randint(9746332320, 9999999999) for i in instructor_names]
#     intructor_count = 1
#     with engine.connect() as conn:
#         for i in range(len(instructor_names)):
#             conn.execute("INSERT INTO instructor (instructorCode, instructorName, instructorEmail, instructorPhone) VALUES ('{}','{}', '{}', '{}')".format('IN0'+str(intructor_count), instructor_names[i], instructor_email[i], instructor_phone[i]))
#             intructor_count += 1
#         print("Instructors inserted!")
#sql_insert_instructors()


#sql_insert_courses(user_count)
# def sql_insert_courses(course_count):
#     duration = [6,12]
#     with engine.connect() as conn:
#         file = read_csv('courses.csv')
#         for row in file:
#             courseName = row[0]
#             courseCode = f'CR{course_count:03d}'
#             courseDuration = duration[random.randint(0,1)]
#             courseDescription = "ng through collaboration with community partners "
#             courseInstructorID = random.randint(1, 10)
#             courseMinQualificationId = random.randint(1, 3)
#             courseBatchSize = random.choice([20, 25])
#             courseVideoLink = 'https://www.youtube.com/watch?v=QH2-TGUlwu4'
#             courseRating = 1 
#             courseStatus = True
#             course_count += 1
#             conn.execute("INSERT INTO courses (courseName, courseId, courseDuration, courseDescription, courseInstructorID, courseMinQualificationId, courseBatchSize, courseVideoLink, courseRating, courseStatus) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')".format(courseName, courseCode, courseDuration, courseDescription, courseInstructorID, courseMinQualificationId, courseBatchSize, courseVideoLink, courseRating, courseStatus))
#         print("Coureses inserted!")
#sql_insert_courses(course_count)

# inserting category
# def sql_insert_category():
#     with engine.connect() as conn:
#         file = read_csv('category.csv')
#         header = file[0]
#         comments = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum"
#         for i in header:
#             conn.execute("INSERT INTO category (categoryName, categoryStatus, categoryComments) VALUES ('{},{},{}')".format(i, True, comments))
# sql_insert_category()
        
        # for row in file:
        #     categoryName = row[0]
        #     categoryComments = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
        #     categoryStatus = True
        #     conn.execute("INSERT INTO category (categoryName, categoryComments, categoryStatus) VALUES ('{}', '{}', '{}')".format(categoryName, categoryComments, categoryStatus))
        # print("Category inserted!")

#
# setting category id for courses
# dic = {}
# def sql_category_id_courses():
#     with engine.connect() as conn:
#         result = conn.execute("SELECT * FROM courses")
#         courses = result.fetchall()
#         with open('category.csv', 'r') as file:
#             reader = csv.reader(file)
#             header = next(reader)
#             print(len(header))
#             reader_list = list(reader)
#             print(len(reader_list))
#             for row in courses:
#                 #print(row)
#                 course_id = row[0]
#                 print(course_id)
#                 courseName = row[2]
#                 #print(courseName)
#                 for reader_row in reader_list:
#                     #print(reader_row)
#                     if courseName in reader_row:
#                         category_id = reader_row.index(courseName) + 1
#                         #print(header[category_id], courseName)
#                         dic[course_id] = category_id

#                         #print("Updated!", course_id, category_id)
#                         #print(category_id)

                        
                        
                
                            
                    
                        

                    
            
#         #print("Category id set for courses!")
# sql_category_id_courses()


# print(dic)

# with engine.connect() as conn:
#     for key, value in dic.items():
#         conn.execute("UPDATE courses SET courseCategoryId = '{}' WHERE courseId = '{}'".format(value, key))
#         print("Updated!", key, value)

# str = ""
# for key, value in dic.items():
#     str += "UPDATE courses SET courseCategoryId = '{}' WHERE courseId = '{}';\n".format(value, key)
# with open('query.txt', 'w') as file:
#     file.write(str)

