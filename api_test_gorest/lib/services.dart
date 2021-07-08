import 'package:http/http.dart' as http;
import 'data_class.dart';

class Services {
  static const url = 'https://gorest.co.in/public-api/users';

  static Future<List<Welcome>> getData() async {
    String datosResultado = "";
    datosResultado = datosResultado.toString();
    Welcome objdatosUsuarios;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        objdatosUsuarios = Welcome.fromJson(jsonDecode(datosResultado));
        print(objdatosUsuarios);
      } else {
        List<Welcome>.empty();
        print('Lista vacía 1');
      }
    } catch (e) {
      List<Welcome>.empty();
      print(e);
      print('Lista vacía 2');
    }
    return datosUsuarios;
  }
}
