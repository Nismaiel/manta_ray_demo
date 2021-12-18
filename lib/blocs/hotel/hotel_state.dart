part of 'hotel_bloc.dart';

abstract class HotelState extends Equatable {
  const HotelState();
}

class HotelInitial extends HotelState {
  @override
  List<Object> get props => [];
}
class HotelsLoading extends HotelInitial{}
class HotelsLoaded extends HotelInitial{
 final   List<Hotel> hotels;
  HotelsLoaded(this.hotels);

}
class HotelsError extends HotelInitial{
  final String message;

  HotelsError(this.message);
}