import 'package:http/http.dart' as http;

String _serverUrl = 'http://192.168.1.9:5000';
int localTemp = -1;

void getLocalTemp() async {
  var response = await http.get(_serverUrl);
  localTemp = int.parse(response.body);
}
