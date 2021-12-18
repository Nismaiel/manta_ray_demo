import 'package:flutter/material.dart';
import 'package:manta_ray_demo/data/models/hotels_model.dart';


class HotelItem extends StatefulWidget {
  final Hotel hotel;

  const HotelItem({Key? key, required this.hotel}) : super(key: key);

  @override
  _HotelItemState createState() => _HotelItemState();
}

class _HotelItemState extends State<HotelItem> {




  Widget HotelTile() {
    return  Stack(
      children: [
        Container(
          height:
          MediaQuery.of(context).size.height / 2,
          decoration:const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                Color.fromARGB(62, 168, 174, 201),
                offset: Offset(0, 9),
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.hotel.photos.first['url'],
                  height: MediaQuery.of(context)
                      .size
                      .height /
                      3,
                  width: MediaQuery.of(context)
                      .size
                      .width /
                      2,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: MediaQuery.of(context)
                          .size
                          .height /
                          8,
                      width: MediaQuery.of(context)
                          .size
                          .width /
                          2,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            Colors.black
                                .withOpacity(0.8),
                            Colors.black
                                .withOpacity(0.7),
                            Colors.black
                                .withOpacity(0.6),
                            Colors.black
                                .withOpacity(0.6),
                            Colors.black
                                .withOpacity(0.4),
                            Colors.black
                                .withOpacity(0.1),
                            Colors.black
                                .withOpacity(0.05),
                            Colors.black
                                .withOpacity(0.025),
                          ],
                        ),
                      ),
                      child: Padding(
                          padding:
                          const EdgeInsets.only(
                              top: 8.0),
                          child: Container())),
                ),
                Positioned(
                  right: MediaQuery.of(context)
                      .size
                      .width /
                      50,
                  left: MediaQuery.of(context)
                      .size
                      .width /
                      50,
                  bottom: MediaQuery.of(context)
                      .size
                      .height /
                      60,
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.hotel.name,
                        style:const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight:
                            FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.hotel.phone,
                        style:const TextStyle(overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight:
                            FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return HotelTile();
  }
}