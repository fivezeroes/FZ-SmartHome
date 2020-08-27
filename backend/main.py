from time import sleep, asctime
from flask import Flask, jsonify
from multiprocessing import Process, Value
from w1thermsensor import W1ThermSensor
import datetime
import mysql.connector
import configparser

config = configparser.ConfigParser()
config.read('config.ini')
host = config['mysql']['host']
user = config['mysql']['user']
password = config['mysql']['password']
database = config['mysql']['database']

mydb = mysql.connector.connect(host=host, user=user, password=password, database=database)
mycursor = mydb.cursor()


sensor = W1ThermSensor()

app = Flask(__name__)
value = Value('d', 0.0)

@app.route('/')
def getValue():
    return jsonify(value.value)

def sensorDaemon():
    while True:
        time = datetime.datetime.now()
        value.value = sensor.get_temperature()
        tempF = ((value.value*9)/5)+32
        sql = "INSERT INTO temps (time, temp) VALUES (%s, %s)"
        val = (time, value.value)
        mycursor.execute(sql, val)
        mydb.commit()
        print(asctime(), "value is:", value.value, tempF)
        sleep(1)
    mycursor.close()
    mydb.close()

if __name__ == "__main__":
   p = Process(target=sensorDaemon, args=())
   p.start()
   app.run(debug=False, use_reloader=False, host='0.0.0.0')
   p.join()