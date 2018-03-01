
from bottle import route, default_app, debug, template, request, redirect, get, static_file, BaseTemplate

@get('/<filename:re:.*>')
def getfile(filename):
    return static_file(filename, root='./static/')

@get('<filename>')
def getOtherFile(filename):
    return static_file(filename, root='./static/')

@route('/')
def main():
    output = template('main.tpl')
    return output

@route('/main')
def redirectmain():
    return redirect('/')

@route('/gamelore')
def gamelore():
    output = template('gamelore.tpl')
    return output

@route('/gamerule')
def gamerule():
    output = template('gamerule.tpl')
    return output

@route('/gamepage')
def gamepage():
    output = template('gamepage.tpl')
    return output

@route('/contactus')
def contactus():
    output = template('contactus.tpl')
    return output

debug(True)
application = default_app()