import 'Agent.dart';
import 'Images.dart';

class Kupeza {
//  int ;
  String media;
  String purpose;
  String title;
  String bedrooms;
  String type;
  String description;
  String indoreammenties;
  String outdoorammenties;
  String amenities;
  String angle;
  String created;
  String longitude;
  String latitude;
  String price;
  String bathrooms;
  String address;
  String city;
  String squarefeet;
  String attachedbath;
  String priceunit;
  String unittype;
  String commonbath;
  int diningspace;
  int livingroom;
  String floor;
  String balcony;
  String slug;
  List<String> indore;
  List<String> outdoor;
  List<Images> images;
  bool fav;
  Agent agent;




  Kupeza({
    this.fav,
    this.city,
    this.priceunit,
    this.unittype,
    this.indore,
    this.outdoor,
    this.media,
    this.purpose,
    this.title,
    this.price,
    this.bedrooms,
    this.type ,
    this.description ,
    this.indoreammenties ,
    this.outdoorammenties ,
    this.amenities ,
    this.angle ,
    this.created ,
    this.longitude ,
    this.latitude ,
    this.bathrooms,
    this.images,
    this.agent,
    this.address,
    this.squarefeet,
    this.floor,
    this.attachedbath,
    this.commonbath,
    this.balcony,
    this.diningspace,
    this.livingroom,
    this.slug,

  }) ;




  factory Kupeza.fromJson(Map<String, dynamic> json) {

    var list = json['gallery_url'] as List;
    List<Images> imagesList = list.map((i) => Images.fromJson(i)).toList();

    return Kupeza(

      media: json['media_url'],
      purpose: json['purpose'],
      title: json['title'],
      address: json['address'],
      bedrooms: json['bedrooms'],
      type: json['type'],
      price: json['price'],
      description: json['description'],
      amenities: json['amenities'],
      angle: json['angle'],
      created: json['created_at'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      bathrooms: json['bathrooms'],
      indore : new List<String>.from(json['indore_ammenties']),
      outdoor : new List<String>.from(json['outdoor_ammenties']),
      images: imagesList,
      city:json['city'],
      floor:json['floor'],
      priceunit : json['price_per_unit'],
      unittype : json['unit_type'],
      attachedbath:json['attached_bath'],
      commonbath:json['common_bath'],
      squarefeet:json['square_feet'],
      balcony:json['balcony'],
      diningspace:json['dining_space'],
      livingroom:json['living_room'],
      slug:json['slug'],
      fav:json['fav'],
      agent:Agent.fromJson(json['agent']),

    );
  }
}