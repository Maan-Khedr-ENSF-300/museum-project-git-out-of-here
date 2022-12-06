
import mysql.connector

cnx = mysql.connector.connect(
    user = 'zahwa', 
    password = 'Zafa9876$',
    host = '127.0.0.1',
    database = 'museum')

cur = cnx.cursor()

# login
user = input('Username: ')
password = input('Password: ')


# if admin 
    # add users

    # edit users

    # block users

    # change database

# if data entry user 
    # add information tuples (info meets contraints)

    # modify existing information in database

# if end user


cnx.close()
