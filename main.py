
from bottle import route, run, default_app, debug, template, request, redirect, get, static_file, BaseTemplate

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
    conn = sqlite3.connect('./Database/Princess.db')
    c = conn.cursor()
    c.execute("SELECT * FROM Princess WHERE ")
    result = c.fetchall()
    c.close()


    output = template('gamepage.tpl', data=result)
    return output

@route('/contactus')
def contactus():
    output = template('contactus.tpl')
    return output

if __name__ == "__main__":
    debug(True)
    run(reloader=True)
else:
    application = default_app()