import sqlite3
from bottle import route, run, debug, template, request, static_file, error, default_app
import time

# only needed when you run Bottle on mod_wsgi
#from bottle import default_app

data = []

@route('/stream/store/<name>', method='GET')
def store(name):
    d = dict(request.query)
    d['name'] = name
    d['time'] = int(time.time())
    data.append(d)
    return str(d)

@route('/stream/query/<name>', method='GET')
def query(name):

    query = dict(request.query)
    if 'start' in query:
        start = query['start']
        query_data = [item for item in data if item['time'] == start]
    if 'end' in query:
        end = query['end']
        query_data = [item for item in data if item['time'] == start]
    if start:
        query_data = [item for item in data if item['time'] == start]

    return str(query_data)


@route('/')
@route('/todo')
def todo_list():
    conn = sqlite3.connect('/home/ppoudel/mysite/todo.db')
    c = conn.cursor()
    c.execute("SELECT id, task FROM todo WHERE status LIKE '1'")
    result = c.fetchall()
    c.close()

    output = template('/home/ppoudel/mysite/make_table.tpl', rows=result)
    return output


@route('/new', method='GET')
def new_item():

    if request.GET.save:

        new = request.GET.task.strip()
        conn = sqlite3.connect('/home/ppoudel/mysite/todo.db')
        c = conn.cursor()

        c.execute("INSERT INTO todo (task,status) VALUES (?,?)", (new, 1))
        new_id = c.lastrowid

        conn.commit()
        c.close()

        return '<p>The new task was inserted into the database, the ID is %s</p><br/><form action="/"><input type="submit" name="home" value="Return back to Home"></form><form action="/new", method="GET" ><input type="submit" name="new" value="Add More Items"></form>' % new_id

    else:
        return template('/home/ppoudel/mysite/new_task.tpl')


@route('/edit/<no:int>', method='GET')
def edit_item(no):

    if request.GET.save:
        edit = request.GET.task.strip()
        status = request.GET.status.strip()

        if status == 'open':
            status = 1
        else:
            status = 0

        conn = sqlite3.connect('/home/ppoudel/mysite/todo.db')
        c = conn.cursor()
        c.execute("UPDATE todo SET task = ?, status = ? WHERE id LIKE ?", (edit, status, no))
        conn.commit()

        return '<p>The item number %s was successfully updated</p><br/><form action="/"><input type="submit" name="home" value="Return back to Home"></form><form action="/edit", method="GET" ><input type="submit" name="edit" value="Edit More Items"></form>' % no
    else:
        conn = sqlite3.connect('/home/ppoudel/mysite/todo.db')
        c = conn.cursor()
        c.execute("SELECT task FROM todo WHERE id LIKE ?", (str(no)))
        cur_data = c.fetchone()

        return template('edit_task', old=cur_data, no=no)

@route('/edit')
def todo_list_with_edit():
    conn = sqlite3.connect('/home/ppoudel/mysite/todo.db')
    c = conn.cursor()
    c.execute("SELECT id, task FROM todo WHERE status LIKE '1'")
    result = c.fetchall()
    c.close()

    output = template('/home/ppoudel/mysite/edit_table.tpl', rows=result)
    return output