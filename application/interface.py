
import mysql.connector

cnx = mysql.connector.connect(
    user = 'zahwa', 
    password = 'Zafa9876$',
    host = '127.0.0.1',
    database = 'museum')

cur = cnx.cursor()

# login
cur.execute('use museum')
cur.execute('SELECT * FROM USERS') # execute query to get all users
users = cur.fetchall() # list of users (tuples)

print('Welcome to the ENSF 300 Museum Project Database. Please login below:')
status = True

while status == True:
    username = input('Username: ')
    password = input('Password: ')

    # simultaneously check if user exists and their account type
    if (username, password, 'admin') in users: # if user is admin
        # add users

        # edit users

        # block users

        # change database

    elif (username, password, 'data entry') in users: # if user is data entry type
        # add information tuples (info meets contraints)

        # modify existing information in database

    elif (username, password, 'end') in users: # if user is end type


    else: # user is not valid
        print('User does not exist.')
        if input('Enter 1 to exit: ') == 1:
            print('Thank you for using the ENSF 300 Museum Project Database.')
            status = False


cnx.close()
