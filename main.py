import bottle
from bottle import run, default_app, debug, template, request, redirect, get, post, static_file, BaseTemplate, HTTPResponse, HTTPError, time
import sqlite3, oauth
from beaker.middleware import SessionMiddleware

session_opts = {
    'session.type': 'file',
    'session.cookie_expires': 300,
    'session.data_dir': './data',
    'session.auto': True
}

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


def addToHistoryTable(userID, questionID):
    conn = sqlite3.connect('./Database/princess.db')
    c = conn.cursor()
    c.execute("INSERT INTO GameHistory values(?, ?)",(game_user, questionID))
    c.commit()
    c.close()
    

def retrieveHistoryTable(userID):
    conn = sqlite3.connect('./Database/princess.db')
    c = conn.cursor()
    c.execute("SELECT count(QuestionID) from GameHistory where UserID=?",(userID))
    result = c.fetchall()
    c.close()
    global rowCount
    for row in result:
        rowCount = row[0]
    print("Total questions inserted = " + rowCount)
    return rowCount


@get('/gamepage')
def gamepage(qid=1):
    session = bottle.request.environ.get('beaker.session')
    game_user = session.get('game_user')
    if game_user is None:
        return redirect("/")
    qid = selectLevelQuestion('EntryLevel')
    conn = sqlite3.connect('./Database/princess.db')
    c = conn.cursor()

    c.execute("select Q.QuestionID,Q.Question,group_concat(O.Options_value) as Options_value, (select Options_value from Options WHERE OptionID = A.CorrectOptionID and QuestionID = Q.QuestionID) AS CorrectOption from Questions Q , Options O, Answers A where Q.QuestionID=O.QuestionID and Q.QuestionID=A.QuestionID and Q.QuestionID=? GROUP BY Q.Question",(qid,))

    result = c.fetchall()
    c.close()
    global questionID, question, option, correctOption, rows
    for row in result:
        questionID = row[0]
        session['questionID'] = questionID
        session.save()
        question = row[1]
        option = row[2].split(',')
        correctOption = row[3]

    #get userid from DB
    c = conn.cursor()
    c.execute("SELECT UserID from User WHERE EmailAddress = ?",(game_user,))
    result = c.fetchall()
    c.close()
    global userid
    for row in result:
        userid = row[0]

    rows = retrieveHistoryTable(userid)
    output = template('gamepage.tpl', questionID=questionID, question=question, options=option, correctOption=correctOption, rows1=rows)
    return output


@post('/gamepage')
def validateAnswer():
    try:
        dict_data = request.json
        session = bottle.request.environ.get('beaker.session')
        questionID = session['questionID']
        if questionID is None:
            return HTTPResponse(status=500)
        game_user = session.get('game_user')
        if game_user is None:
            return HTTPResponse(status=500)
        conn = sqlite3.connect('./Database/princess.db')
        c = conn.cursor()
        c.execute("select Q.QuestionID, (select Options_value from Options WHERE OptionID = A.CorrectOptionID and QuestionID = Q.QuestionID) AS CorrectOption from Questions Q , Options O, Answers A where Q.QuestionID=O.QuestionID and Q.QuestionID=A.QuestionID and Q.QuestionID=? GROUP BY Q.Question",(questionID,))
        result = c.fetchall()
        c.close()
        print(str(dict_data['selectedAnswer']))
        global CorrectOption
        for row in result:
            CorrectOption = row[1]
        selectedOption = str(dict_data['selectedAnswer'])

        #get userid from DB
        c = conn.cursor()
        c.execute("SELECT UserID from User WHERE EmailAddress = ?",(game_user,))
        result = c.fetchall()
        c.close()
        global userid
        for row in result:
            userid = row[0]

        if CorrectOption == selectedOption:
            addToHistoryTable(userid, questionID)
            return HTTPResponse(status=200)
        else:
            return HTTPResponse(status=500)
    except ValueError:
        return HTTPResponse(status=500)

@get('/gameover')
def gameover():
    output = template('gameover.tpl')
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
    app = SessionMiddleware(bottle.app(), session_opts)
    debug(True)
    bottle.run(app=app, host='localhost',port=8080, reloader=True)
else:
    application = SessionMiddleware(default_app(), session_opts)