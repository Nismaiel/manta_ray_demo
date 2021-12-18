import 'package:gql/language.dart' as q;
class AppQueries{
  final allQueries = q.parseString('''
query MyQuery {
  hotels {
    name
    phone
    rooms
    description

    photos {
      url
    }
  }
}


  ''');
}