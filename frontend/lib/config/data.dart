//eventually this file will be replaced with modular data systems, i.e. arduino thermostat module, Philips Hue lights module
import 'package:http/http.dart' as http;

String _serverUrl = "";
int localTemp = 72;
int localTempTarget = 72;

int thermostatMode = 1; //0=off, 1=fan, 2=AC, 3=Heat

String theme;
bool oLED;

void getLocalTemp() async {
  var response = await http.get(_serverUrl);
  localTemp = int.parse(response.body);
}

void incrementLocalTempTarget() async {
  var response = await http.post(_serverUrl + "/increment");
  localTempTarget = int.parse(response.body);
}

void decrementLocalTempTarget() async {
  var response = await http.post(_serverUrl + "/decrement");
  localTempTarget = int.parse(response.body);
}

void getThermostatMode() {
  thermostatMode = 3;
}

void changeThermostatMode() {
  thermostatMode = (thermostatMode + 1) % 4;
}
