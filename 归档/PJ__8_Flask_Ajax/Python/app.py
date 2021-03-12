from flask import Flask,request, jsonify, make_response
import pymysql
import json

app = Flask(__name__)

conn = pymysql.connect(host="localhost", port=3306, user="root", passwd="root", db="projectii")
cursor = conn.cursor()

@app.route('/yhmpd',methods=['POST','GET'])
def yhmpd():
    NAME = str(request.args.get('yhm'))
    yhm = 'select * from Users where NAME = "%s"' % (NAME)
    yhm_res = cursor.execute(yhm)

    responsetext = {
        "statusCode": 200,
        "data": yhm_res
    }
    response = make_response(jsonify(responsetext))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response

@app.route('/yhdl',methods=['POST','GET'])
def yhdl():
    PSWORD = str(request.args.get('mm'))
    NAME = str(request.args.get('yhm'))
    sql = 'select * from Users where NAME = "%s" and PSWORD="%s"' % (NAME, PSWORD)
    res = cursor.execute(sql)
    responsetext = {
        "statusCode": 200,
        "data": res
    }
    response = make_response(jsonify(responsetext))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response

@app.route('/yhzc',methods=['POST','GET'])
def yhzc():
    PSWORD = str(request.args.get('mm'))
    NAME = str(request.args.get('yhm'))
    sqlname = 'select * from Users where NAME = "%s"' % (NAME)
    sql_name = cursor.execute(sqlname)
    have_add = 2
    if (sql_name == 0):
        sql = "insert into Users(NAME,PSWORD) values(%s,%s)"
        cursor.execute(sql, [NAME, PSWORD])
        # cursor.execute(sql,(user,pwd))
        conn.commit()
        sqlname = 'select * from Users where NAME = "%s"' % (NAME)
        sql_name = cursor.execute(sqlname)
        if(sql_name == 1):
            have_add = 1
        else:
            have_add = 0
    elif(sql_name == 1):
        have_add = 2
    # return str(have_add)
    responsetext = {
        "statusCode": 200,
        "data": have_add
    }
    response = make_response(jsonify(responsetext))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response

@app.route('/jf',methods=['POST','GET'])
def jf():
    NAME = str(request.args.get('yhm'))
    name_choose = 'select * from Scores where NAME = "%s"' % (NAME)
    cursor.execute(name_choose)
    res = cursor.fetchone()
    print(res)
    if (res == None):
        print("首次积分")
        sql = "insert into Scores(NAME,SCORES) values(%s,%s)"
        cursor.execute(sql, [NAME, 0])
        conn.commit()

    name_choose = 'select * from Scores where NAME = "%s"' % (NAME)
    cursor.execute(name_choose)
    res = cursor.fetchone()
    print(res[1])
    name_choose_add = "update Scores set SCORES='%s' where NAME='%s'" % (res[1] + 10, NAME)
    cursor.execute(name_choose_add)
    conn.commit()
    cursor.execute(name_choose)
    res = cursor.fetchone()
    # return str(res[1])

    print(res[1])


    responsetext = {
        "statusCode": 200,
        "data": res[1]
    }
    response = make_response(jsonify(responsetext))
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'OPTIONS,HEAD,GET,POST'
    response.headers['Access-Control-Allow-Headers'] = 'x-requested-with'
    return response




if __name__ == '__main__':
    app.run()
