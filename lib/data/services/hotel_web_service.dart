import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:manta_ray_demo/constants/app_queries.dart';

class HotelWebService{
static HttpLink httpLink=HttpLink('https://api-eu-central-1.graphcms.com/v2/ckx8xx6l006d601xi7de045hb/master');
  final GraphQLClient client=GraphQLClient(link:httpLink , cache:GraphQLCache());
final QueryOptions options = QueryOptions(document:AppQueries().allQueries);

Future fetchHotels()async{
  try {
    final QueryResult queryResult = await client.query(options);
  return queryResult;
  }catch(e){throw Exception(e);}

}



}