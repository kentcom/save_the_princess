
from bottle import run, default_app, debug, template, request, redirect, get, post, static_file, BaseTemplate
import oauth

@get('/<filename:re:.*>')
def getfile(filename):
    return static_file(filename, root='./static/')

@get('<filename>')
def getOtherFile(filename):
    return static_file(filename, root='./static/')

@get('/')
def main():
    output = template('main.tpl')
    return output

@get('/main')
def redirectmain():
    return redirect('/')

@get('/gamelore')
def gamelore():
    output = template('gamelore.tpl')
    return output

@get('/gamerule')
def gamerule():
    output = template('gamerule.tpl')
    return output

@get('/gamepage')
def gamepage():
    conn = sqlite3.connect('./Database/Princess.db')
    c = conn.cursor()
    c.execute("select Q.Question,group_concat(O.Options_value) as Options_value from Questions Q , Options O where Q.QuestionID=O.QuestionID and Q.QuestionID=1 GROUP BY Q.Question")
    result = c.fetchall()
    c.close()


    output = template('gamepage.tpl', rows=result)
    return output

@get('/contactus')
def contactus():
    output = template('contactus.tpl')
    return output

@get('/signin')
def contactus():
    output = template('signin.tpl')
    return output

@post('/googlesignin')
def google():
    oauth.validateGoogle()

@post('/facebooksignin')
def facebook():
    oauth.validateFacebook()

if __name__ == "__main__":
    debug(True)
    run(reloader=True)
else:
    application = default_app()