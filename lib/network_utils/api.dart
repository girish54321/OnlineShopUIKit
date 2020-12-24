import 'package:http/http.dart' as http;

class Network {
  getDataFormApi(url) async {
    return await http.get(url, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
