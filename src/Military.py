import os
from flask import *
import pymysql
from werkzeug.utils import secure_filename

Military =Flask(__name__)
con=pymysql.connect(host='localhost',user='root',password='root',db='vrd',charset='utf8')
cmd=con.cursor()
@Military.route('/login',methods=['get','post'])
def login():
    soldier=request.args.get('username')
    password=request.args.get("password")
    print(soldier)
    print(password)
    cmd.execute("select * from login where username='"+soldier+"' and password='"+password+"'")
    result=cmd.fetchone()
    if result is None:
        return jsonify({'task':'invalid'})
    elif result[3]=='soldier':
        return jsonify({'task':'success','lid':result[0],'type':result[3]})
    elif result[3]=='admin':
        return jsonify({'task':'success','lid':result[0],'type':result[3]})
@Military.route("/registration",methods=['get','post'])
# Flask registration route

    # data = request.get_json()
    # print(data)
    # if data is None:
    #     return jsonify({'error': 'No data received'}), 400
    #
    # name = data.get("username")
    # email = data.get("email")
    # password = data.get("password")
    # id_proof = data.get("id_proof")
    # photo = data.get("photo")
    # print(name)
    # print(email)
    #
    # if not all([name, email, password, id_proof, photo]):
    #     return jsonify({'error': 'Incomplete data received'}), 400
    # # Save the photo
    # photo_filename = secure_filename(photo)
    # photo.save(os.path.join("static/images", photo_filename))
    #
    # # Insert data into the database
    # cmd.execute("INSERT INTO login (Email,Password, Role) VALUES (%s,%s,%s)", (email, password, 'soldier'))
    # login_id = cmd.lastrowid
    # cmd.execute("INSERT INTO registration (Login_id,Name,Email,id_proof,Photo) VALUES (%s,%s,%s,%s,%s)",
    #             (login_id,name,email,id_proof,photo_filename))
    # con.commit()
    #
    # return jsonify({'task': 'success'}), 201

@Military.route("/registration", methods=['POST','get'])
def registration():
        result = request.args.get("vrd")
        print(result)
        value = json.loads(result)
        print("fg",value)
        name = value["username"]
        email = value["email"]
        password = value["password"]
        id_proof = value["id_proof"]
        # images = value["image"]
        # photo = secure_filename(images.filename)
        # images.save(os.path.join("static\images", photo))
        cmd.execute("insert into login values(null ,'" + email + "','" + password + "','soldier')")
        loginid = cmd.lastrowid
        # cmd.execute("insert into registration values (null,'" + str(
        #     loginid) + "','" + name + "','" + email + "','" + id_proof + "','" + photo + "')")
        # con.commit()
        return jsonify({'task': 'success'})


Military.run(host='0.0.0.0',port=5000)