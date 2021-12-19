import mysql.connector,time

class Sql:
    def __init__(self):
        self.userTable = "user"
        self.refershmentTable = "refreshment"
        self.db = mysql.connector.connect(
            host="localhost",
            user="root",
            password="password",
            database="droid"
        )
        self.cursor = self.db.cursor()
    def addUser(self,name,sem,dept,college,mobile):
        try:
            sql =  f"INSERT INTO ${self.userTable} VALUES(NULL,'${name}','${sem}','${dept}','${college}','${mobile}')"
            self.cursor.execute(sql)
            self.db.commit()
        except:
            print("error while adding user")
    def insert(self,val):
        sql = f"INSERT INTO {self.userTable} (name, sem,dept,college,mobile) VALUES (%s, %s)"
        self.cursor.execute(sql, val)
        self.db.commit()
        print("Inserted a row")
        
    def getUserDetails(self,id):
        sql = f"SELECT * FROM {self.userTable} WHERE id ={id}"
        self.cursor.execute(sql)
        myresult = self.cursor.fetchall()
        return self.converJson(myresult)

    def getAllUserDetails(self):
        sql = f"SELECT * FROM {self.userTable}"
        self.cursor.execute(sql)
        myresult = self.cursor.fetchall()
        return self.converJson(myresult)
    def converJson(self,result):
        d = []
        for x in result:
            a = {}
            a["id"] = x[0]
            a["name"] = x[1]
            a["sem"] = x[2]
            a["dept"] = x[3]
            a["college"] = x[4]
            a["event"] = x[5]
            a["mobile"] = x[6]
            d.append(a)
        return d
    def converJson1(self,result):
        d = []
        for x in result:
            a = {}
            a["id"] = x[0]
            a["breakfast"] = x[1]
            a["lunch"] = x[2]
            a["supper"] = x[3]
            a["snacks"] = x[4]
            
            d.append(a)
        return d
    def updateRefershment(self,id,tag):
        try:
            if tag == "snacks":
                sql = f'Select *  from {self.refershmentTable} where id={id}'; 

                self.cursor.execute(sql)
                
                myresult = self.cursor.fetchall()
                val = myresult[0][4]
                sql = f"UPDATE {self.refershmentTable} SET {tag}={1+val} WHERE id={id}"
            else:
                sql = f"UPDATE {self.refershmentTable} SET {tag}=true WHERE id={id}"
                print(sql)
            time.sleep(2)
            self.cursor.execute(sql)
            self.db.commit()
            return {"success": True,"message" : "sucessfully updated"}
        except Exception as e:
            print(str(e))
            return  {"success": False,"message" : str(e)}


    def getAllRefershments(self):
        sql = f"SELECT * FROM {self.refershmentTable}"
        self.cursor.execute(sql)
        myresult = self.cursor.fetchall()
        return self.converJson1(myresult)

    def getRefershments(self,id):
        sql = f"SELECT * FROM {self.refershmentTable} WHERE id = {id}"
        self.cursor.execute(sql)
        myresult = self.cursor.fetchall()
        return self.converJson1(myresult)
  
# sql = Sql()

# print(sql.getRefershments(1))