import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:manta_ray_demo/data/models/hotels_model.dart';
import 'package:manta_ray_demo/data/services/hotel_web_service.dart';

class HotelsRepo {
  final HotelWebService hotelWebService = HotelWebService();

  Future<List<Hotel>> getAllHotels() async {
    try {
      final QueryResult response = await hotelWebService.fetchHotels();
      List<Hotel> hotels = <Hotel>[];
      response.data!.forEach((key, value) {
        value.forEach((t) {
          hotels.add(Hotel.fromJson(t));
        });
      });
      return hotels;
    } catch (e) {
      throw Exception(e);
    }
  }
}
