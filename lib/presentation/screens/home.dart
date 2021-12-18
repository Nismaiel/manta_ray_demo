import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manta_ray_demo/blocs/hotel/hotel_bloc.dart';
import 'package:manta_ray_demo/data/models/hotels_model.dart';
import 'package:manta_ray_demo/presentation/screens/hotel_item.dart';

import 'hotel_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HotelBloc>(context);
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<HotelBloc, HotelState>(builder: (ctx, state) {
      if (state is HotelsLoading) {
        return const Center(
            child: CircularProgressIndicator(color: Colors.green));
      } else if (state is HotelsLoaded) {
        return buildLoadedListWidget(state.hotels);
      } else if (state is HotelsError) {
        return ErrorWidget(state.message);
      } else {
        return const Center(
            child: CircularProgressIndicator(color: Colors.yellow));
      }
    });
  }

  Widget buildLoadedListWidget(products) {
    return RefreshIndicator(
        child: SingleChildScrollView(
          physics:
           const   AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: buildProductGrid(products),
        ),
        onRefresh: () async {
          BlocProvider.of<HotelBloc>(context).add(GetHotels());
        });
  }

  Widget buildProductGrid(List<Hotel> hotels) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: hotels.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (ctx) => HotelInfo(hotel: hotels[index])));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HotelItem(
                hotel: hotels[index],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Traveller',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: buildBlocWidget());
  }
}
