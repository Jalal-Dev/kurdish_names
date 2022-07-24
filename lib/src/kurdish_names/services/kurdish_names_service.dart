import 'package:http/http.dart' as http;
import 'package:kurdish_names/src/kurdish_names/models/names_data_model.dart';

class KurdishNamesService {
  // https://github.com/DevelopersTree/nawikurdi
  // https://nawikurdi.com

  // API End point : https://nawikurdi.com/api

  Future<KurdishNames> fetchListOfNames() async {
    //TODO: create URI

    // scheme: https, host:nawikurdi.com, path: api

//     var httpsUri = Uri(
//     scheme: 'https',
//     host: 'dart.dev',
//     path: '/guides/libraries/library-tour',
//     fragment: 'numbers');
// print(httpsUri);   // https://dart.dev/guides/libraries/library-tour#numbers

    Uri _kurdishNamesUri = Uri(
        scheme: 'https',
        host: 'nawikurdi.com',
        path: 'api',
        queryParameters: {"limit": "15", "gender": "F", "offset": "0"});
    http.Response _response =
        await http.get(_kurdishNamesUri).catchError((err) => print(err));
    KurdishNames _kurdishNames = KurdishNames.fromJson(_response.body);
    print(_response.body);
    return _kurdishNames;
  }
}
