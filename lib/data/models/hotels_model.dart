
class Hotel{
  String name='';
String phone='';
int rooms=0;
List photos=[];
  String description='';

  Hotel(this.name,this.phone,this.description,this.photos,this.rooms);
  Hotel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    phone=json['phone'];
    rooms=json['rooms'];
    photos=json['photos'];
    description=json['description'];

  }
}
