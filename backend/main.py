import time
from flask import Flask, jsonify
from multiprocessing import Process, Value
from w1thermsensor import W1ThermSensor

sensor = W1ThermSensor()

app = Flask(__name__)
value = Value('d', 0.0)

@app.route('/')
def getValue():
    return jsonify(value.value)

def sensorDaemon():
    while True:
        value.value = sensor.get_temperature()
        tempF = ((value.value*9)/5)+32
        print(time.asctime(), "value is:", value.value, tempF)
        time.sleep(1)

if __name__ == "__main__":
   p = Process(target=sensorDaemon, args=())
   p.start()
   app.run(debug=False, use_reloader=False, host='0.0.0.0')
   p.join()