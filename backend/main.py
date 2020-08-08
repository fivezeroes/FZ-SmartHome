import time
from flask import Flask, jsonify
from multiprocessing import Process, Value

app = Flask(__name__)
value = Value('i', 72)
@app.route('/decrement', methods=['POST'])
def decrement():
    value.value -= 1
    return jsonify(value.value)

@app.route('/increment', methods=['POST'])
def increment():
    value.value += 1
    return jsonify(value.value)

@app.route('/')
def getValue():
    return jsonify(value.value)

def printValue():
    while True:
        print(time.asctime(), "value is:", value.value)
        time.sleep(5)

def func(value):
    while True:
        value.value += 1
        print(value.value)

if __name__ == "__main__":
   #procs = [Process(target=func, args=(value, )) for i in range(8)]
   #for proc in procs: proc.start()
   #for proc in procs: proc.join()
   p = Process(target=printValue, args=())
   p.start()
   app.run(debug=False, use_reloader=False, host='0.0.0.0')
   p.join()