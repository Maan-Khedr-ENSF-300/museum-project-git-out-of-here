import mysql.connector

def modify_tuple():
    table = input('Please enter the name of the table you would like to modify the information of: ')
    cur.execute('SELECT * FROM %s' %(table))
    column_names = cur.column_names

    rows = cur.fetchall()
    print('Current information in table:\n', rows) # print current information for user

    tuple_option = input('Please enter:\n 1. Add a tuple (only works for Artists, Exhibitions, Collections) \n2. Modify a tuple\n3. Delete a tuple (only works for borrowed,permanent collection, other, sculpture, paintings, art objects, ):\n')
    if tuple_option == '1': # add tuple
        insert_table = "INSERT INTO %s values (" % (table)
        print('Please enter the following attributes, separated by a comma: ', column_names)
        table_data = input("list here, if it is a string please include it in ' ':")
        table_data = [str(x) for x in table_data.split(",")]
        insert_table = insert_table + table_data[0]
        for x in range(1,len(table_data)):
            insert_table = insert_table +',' + table_data[x]
        insert_table += ')'
        print(insert_table)
        cur.execute(insert_table)
        cnx.commit()

    elif tuple_option == '2': # modify tuple
        mod_info = str(input('Please enter the %s of the %s table you wish to modify in the database: ', column_names[0], table))
        new_info_tup = input('Please enter the following updated attributes %s, separated by a comma: ', column_names)
        new_info_tup = new_info_tup.split(',')

        exec_state = ('''
                    UPDATE users
                    SET''')
                    
        i = 0
        for item in column_names:
            exec_state += (' %s = %s,', item, new_info_tup[i])
            i += 1

        exec_state += (''' WHERE %s = %s''', column_names[0], mod_info)
                    
        cur.execute(exec_state)
        cnx.commit()

    elif tuple_option == '3': # delete tuple
        del_info = str(input('Please enter the %s of the %s table you wish to delete from the database: ' %(column_names[0], table)))
        cur.execute(''' 
                    DELETE FROM %s
                    WHERE %s = %s
                    '''% (table, column_names[0], del_info))
        cnx.commit()   

def browse_info():
    mycursor = cnx.cursor()
    selection_string = "SELECT * FROM " 
    user_input = int(input("Display Data from: \n 1 - Art Pieces on Display \n 2 - Exhibits \n 3 - Paintings at Museum \n 4 - Sculptures at Museum \n 5 - Other types of pieces \n 6 - Artists at Museum \n 7 - Permanant collections at museum \n 8 - relative collections at museum \n 9 - Borrowed collections \n 0 - Quit \n"))
    while(user_input != 0):
        if(user_input == 1):
            case = "ART_OBJECTS"
        elif(user_input == 2):
            case = "EXHIBITIONS"
        elif(user_input == 3):
            case = "PAINTINGS"
        elif(user_input == 4):
            case = "SCULPTURE_STATUE"
        elif(user_input == 5):
            case = "OTHER"
        elif(user_input == 6):
            case = "ARTISTS"
        elif(user_input == 7):
            case = "PERMANENT_COLLECTION"
        elif(user_input == 8):
            case = "COLLECTIONS"
        elif(user_input == 9):
            case = "BORROWED"
        elif(user_input == 0):
            break

        selection_string = selection_string + case
        mycursor.execute(selection_string)
        myresult = mycursor.fetchall()
        print("Table: ", case)
        for x in myresult:
            print(x)
        selection_string = "SELECT * FROM "
        user_input = int(input("Display Data from: \n 1 - Art Pieces on Display \n 2 - Exhibits \n 3 - Paintings at Museum \n 4 - Sculptures at Museum \n 5 - Other types of pieces \n 6 - Artists at Museum \n 7 - Permanant collections at museum \n 8 - relative collections at museum \n 9 - Borrowed collections \n 0 - Quit \n"))

cnx = mysql.connector.connect(
    host = "localhost",
    user = "root", 
    passwd = "102Candle", 
    database = "ART",
    auth_plugin = "mysql_native_password")

cur = cnx.cursor()

# login
cur.execute('use art')
cur.execute('SELECT * FROM USERS') # execute query to get all users
users = cur.fetchall() # list of users (tuples)

print('Welcome to the ENSF 300 ART Museum Project Database. Please login below:')
status = True

while status == True:
    print("to exit enter 0 for username and password")
    username = input('Username: ')
    password = input('Password: ')

    # simultaneously check if user exists and their account type
    if (username, password, 'admin') in users: # if user is admin
        option = input('Please select an option:\n1. Add User\n2. Edit User\n3. Block User\n4. Modify Database\n')
        
        if option == '1': # add users
            user_data = str(input('Please enter the Username, Password, and Account Type (admin, data entry, end) separated by a comma:'))
            user_data = [str(x) for x in user_data.split(",")]
            insert_user = "INSERT INTO USERS VALUES ('%s', '%s', '%s')" % (user_data[0], user_data[1], user_data[2])
            cur.execute(insert_user)
            cnx.commit()

        elif option == '2': # edit users
            username1 = str(input('Please enter the username of the user file you would like to update: '))
            up_username = str(input('Enter your updated username: '))
            up_password = str(input('Enter your updated password: '))
            up_acc_type = str(input('Enter your updated account type (admin, dataentry, end): '))

            cur.execute('''
                        UPDATE users
                        SET username = '%s', password_ = '%s', account_type = '%s'
                        WHERE username = '%s'
                        '''% (up_username, up_password, up_acc_type , username1)) 
            cnx.commit()

        elif option == '3': # block users
            del_user = str(input('Please enter the username of the user you wish to block from the database: '))
            cur.execute()
            cur.execute(''' 
                        DELETE FROM users
                        WHERE username = '%s'
                        '''% (del_user)) 
            cnx.commit()

        elif option == '4': # change database
            table = input('Please enter the name of the table you would like to modify: ')
            modify = input('Please select an option: \n1. Modify an attribute of a table\n2. Modify table constraints\n3. Modify table information\n')
            cur.execute('SELECT * FROM %s' % (table))
            cur.fetchall()

            if modify == '1': # modify attribute in table
                columns = cur.column_names
                print('Attribute List:\n', columns)
                choice = input('Enter 1 if you would like to add an attribute, 2 to modify an attribute, and 3 to delete an attribute: ')
                if choice == '1': # add column/attribute
                    new_col = input('Enter the name of your new attribute and its definition (EX: word VARCHAR(100))\nYou can also add a DEFAULT value (EX: word VARCHAR(100) DEFAULT \'ENSF\'): ')
                    location = input('Enter 1 if you would like the new attribute at the beginning of the table, 2 for between existing columns, or 3 for last: ')
                    if location == '1': 
                        cur.execute(''' 
                                    ALTER TABLE %s
                                    ADD %s
                                    FIRST;
                                    '''% (table, new_col))
                    elif location == '2': 
                        new_after = input('After which attribute should this new attribute be inserted: ')
                        cur.execute(''' 
                                    ALTER TABLE %s
                                    ADD %s
                                    AFTER %s;
                                    '''% (table, new_col, new_after))
                    elif location == '3': 
                        cur.execute(''' 
                                    ALTER TABLE %s
                                    ADD %s;
                                    '''%(table, new_col))
                elif choice == '2': # modify attribute
                    col_modify = input('Enter the name of the attribute you wish to modify: ')
                    col_mod_def = input('Enter this attribute\'s new definition (EX: VARCHAR(100)): ')
                    if input('Do you wish to change the position of the column (Y/N)? ') == 'Y':
                        location2 = input('Where would you like to reposition the attribute?\nEnter 1 for Beginning, 2 for between columns, or 3 for end: ')
                        if location2 == '1': # beginning
                            cur.execute(''' 
                                        ALTER TABLE %s
                                        MODIFY %s %s
                                        FIRST
                                        '''%(table, col_modify, col_mod_def))
                            cur.commit()
                        elif location2 == '2': # between columns
                            new_after2 = input('After which attribute should this attribute be repositioned: ')
                            cur.execute(''' 
                                        ALTER TABLE %s
                                        MODIFY %s %s
                                        AFTER %s
                                        '''% (table, col_modify, col_mod_def, new_after2))
                            cur.commit()
                        elif location2 == '3': # end
                            cur.execute(''' 
                                        ALTER TABLE %s
                                        MODIFY %s %s
                                        '''%(table, col_modify, col_mod_def))
                            cur.commit()
                    else: 
                        cur.execute(''' 
                                    ALTER TABLE %s
                                    MODIFY %s %s
                                    '''%(table, col_modify, col_mod_def))
                        cur.commit()
                elif choice == '3': # delete attribute
                    col_delete = input('Enter the name of the attribute you wish to delete: ')
                    cur.execute(''' 
                                ALTER TABLE %s
                                DROP COLUMN %s
                                '''%(table, col_delete))
                    cur.commit()

            elif modify == '2': # modify table constraints

                mod_constraint = input('Enter 1 to rename a constraint, or enter 2 to modify the properties of a constraint: ')
                if mod_constraint == '1': # rename a constraint
                    old_constraint_name = input('Please enter the name of the constraint you would like to change: ')
                    new_constraint_name = input('Please enter the new name of this constraint: ')
                    cur.execute(''' 
                                ALTER TABLE %s,
                                RENAME CONSTRAINT %s TO %s
                                '''%(table, old_constraint_name, new_constraint_name))
                    cur.commit()
                elif mod_constraint == '2': # modify properties of constraint
                    pick = input('Please enter 1 if you wish to add a constraint, or 2 to delete a constraint: ')
                    if pick == '1': # add constraint
                        type_constraint = input('Please enter which type of constraint you would like to add (Primary or Unique): ')
                        if type_constraint == 'Primary': # add primary key constraint
                            primary_name = input('Enter the name of the Primary Key: ') 
                            primary_col = input('Enter the name of the attribute this constraint applies to: ')
                            cur.execute('''
                                        ALTER TABLE %s
                                        ADD CONSTRAINT %s PRIMARY KEY (%s) 
                                        '''%(table, primary_name, primary_col))
                            cur.commit()
                        elif type_constraint == 'Unique': # add unique key
                            unique_name = input('Enter the name of the Unique Key: ')
                            unique_col = input('Enter the name of the attribute this constraint applies to: ')
                            cur.execute('''
                                        ALTER TABLE %s
                                        ADD CONSTRAINT %s UNIQUE(%s) 
                                        '''% (table, unique_name, unique_col))
                            cur.commit()
                    elif pick == '2': #delete constraint
                        del_constraint = input('Enter the name of the constraint you wish to delete: ')
                        cur.execute(''' 
                                    ALTER TABLE %s
                                    DROP CONSTRAINT %s
                                    '''% (table, del_constraint))

            elif modify == '3': # modify tuple (add/delete/modify)
                modify_tuple()
                
    elif (username, password, 'data entry') in users: # if user is data entry type
        option3 = input('[DATA ENTRY USER]\nPlease enter:\n1. Browse Information\n2. Modify Existing Information in Database\n')
        if option3 == '1':
            browse_info()
        elif option3 == '2': 
            modify_tuple()

    elif (username, password, 'end') in users: # if user is end type
        browse_info()

    else: # user is not valid
        print('User does not exist.')
        if input('Enter 1 to exit: ') == '1':
            print('Thank you for using the ENSF 300 Art Museum Project Database.')
            status = False


cnx.close()
