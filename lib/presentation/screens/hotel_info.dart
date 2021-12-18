import 'package:flutter/material.dart';
import 'package:manta_ray_demo/data/models/hotels_model.dart';

class HotelInfo extends StatelessWidget {
  Hotel hotel;

  HotelInfo({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [const SizedBox(height: double.infinity,),
          SizedBox(
            child: Image.network(
              hotel.photos.first['url'],
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
          ),
          Positioned(
            bottom: 0,
            child: Container(height: MediaQuery.of(context).size.height/1.9,width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
              color: Colors. white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      hotel.name,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 22, height: 1.3),
                    ),
                      Row(
                        children: [
                       const   Icon(Icons.call,color: Colors.blue,),
                          Text(
                          hotel.phone,
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 22, height: 1.3),
                    ),
                        ],
                      ),
                    const Divider(),
                    Text('Rooms available: ${hotel.rooms}',style: const TextStyle(fontSize: 18),),

                   const Padding(
                      padding:  EdgeInsets.only(top: 20),
                      child:  Text('Description:',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Text(hotel.description,style: const TextStyle(fontWeight: FontWeight.w600,height: 1.7),overflow: TextOverflow.ellipsis,maxLines: 10,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
