from bottle import route, run, template, request, get, post, default_app, debug, redirect
import json
from google.oauth2 import id_token
from google.auth.transport import requests

CLIENT_ID = "237964107198-0q4lgvs8d4nto9ds060779kj03rod9fb.apps.googleusercontent.com"

def validateGoogle():
    dict_data = request.json
    #print(dict_data['ID'])
    #print(dict_data['Name'])
    #print(dict_data['ImageURL'])
    #print(dict_data['Email'])
    try:
        idinfo = id_token.verify_oauth2_token(dict_data['ID'], requests.Request(), CLIENT_ID)
        if idinfo['iss'] not in ['accounts.google.com', 'https://accounts.google.com']:
            raise ValueError('Wrong issuer.')
        userid = idinfo['sub']
        print(idinfo)
        return redirect("/success")
    except ValueError:
        return redirect("/error")

def validateFacebook():
    dict_data = request.json
    print(dict_data)
