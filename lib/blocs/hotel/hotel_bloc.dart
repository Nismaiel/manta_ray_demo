import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:manta_ray_demo/data/models/hotels_model.dart';
import 'package:manta_ray_demo/data/repositories/hotels_repo.dart';

part 'hotel_event.dart';

part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>((event, emit) {
      if (event is GetHotels) {
        _mapLoadHotels();
      }
    });
  }

  _mapLoadHotels() async {
    final HotelsRepo hotelsRepo = HotelsRepo();

    emit(HotelsLoading());
    try {
      List<Hotel> hotels = await hotelsRepo.getAllHotels();
      emit(HotelsLoaded(hotels));
    } catch (e) {
      print(e);
      emit(HotelsError(e.toString()));
    }
  }
}
