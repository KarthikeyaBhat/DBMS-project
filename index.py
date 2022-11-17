from multiprocessing.sharedctypes import Value

import yaml
from flask import Flask, render_template, request,redirect,url_for
from flask_mysqldb import MySQL
import sys

app = Flask(__name__)
app.secret_key = "super secret key"
db = yaml.safe_load(open('db.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)


@app.route("/")
def home():
    return render_template('index.html')

@app.route("/workforce", methods=["GET","POST"])
def workforce():
    if request.method == 'POST':
        workforceDetails = request.form
        pid = (workforceDetails['PID'])
        name = workforceDetails['name']
        age = (workforceDetails['age'])
        address = workforceDetails['address']
        phone = (workforceDetails['phone'])
        salary = (workforceDetails['salary'])
        sw_id = (workforceDetails['sw_id'])
        w_id = (workforceDetails['w_id'])
        dob = workforceDetails['DOB']
        cur = mysql.connection.cursor()
        cur.execute("Insert into work_force values(%s,%s,%s,%s,%s,%s,%s,%s,%s",(pid,name,age,address,phone,salary,sw_id,w_id,dob))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select* from work_force")
    records=cur.fetchall()
    cur.close()
    return render_template("workforce.html",data=records)

@app.route("/wings", methods=["GET","POST"])
def wings():
    if request.method == 'POST':
        workforceDetails = request.form
        w_id = (workforceDetails['w_id'])
        asecr_id = (workforceDetails['asecr_id'])
        hq = workforceDetails['hq']
        name = workforceDetails['name']
        cur = mysql.connection.cursor()
        cur.execute("Insert into wings values(%s,%s,%s,%s)",(w_id,asecr_id,hq,name))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select* from wings")
    records=cur.fetchall()
    cur.close()
    return render_template("wings.html",data=records)

@app.route("/sub-wings", methods=["GET","POST"])
def subwings():
    if request.method == 'POST':
        workforceDetails = request.form
        asecr_id = (workforceDetails['asecr_id'])
        jt_secr = (workforceDetails['jt_secr'])
        w_id = (workforceDetails['w_id'])
        hq = workforceDetails['hq']
        name = workforceDetails['name']
        sw_id = (workforceDetails['sw_id'])
        cur = mysql.connection.cursor()
        cur.execute("Insert into sub_wings values(%s,%s,%s,%s,%s,%s)",(asecr_id,jt_secr,w_id,hq,name,sw_id))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select * from sub_wings")
    records=cur.fetchall()
    cur.close()
    return render_template("subwings.html",data=records)

@app.route("/asecr", methods=["GET","POST"])
def asecr():
    if request.method == 'POST':
        workforceDetails = request.form
        pid = (workforceDetails['pid'])
        name = workforceDetails['name']
        w_id = (workforceDetails['w_id'])
        cur = mysql.connection.cursor()
        cur.execute("Insert into asecr values(%s,%s,%s)",(pid,name,w_id))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select * from asecr")
    records=cur.fetchall()
    cur.close()
    return render_template("asecr.html",data=records)

@app.route("/jtsecr", methods=["GET","POST"])
def jtsecr():
    if request.method == 'POST':
        workforceDetails = request.form
        w_id = (workforceDetails['w_id'])
        sw_id = (workforceDetails['sw_id'])
        name = workforceDetails['name']
        pid = (workforceDetails['pid'])
        asecr_id = (workforceDetails['asecr_id'])
        cur = mysql.connection.cursor()
        cur.execute("Insert into jt_secr values(%s,%s,%s,%s,%s)",(w_id,sw_id,name,pid,asecr_id))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select * from jt_secr")
    records=cur.fetchall()
    cur.close()
    return render_template("jtsecr.html",data=records)

@app.route("/land", methods=["GET","POST"])
def land():
    if request.method == 'POST':
        workforceDetails = request.form
        id = (workforceDetails['id'])
        sw_id = (workforceDetails['sw_id'])
        w_id = (workforceDetails['w_id'])
        address = workforceDetails['address']
        cur = mysql.connection.cursor()
        cur.execute("Insert into land values(%s,%s,%s,%s)",(id,sw_id,w_id,address))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select * from land")
    records=cur.fetchall()
    cur.close()
    return render_template("land.html",data=records)

@app.route("/cantonment", methods=["GET","POST"])
def cantonment():
    if request.method == 'POST':
        workforceDetails = request.form
        id = (workforceDetails['id'])
        w_id = (workforceDetails['w_id'])
        sw_id = (workforceDetails['sw_id'])
        cur = mysql.connection.cursor()
        cur.execute("Insert into cantonment values(%s,%s,%s)",(id,w_id,sw_id))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select * from cantonment")
    records=cur.fetchall()
    cur.close()
    return render_template("cantonment.html",data=records)

@app.route("/accounts", methods=["GET","POST"])
def accounts():
    if request.method == 'POST':
        workforceDetails = request.form
        from_name = (workforceDetails['from_name'])
        to_name = workforceDetails['to_name']
        to_bank = (workforceDetails['to_bank'])
        ammount = workforceDetails['ammount']
        from_bank = (workforceDetails['from_bank'])
        to_ac_no = (workforceDetails['to_ac_no'])
        from_ac_no = (workforceDetails['from_ac_no'])
        date = (workforceDetails['dot'])
        w_id = workforceDetails['w_id']
        details = workforceDetails['details']
        trans_id = workforceDetails['trans_id']
        cur = mysql.connection.cursor()
        cur.execute("Insert into defence_accounts values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(from_name,to_name,to_bank,ammount,from_bank,to_ac_no,from_ac_no,date,w_id,details,trans_id))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select* from defence_accounts")
    records=cur.fetchall()
    cur.close()
    return render_template("accounts.html",data=records)

@app.route("/pensions", methods=["GET","POST"])
def pensions():
    if request.method == 'POST':
        workforceDetails = request.form
        id = (workforceDetails['id'])
        address = workforceDetails['address']
        phone = (workforceDetails['phone'])
        sw_id = workforceDetails['sw_id']
        yos = (workforceDetails['yos'])
        ammount = (workforceDetails['ammount'])
        dc = (workforceDetails['dc'])
        age = (workforceDetails['age'])
        name = (workforceDetails['name'])
        w_id = (workforceDetails['w_id'])
        cur = mysql.connection.cursor()
        cur.execute("Insert into pensions values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(id,address,phone,sw_id,yos,ammount,dc,age,name,w_id))
        mysql.connection.commit()
        cur.close()
    cur = mysql.connection.cursor()
    cur.execute("Select* from pensions")
    records=cur.fetchall()
    cur.close()
    return render_template("pensions.html",data=records)

@app.route("/workforce-delete", methods=["GET","POST"])
def workforce_delete():
    PID = request.args.get("PID")
    cur = mysql.connection.cursor()
    cur.execute("delete from work_force where PID=%s",[PID])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("workforce"))

@app.route("/accounts-delete", methods=["GET","POST"])
def accounts_delete():
    Trans_id = request.args.get("Trans_id")
    cur = mysql.connection.cursor()
    cur.execute("delete from defence_accounts where Trans_id=%s",[Trans_id])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("accounts"))

@app.route("/wings-delete", methods=["GET","POST"])
def wings_delete():
    w_id = request.args.get("w_id")
    cur = mysql.connection.cursor()
    cur.execute("delete from wings where w_id=%s",[w_id])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("wings"))

@app.route("/subwings-delete", methods=["GET","POST"])
def subwings_delete():
    sw_id = request.args.get("sw_id")
    cur = mysql.connection.cursor()
    cur.execute("delete from subwings where sw_id=%s",[sw_id])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("subwings"))

@app.route("/pensions-delete", methods=["GET","POST"])
def pensions_delete():
    id = request.args.get("id")
    cur = mysql.connection.cursor()
    cur.execute("delete from pensions where id=%s",[id])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("pensions"))

@app.route("/land-delete", methods=["GET","POST"])
def land_delete():
    id = request.args.get("id")
    cur = mysql.connection.cursor()
    cur.execute("delete from land where id=%s",[id])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("land"))

@app.route("/jtsecr-delete", methods=["GET","POST"])
def jtsecr_delete():
    PID = request.args.get("PID")
    cur = mysql.connection.cursor()
    cur.execute("delete from jt_secr where PID=%s",[PID])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("jtsecr"))

@app.route("/cantonment-delete", methods=["GET","POST"])
def cantonment_delete():
    id = request.args.get("id")
    cur = mysql.connection.cursor()
    cur.execute("delete from cantonment where id=%s",[id])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("cantonment"))

@app.route("/asecr-delete", methods=["GET","POST"])
def asecr_delete():
    PID = request.args.get("PID")
    cur = mysql.connection.cursor()
    cur.execute("delete from asecr where PID=%s",[PID])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for("asecr"))

@app.route("/workforce-update", methods=["GET","POST"])
def workforce_update():
    PID = request.args.get("PID")
    if request.method == 'POST':
        workforceDetails = request.form
        name = workforceDetails['name']
        age = (workforceDetails['age'])
        address = workforceDetails['address']
        phone = (workforceDetails['phone'])
        salary = (workforceDetails['salary'])
        sw_id = (workforceDetails['sw_id'])
        w_id = (workforceDetails['w_id'])
        dob = workforceDetails['dob']
        cur = mysql.connection.cursor()
        cur.execute("update work_force set name=%s,age=%s,addr=%s,ph_no=%s,salary=%s,sw_id=%s,wing_id=%s,dob=%s where PID=%s",(name,age,address,phone,salary,sw_id,w_id,dob,[PID]))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("workforce"))
    else:
        return render_template("workforce-update.html",data=[PID])

@app.route("/wings-update", methods=["GET","POST"])
def wings_update():
    wi_id = request.args.get("w_id")
    if request.method == 'POST':
        workforceDetails = request.form
        asecr_id = (workforceDetails['asecr_id'])
        hq = workforceDetails['hq']
        name = workforceDetails['name']
        try:
            cur = mysql.connection.cursor()
            cur.execute("update wings set Asecr_id=%s,HQ=%s,Name=%s where Wing_id=%s",(asecr_id,hq,name,wi_id))
            mysql.connection.commit()
            cur.close()
        except:
            return redirect(url_for("home"))
        return redirect(url_for("wings"))
    else:
        return render_template("wings-update.html",data=[wi_id])

@app.route("/subwings-update", methods=["GET","POST"])
def subwings_update():
    sw_id = request.args.get("sw_id")
    if request.method == 'POST':
        workforceDetails = request.form
        asecr_id = (workforceDetails['asecr_id'])
        jt_secr = (workforceDetails['jt_secr'])
        w_id = (workforceDetails['w_id'])
        hq = workforceDetails['hq']
        name = workforceDetails['name']
        try:
            cur = mysql.connection.cursor()
            cur.execute("update sub_wings set Asecr_id=%s,HQ=%s,Name=%s,Wing_id=%s,Jt_Secr=%s where SW_id=%s",(asecr_id,hq,name,w_id,jt_secr,sw_id))
            mysql.connection.commit()
            cur.close()
        except:
            return redirect(url_for("home"))
        return redirect(url_for("subwings"))
    else:
        return render_template("subwings-update.html",data=[sw_id])

@app.route("/pensions-update", methods=["GET","POST"])
def pensions_update():
    id = request.args.get("id")
    if request.method == 'POST':
        workforceDetails = request.form
        address = workforceDetails['address']
        phone = (workforceDetails['phone'])
        sw_id = workforceDetails['sw_id']
        yos = (workforceDetails['yos'])
        ammount = (workforceDetails['ammount'])
        dc = (workforceDetails['dc'])
        age = (workforceDetails['age'])
        name = (workforceDetails['name'])
        w_id = (workforceDetails['w_id'])
        cur = mysql.connection.cursor()
        cur.execute("update pensions set addr=%s,phone=%s,sw_id=%s,yos=%s,amt=%s,dependentCount=%s,age=%s,name=%s,wing_id=%s where ID=%s",(address,phone,sw_id,yos,ammount,dc,age,name,w_id,[id]))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("pensions"))
    else:
        return render_template("pensions-update.html",data=[id])

@app.route("/land-update", methods=["GET","POST"])
def land_update():
    id = request.args.get("id")
    if request.method == 'POST':
        workforceDetails = request.form
        sw_id = (workforceDetails['sw_id'])
        w_id = (workforceDetails['w_id'])
        address = workforceDetails['address']
        cur = mysql.connection.cursor()
        cur.execute("update land set sw_id=%s,wing_id=%s,addr=%s where id=%s",(sw_id,w_id,address,id))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("land"))
    else:
        return render_template("land-update.html",data=[id])

@app.route("/jtsecr-update", methods=["GET","POST"])
def jtsecr_update():
    PID = request.args.get("PID")
    if request.method == 'POST':
        workforceDetails = request.form
        w_id = (workforceDetails['w_id'])
        sw_id = (workforceDetails['sw_id'])
        name = workforceDetails['name']
        asecr_id = (workforceDetails['asecr_id'])
        cur = mysql.connection.cursor()
        cur.execute("update jt_secr set wing_id=%s,sw_id=%s,name=%s,asecr_id=%s where PID=%s",(w_id,sw_id,name,asecr_id,[PID]))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("jtsecr"))
    else:
        return render_template("jtsecr-update.html",data=[PID])

@app.route("/cantonment-update", methods=["GET","POST"])
def cantonment_update():
    id = request.args.get("id")
    if request.method == 'POST':
        workforceDetails = request.form
        w_id = (workforceDetails['w_id'])
        sw_id = (workforceDetails['sw_id'])
        cur = mysql.connection.cursor()
        cur.execute("update cantonment set wing_id=%s,sw_id=%s where id=%s",(w_id,sw_id,[id]))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("cantonment"))
    else:
        return render_template("cantonment-update.html",data=[id])

@app.route("/asecr-update", methods=["GET","POST"])
def asecr_update():
    PID = request.args.get("PID")
    if request.method == 'POST':
        workforceDetails = request.form
        name = workforceDetails['name']
        w_id = (workforceDetails['w_id'])
        cur = mysql.connection.cursor()
        cur.execute("update asecr set name=%s,w_id=%s where PID=%s",(name,w_id,[PID]))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("asecr"))
    else:
        return render_template("asecr-update.html",data=[PID])
app.run(debug=True)

