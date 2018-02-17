
# A very simple Bottle Hello World app for you to get started with...
from bottle import default_app, route, redirect, static_file, get

@get('/<filename:re:.*>')
def stylesheets(filename):
    return static_file(filename, root='./')

@route('/')
def hello_world():
    return redirect("Homepage.html")

application = default_app()

