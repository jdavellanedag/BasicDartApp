import 'package:http/http.dart' as http;
import 'package:paquetes/classes/counrty.dart';
import 'package:paquetes/classes/reqres_respuesta.dart';

void getReqResp_service() {
  final url = 'https://reqres.in/api/users?page=2';
  http.get(url).then((res) {
    final resReqRes = reqResRespuestaFromJson(res.body);
    print('Page: ${resReqRes.page}');
    print('Per_age: ${resReqRes.perPage}');
    print('Third_element: ${resReqRes.data[2].id}');
  });
}

void getCountry() {
  final url = 'https://restcountries.eu/rest/v2/alpha/col';
  http.get(url).then((res) {
    final col = countryFromJson(res.body);
    print('===================================');
    print('Pais: ${col.name}');
    print('Poblacion: ${col.population}');
    print('Fronteras:');
    col.borders.forEach((e) => print('   $e'));
    print('Lenguaje: ${col.languages[0].nativeName}');
    print('Latitud: ${col.latlng[0]}');
    print('Longitud: ${col.latlng[1]}');
    print('Moneda: ${col.currencies[0].name}');
    print('Bandera: ${col.flag}');
    print('===================================');
  });
}
