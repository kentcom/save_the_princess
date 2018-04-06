
from bottle import run, default_app, debug, template, request, redirect, get, post, static_file, BaseTemplate, HTTPResponse, HTTPError, time
import oauth, sqlite3

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


#Select different level questions: 'EntryLevel', 'MidLevel', 'HighLevel'
def selectLevelQuestion(level):
    conn = sqlite3.connect('./Database/princess.db')
    c = conn.cursor()
    c.execute("select count(distinct(Question)) from Questions where GameLevel=?" , (level,))
    result = c.fetchall()
    global total
    for row in result:
        total = int(row[0])
        print(total)

    curr_time = int(round(time.time()))
    rand_value = curr_time % total + 1
    print(rand_value)
    #c.execute("update Questions SET Question = 'Who is credited with inventing the first mass produced helicopter?' where QuestionID=4")
    #conn.commit()
    c.execute("select QuestionID from Questions where GameLevel=?", (level,))
    result = c.fetchall()
    c.close()
    index=1
    global qid
    for row in result:
        if(index == rand_value):
            qid = int(row[0])
        index = index + 1
    return qid

@get('/gamepage')
def gamepage(qid=1):
    qid = selectLevelQuestion('EntryLevel')
    conn = sqlite3.connect('./Database/princess.db')
    c = conn.cursor()

    c.execute("select Q.Question,group_concat(O.Options_value) as Options_value from Questions Q , Options O where Q.QuestionID=O.QuestionID and Q.QuestionID=? GROUP BY Q.Question",(qid,))
    
    result = c.fetchall()
    c.close()
    global option
    for row in result:
        option = row[1].split(',')

    output = template('gamepage.tpl', questions=result, options=option)
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
    if oauth.validateGoogle():
        return HTTPResponse(body='', status=200, headers=None)
    else:
        return HTTPError(status=500, body=None, exception=None, traceback=None)

@post('/facebooksignin')
def facebook():
    if oauth.validateFacebook():
        return HTTPResponse(status=200)
    else:
        return HTTPError(status=500)

if __name__ == "__main__":
    debug(True)
    run(reloader=True)
else:
    application = default_app()