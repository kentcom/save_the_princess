#!/usr/bin/python
 
import sqlite3
from sqlite3 import Error
 
 
def create_connection(princess):
    """ create a database connection to the SQLite database
        specified by the db_file
    :param db_file: database file
    :return: Connection object or None
    """
    try:
        conn = sqlite3.connect(princess)
        return conn
    except Error as e:
        print(e)
 
    return None
	
 
def select_task_by_priority(conn, priority):
    """
    Query tasks by priority
    :param conn: the Connection object
    :param priority:
    :return:
    """
    cur = conn.cursor()
    cur.execute("select A.QuestionID,A.CorrectOptionID,O.Options_value from Answers A,Options O where A.CorrectOptionID=O.OptionID and A.QuestionID=O.QuestionID")

    rows = cur.fetchall()
 
    for row in rows:
        print(row)
		
def main():
    database = "C:/Users/Chetana/python/SEMDBScripts/princess.db"
 
    # create a database connection
    conn = create_connection(database)
    with conn:
        print("1. Query :")
        select_task_by_priority(conn,1)

 
 
if __name__ == '__main__':
    main()
