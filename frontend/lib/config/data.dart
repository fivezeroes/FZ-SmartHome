import 'package:http/http.dart' as http;

String _serverUrl = 'http://192.168.1.9:5000';
int localTemp = -1;
int localTempTarget = 72;

int thermostatMode = 1; //0=off, 1=fan, 2=AC, 3=Heat

void getLocalTemp() async {
  var response = await http.get(_serverUrl);
  localTemp = int.parse(response.body);
}

void incrementLocalTempTarget() async {
  var response = await http.post(_serverUrl + '/increment');
  localTemp = int.parse(response.body);
}

void decrementLocalTempTarget() async {
  var response = await http.post(_serverUrl + '/decrement');
  localTemp = int.parse(response.body);
}

void getThermostatMode() {
  thermostatMode = 3;
}

void changeThermostatMode() {
  thermostatMode = (thermostatMode + 1) % 4;
}
