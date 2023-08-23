import 'package:http/http.dart' as http;

const String ip = '192.168.134.51';
const String port = '9443';

class NetworkHelper {
  NetworkHelper(this.response);
  final http.Response response;
  bool getData() {
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
