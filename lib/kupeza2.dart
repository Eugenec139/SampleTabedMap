/// media_url : "https://kupeza.co.zm/uploads/images/thumbs/1570792374zj8bn-img-20190131-wa0022.jpg"
/// gallery_url : [{"media_name":"1570792374zj8bn-img-20190131-wa0022.jpg","id":314},{"media_name":"1570792384r8vw1-img-20190131-wa0028.jpg","id":315},{"media_name":"1570792387vu5wm-img-20190131-wa0026.jpg","id":316},{"media_name":"1570792399jtoxu-img-20190131-wa0005.jpg","id":317},{"media_name":"1570792408xblzp-img-20190131-wa0001.jpg","id":318},{"media_name":"1570792411dqdna-img-20190131-wa0002.jpg","id":319},{"media_name":"1570792414pooel-img-20190131-wa0003.jpg","id":320},{"media_name":"1570792420haqr3-img-20190131-wa0004.jpg","id":321},{"media_name":"15707924249pnpe-img-20190131-wa0006.jpg","id":322},{"media_name":"15707924327oegd-img-20190131-wa0007.jpg","id":323},{"media_name":"1570792435lusb7-img-20190131-wa0008.jpg","id":324},{"media_name":"1570792451pocid-img-20190131-wa0009.jpg","id":325},{"media_name":"1570792454jgs0r-img-20190131-wa0010.jpg","id":326},{"media_name":"1570792457adcwz-img-20190131-wa0011.jpg","id":327},{"media_name":"1570792460z2nxu-img-20190131-wa0008.jpg","id":328},{"media_name":"157079250556s8f-img-20190131-wa0012.jpg","id":329},{"media_name":"1570792511wjakl-img-20190131-wa0013.jpg","id":330},{"media_name":"1570792514jaxdz-img-20190131-wa0014.jpg","id":331},{"media_name":"15707925182gvct-img-20190131-wa0015.jpg","id":332},{"media_name":"15707925228pcif-img-20190131-wa0016.jpg","id":333},{"media_name":"1570792526l8pty-img-20190131-wa0017.jpg","id":334},{"media_name":"1570792531vb6ur-img-20190131-wa0018.jpg","id":335},{"media_name":"15707925402jakc-img-20190131-wa0019.jpg","id":336},{"media_name":"1570792543wcfsf-img-20190131-wa0020.jpg","id":337},{"media_name":"1570792551roght-img-20190131-wa0024.jpg","id":338},{"media_name":"15707925688rqed-img-20190131-wa0023.jpg","id":339},{"media_name":"1570792571x9imt-img-20190131-wa0025.jpg","id":340}]
/// amenities : "a:3:{i:115;s:3:\"115\";i:116;s:3:\"116\";i:121;s:3:\"121\";}"
/// outdoor_ammenties : []
/// angle : "0.52"
/// indore_ammenties : ["Air condition","Cable TV","Tiled Floor "]
/// purpose : "rent"
/// title : "Kalundu Kabompo Road"
/// bedrooms : "3"
/// type : "apartment"
/// description : "Executive fully furnished apartments for rent in kalundu on kabompo road. 3 bedrooms M.S.C."
/// bathrooms : "1"
/// square_feet : ""
/// address : "Kalundu Kabompo Road"
/// city : "Lusaka"
/// created_at : "3 months ago"
/// floor : "2 Stories"
/// attached_bath : "1"
/// common_bath : "1"
/// balcony : "1"
/// dining_space : 1
/// living_room : 1
/// price_plan : "regular"
/// status : 1
/// video_url : ""
/// slug : "kalundu-kabompo-road"
/// fav : false
/// price_per_unit : "0"
/// unit_type : "sqft"
/// agent : {"name":"Vera Kamunga","first_name":null,"last_name":null,"email":"vera.fairworld@gmail.com","address":"","website":null,"phone":"+26068025268","photo":null,"agency":""}
/// longitude : "28.327425861668758"
/// latitude : "-15.386064518125709"
/// route : "https://kupeza.co.zm/ad/kalundu-kabompo-road"
/// price : "20,000"

class Kupeza2 {
  String _mediaUrl;
  List<Gallery_urlBean> _galleryUrl;
  String _amenities;
  List<dynamic> _outdoorAmmenties;
  String _angle;
  List<String> _indoreAmmenties;
  String _purpose;
  String _title;
  String _bedrooms;
  String _type;
  String _description;
  String _bathrooms;
  String _squareFeet;
  String _address;
  String _city;
  String _createdAt;
  String _floor;
  String _attachedBath;
  String _commonBath;
  String _balcony;
  int _diningSpace;
  int _livingRoom;
  String _pricePlan;
  int _status;
  String _videoUrl;
  String _slug;
  bool _fav;
  String _pricePerUnit;
  String _unitType;
  AgentBean _agent;
  String _longitude;
  String _latitude;
  String _route;
  String _price;

  String get mediaUrl => _mediaUrl;
  List<Gallery_urlBean> get galleryUrl => _galleryUrl;
  String get amenities => _amenities;
  List<dynamic> get outdoorAmmenties => _outdoorAmmenties;
  String get angle => _angle;
  List<String> get indoreAmmenties => _indoreAmmenties;
  String get purpose => _purpose;
  String get title => _title;
  String get bedrooms => _bedrooms;
  String get type => _type;
  String get description => _description;
  String get bathrooms => _bathrooms;
  String get squareFeet => _squareFeet;
  String get address => _address;
  String get city => _city;
  String get createdAt => _createdAt;
  String get floor => _floor;
  String get attachedBath => _attachedBath;
  String get commonBath => _commonBath;
  String get balcony => _balcony;
  int get diningSpace => _diningSpace;
  int get livingRoom => _livingRoom;
  String get pricePlan => _pricePlan;
  int get status => _status;
  String get videoUrl => _videoUrl;
  String get slug => _slug;
  bool get fav => _fav;
  String get pricePerUnit => _pricePerUnit;
  String get unitType => _unitType;
  AgentBean get agent => _agent;
  String get longitude => _longitude;
  String get latitude => _latitude;
  String get route => _route;
  String get price => _price;

  Kupeza2(this._mediaUrl, this._galleryUrl, this._amenities, this._outdoorAmmenties, this._angle, this._indoreAmmenties, this._purpose, this._title, this._bedrooms, this._type, this._description, this._bathrooms, this._squareFeet, this._address, this._city, this._createdAt, this._floor, this._attachedBath, this._commonBath, this._balcony, this._diningSpace, this._livingRoom, this._pricePlan, this._status, this._videoUrl, this._slug, this._fav, this._pricePerUnit, this._unitType, this._agent, this._longitude, this._latitude, this._route, this._price);

  Kupeza2.map(dynamic obj) {
    this._mediaUrl = obj["mediaUrl"];
    this._galleryUrl = obj["galleryUrl"];
    this._amenities = obj["amenities"];
    this._outdoorAmmenties = obj["outdoorAmmenties"];
    this._angle = obj["angle"];
    this._indoreAmmenties = obj["indoreAmmenties"];
    this._purpose = obj["purpose"];
    this._title = obj["title"];
    this._bedrooms = obj["bedrooms"];
    this._type = obj["type"];
    this._description = obj["description"];
    this._bathrooms = obj["bathrooms"];
    this._squareFeet = obj["squareFeet"];
    this._address = obj["address"];
    this._city = obj["city"];
    this._createdAt = obj["createdAt"];
    this._floor = obj["floor"];
    this._attachedBath = obj["attachedBath"];
    this._commonBath = obj["commonBath"];
    this._balcony = obj["balcony"];
    this._diningSpace = obj["diningSpace"];
    this._livingRoom = obj["livingRoom"];
    this._pricePlan = obj["pricePlan"];
    this._status = obj["status"];
    this._videoUrl = obj["videoUrl"];
    this._slug = obj["slug"];
    this._fav = obj["fav"];
    this._pricePerUnit = obj["pricePerUnit"];
    this._unitType = obj["unitType"];
    this._agent = obj["agent"];
    this._longitude = obj["longitude"];
    this._latitude = obj["latitude"];
    this._route = obj["route"];
    this._price = obj["price"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["mediaUrl"] = _mediaUrl;
    map["galleryUrl"] = _galleryUrl;
    map["amenities"] = _amenities;
    map["outdoorAmmenties"] = _outdoorAmmenties;
    map["angle"] = _angle;
    map["indoreAmmenties"] = _indoreAmmenties;
    map["purpose"] = _purpose;
    map["title"] = _title;
    map["bedrooms"] = _bedrooms;
    map["type"] = _type;
    map["description"] = _description;
    map["bathrooms"] = _bathrooms;
    map["squareFeet"] = _squareFeet;
    map["address"] = _address;
    map["city"] = _city;
    map["createdAt"] = _createdAt;
    map["floor"] = _floor;
    map["attachedBath"] = _attachedBath;
    map["commonBath"] = _commonBath;
    map["balcony"] = _balcony;
    map["diningSpace"] = _diningSpace;
    map["livingRoom"] = _livingRoom;
    map["pricePlan"] = _pricePlan;
    map["status"] = _status;
    map["videoUrl"] = _videoUrl;
    map["slug"] = _slug;
    map["fav"] = _fav;
    map["pricePerUnit"] = _pricePerUnit;
    map["unitType"] = _unitType;
    map["agent"] = _agent;
    map["longitude"] = _longitude;
    map["latitude"] = _latitude;
    map["route"] = _route;
    map["price"] = _price;
    return map;
  }

}

/// name : "Vera Kamunga"
/// first_name : null
/// last_name : null
/// email : "vera.fairworld@gmail.com"
/// address : ""
/// website : null
/// phone : "+26068025268"
/// photo : null
/// agency : ""

class AgentBean {
  String _name;
  dynamic _firstName;
  dynamic _lastName;
  String _email;
  String _address;
  dynamic _website;
  String _phone;
  dynamic _photo;
  String _agency;

  String get name => _name;
  dynamic get firstName => _firstName;
  dynamic get lastName => _lastName;
  String get email => _email;
  String get address => _address;
  dynamic get website => _website;
  String get phone => _phone;
  dynamic get photo => _photo;
  String get agency => _agency;

  AgentBean(this._name, this._firstName, this._lastName, this._email, this._address, this._website, this._phone, this._photo, this._agency);

  AgentBean.map(dynamic obj) {
    this._name = obj["name"];
    this._firstName = obj["firstName"];
    this._lastName = obj["lastName"];
    this._email = obj["email"];
    this._address = obj["address"];
    this._website = obj["website"];
    this._phone = obj["phone"];
    this._photo = obj["photo"];
    this._agency = obj["agency"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["email"] = _email;
    map["address"] = _address;
    map["website"] = _website;
    map["phone"] = _phone;
    map["photo"] = _photo;
    map["agency"] = _agency;
    return map;
  }

}

/// media_name : "1570792374zj8bn-img-20190131-wa0022.jpg"
/// id : 314

class Gallery_urlBean {
  String _mediaName;
  int _id;

  String get mediaName => _mediaName;
  int get id => _id;

  Gallery_urlBean(this._mediaName, this._id);

  Gallery_urlBean.map(dynamic obj) {
    this._mediaName = obj["mediaName"];
    this._id = obj["id"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["mediaName"] = _mediaName;
    map["id"] = _id;
    return map;
  }

}