from flask import Flask,request, jsonify, make_response
import pymysql
import json

app = Flask(__name__)

conn = pymysql.connect(host="localhost", port=3306, user="root", passwd="root", db="projectii")
cursor = conn.cursor()

@app.route('/if_name_not_replace',methods=['POST','GET'])
def if_name_not_replace():
    NAME = str(request.args.get('NAME'))
    sql__US_NAME_has_IN = 'select * from Users where NAME = "%s"' % (NAME)
    res_sql__US_NAME_has_IN = cursor.execute(sql__US_NAME_has_IN)
    print(sql__US_NAME_has_IN)
    print(res_sql__US_NAME_has_IN)
    result_text = {
        "statusCode": 200,
        "data": res_sql__US_NAME_has_IN
    }
    response = make_response(jsonify(result_text))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response

@app.route('/login',methods=['POST','GET'])
def login():
    PSWORD = str(request.args.get('PSWORD'))
    NAME = str(request.args.get('NAME'))
    sql = 'select * from Users where NAME = "%s" and PSWORD="%s"' % (NAME, PSWORD)
    print(sql)
    res = cursor.execute(sql)
    print(res)
    # return str(res)
    result_text = {
        "statusCode": 200,
        "data": res
    }
    response = make_response(jsonify(result_text))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response

@app.route('/new_user',methods=['POST','GET'])
def new_user():
    PSWORD = str(request.args.get('PSWORD'))
    NAME = str(request.args.get('NAME'))
    sql__US_NAME_has_IN = 'select * from Users where NAME = "%s"' % (NAME)
    res_sql__US_NAME_has_IN = cursor.execute(sql__US_NAME_has_IN)
    have_add = 2
    if (res_sql__US_NAME_has_IN == 0):
        sql = "insert into Users(NAME,PSWORD) values(%s,%s)"
        cursor.execute(sql, [NAME, PSWORD])
        # cursor.execute(sql,(user,pwd))
        conn.commit()
        sql__US_NAME_has_IN = 'select * from Users where NAME = "%s"' % (NAME)
        res_sql__US_NAME_has_IN = cursor.execute(sql__US_NAME_has_IN)
        if(res_sql__US_NAME_has_IN == 1):
            have_add = 1
        else:
            have_add = 0
    elif(res_sql__US_NAME_has_IN == 1):
        have_add = 2
    # return str(have_add)
    result_text = {
        "statusCode": 200,
        "data": have_add
    }
    response = make_response(jsonify(result_text))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response

@app.route('/ten_change',methods=['POST','GET'])
def ten_change():
    NAME = str(request.args.get('NAME'))
    sql_select_US_NAME = 'select * from Scores where NAME = "%s"' % (NAME)
    cursor.execute(sql_select_US_NAME)
    res = cursor.fetchone()
    print(res)
    if (res == None):
        print("首次积分")
        sql = "insert into Scores(NAME,SCORES) values(%s,%s)"
        cursor.execute(sql, [NAME, 0])
        # cursor.execute(sql,(user,pwd))
        conn.commit()

    sql_select_US_NAME = 'select * from Scores where NAME = "%s"' % (NAME)
    cursor.execute(sql_select_US_NAME)
    res = cursor.fetchone()
    print(res[1])
    sql_add_ten_US_SCORES = "update Scores set SCORES='%s' where NAME='%s'" % (res[1] + 10, NAME)
    cursor.execute(sql_add_ten_US_SCORES)
    conn.commit()
    cursor.execute(sql_select_US_NAME)
    res = cursor.fetchone()
    print(res[1])
    # return str(res[1])

    result_text = {
        "statusCode": 200,
        "data": res[1]
    }
    response = make_response(jsonify(result_text))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response




if __name__ == '__main__':
    app.run()
