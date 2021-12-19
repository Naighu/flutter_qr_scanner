from flask import Flask,jsonify,request,send_file
from PIL import Image, ImageFont, ImageDraw 
import io,base64
from flask_cors import CORS, cross_origin

from database.connector import Sql
app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'


@app.route('/test',methods = ['POST'])
def test():
   return jsonify({"hello" : "hai"})

@app.route("/getAllUsers",methods = ["GET","POST"])
@cross_origin()
def getAllUsers():
    return jsonify(sql.getAllUserDetails())

@app.route("/getUser",methods = ["POST"])
@cross_origin()
def getUser():
    id = request.form.get('id')
    print(id)
    #return jsonify({"hello" : "hai"})
    return jsonify(sql.getUserDetails(id))

@app.route("/updateSnacks",methods = ["POST"])
def updateCount():
    id = request.json["id"]
    count = request.json["count"]
    #update snacks count 
    return jsonify(sql.getUserDetails(id))

@app.route("/updateRefershment",methods = ["POST"])
def updateRefershment():
    id =request.form.get('id')
    tag = request.form.get('tag')
    print(tag)
    return jsonify(sql.updateRefershment(id,tag))
    
@app.route("/getAllRefershmentDetails",methods = ["POST"])
def getAllRefershmentDetails():
    return jsonify(sql.getAllRefershments())

@app.route("/getRefershmentDetails",methods = ["POST"])
def getRefershmentDetails():
    return jsonify(sql.getRefershments(int(request.form.get('id'))))

@app.route("/getcertificate",methods = ["POST"])
@cross_origin()
def getCertificate():
    id= request.form.get('id')
    user = sql.getUserDetails(id)[0]

    img = Image.open("certificate.png")
    draw = ImageDraw.Draw(img)
    # font = ImageFont.truetype(<font-file>, <font-size>)
    font = ImageFont.truetype("Rubik.ttf", 100)
    # draw.text((x, y),"Sample Text",(r,g,b))
    width, height = draw.textsize(user["name"], font=font)
    draw.text(((1414 * 0.5)-(width/2), 860),user["name"],(0,0,0),font=font)
    
    img.save("write.png")
    rawBytes = io.BytesIO()
    img.save(rawBytes, "PNG")
    rawBytes.seek(0)
    img_base64 = base64.b64encode(rawBytes.read())
    return img_base64

if __name__ == '__main__':
    sql = Sql()
    app.run(debug = True,host="159.89.161.168")



