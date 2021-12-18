part of 'hotel_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetHotels extends HotelEvent{

}
