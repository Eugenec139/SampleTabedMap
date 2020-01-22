import 'package:flutter/material.dart';
import 'package:flutter_app/Post/Post.dart';
import 'package:flutter_app/kupeza.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

const kGoogleApiKey = "AIzaSyDEIMjYd-mOfWIulF39YFFYGzIXa5vlU-g";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHomePage(),
    );
  }
}

class MyOtherPage extends StatefulWidget {
  MyOtherPage({Key key, this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyOtherPageState createState() => _MyOtherPageState();
}

class _MyOtherPageState extends State<MyOtherPage> with SingleTickerProviderStateMixin {
  BitmapDescriptor pinLocationIcon;
  BitmapDescriptor rentLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String error  = "Server host is having issues";
  List<Kupeza> listOfHomePosts = new List<Kupeza>();
  String authorization_value ='';
  String url = 'https://kupeza.co.zm/api/newsearcher?location=Lusaka';
  String urlloggedin = 'https://kupeza.co.zm/api/newsearcher2?location=Lusaka';
  LatLng pinPosition = LatLng(37.3797536, -122.1017334);
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  CameraPosition initialLocation = CameraPosition(
      zoom: 16,
      bearing: 30,
      target: LatLng(37.3797536, -122.1017334)
  );

  Future<List<Kupeza>> _fetchHomePosts() async {
    var headers = {
      //'Authorization':'Bearer '+ authorization_value,
      'Accept': 'application/json'

    };


    try {

      var response;
      if(authorization_value!= '') {
        response = await http.post(urlloggedin,headers: headers).timeout(const Duration(seconds: 50));


      }
      else {
        response = await http.post(url,headers: headers).timeout(const Duration(seconds: 50));


      }
      if (response.statusCode == 200) {
        final items = json.decode(response.body);
        final intems = items['data'];
        print(intems);
        List<Kupeza> listOfUsers1 = intems.map<Kupeza>((json) {
          return Kupeza.fromJson(json);
        }).toList();

        print(listOfUsers1);

        listOfHomePosts = listOfUsers1;

        for (var i=0; i< listOfHomePosts.length; i++) {

          if(i == 0){

            initialLocation  = CameraPosition(
              target: LatLng(double.parse( listOfHomePosts.elementAt(i).latitude), double.parse( listOfHomePosts.elementAt(i).longitude)),
              zoom: 12.4746,
            );

          }





          _markers.add(Marker(
            // This marker id can be anything that uniquely identifies each marker.
            markerId: MarkerId("suck"),
            position: LatLng(double.parse( listOfHomePosts.elementAt(i).latitude) , double.parse(  listOfHomePosts.elementAt(i).longitude)),
            infoWindow: InfoWindow(
              title:  listOfHomePosts.elementAt(i).title,
              snippet:  listOfHomePosts.elementAt(i).description,
            ),
            icon:  listOfHomePosts.elementAt(i).purpose  =='sale' ? pinLocationIcon : rentLocationIcon ,
          ));





        }


        return listOfUsers1;
      } else {
        print('Failed to load internet');

        final snackBar = SnackBar(
            duration: Duration(days: 365),
            backgroundColor: Colors.purple,


            content:Container(

                margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
                //padding: const EdgeInsets.all(8.0),

                child:  Text("Server host is having issues, please try again later",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color:Colors.white,
                ))),  action: SnackBarAction(
          textColor: Colors.white,

          label: 'RELOAD',
          onPressed: () {

            setState(() {


              listOfHomePosts= new List<Kupeza>();

            });
          },
        ));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        setState(() {


          error = "Server Host Is Having Issues";

          throw Exception('Server host is having issues');

        });

        print(response );
        throw Exception('Failed to load internet');
      }
    }
    catch (e) {

      print(e.toString());
      if (e.toString()=="SocketException: Failed host lookup: 'kupeza.co.zm' (OS Error: No address associated with hostname, errno = 7)"){
        final snackBar = SnackBar(
            duration: Duration(days: 365),
            backgroundColor: Colors.purple,


            content:Container(

                margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
                //padding: const EdgeInsets.all(8.0),

                child:  Text("Can't access the internet, please try again later",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color:Colors.white,
                ))),  action: SnackBarAction(
          textColor: Colors.white,

          label: 'RELOAD',
          onPressed: () {

            setState(() {


              listOfHomePosts = new List<Kupeza>();

            });
          },
        ));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        setState(() {


          error = "Can't Access The Internet";
          throw Exception("Can't Access The Internet");


        });




      } else if (e.toString()=="TimeoutException after 0:00:05.000000: Future not completed"){
        final snackBar = SnackBar(
            duration: Duration(days: 365),
            backgroundColor: Colors.purple,


            content:Container(

                margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
                //padding: const EdgeInsets.all(8.0),

                child:  Text("Internet is taking too long to connect, please try again later",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color:Colors.white,
                ))),  action: SnackBarAction(
          textColor: Colors.white,

          label: 'RELOAD',
          onPressed: () {

            setState(() {

              listOfHomePosts= new List<Kupeza>();


            });
          },
        ));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        setState(() {


          error = "Internet Is Taking Too Long To Connect";
          throw Exception('Internet is taking too long to connect');


        });

      }
      throw Exception('Internet is taking too long to connect');

    }
  }
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LISTING',),
    new Tab(text: 'MAP'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync:this ,initialIndex: 1);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        Navigator.of(context).pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) { return new MyHomePage(); }));
      }
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/sale.png').then((onValue) {
      pinLocationIcon = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/rent.png').then((onValue) {
      rentLocationIcon = onValue;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    TabBar _tabBar = new TabBar(
      indicatorSize:TabBarIndicatorSize.tab,
      controller: _tabController,
      indicatorColor: Colors.white,
      tabs: [
        GestureDetector(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) { return new MyHomePage(); }));
    },
            child:new Tab(text: 'LISTING',)),
        new Tab(text: 'MAP'),
      ],
      labelStyle: TextStyle(
        //fontSize: 20,
        fontWeight: FontWeight.w900,
        //color: Colors.white,

      ),
    );


    // these are the minimum required values to set
    // the camera position

    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor:Colors.purple,

        automaticallyImplyLeading: false, // hides leading widget
        flexibleSpace: GestureDetector(
          //onTap: () => showSearch(context: context, delegate: CustomSearchDelegate()),
            child:  Container(

              margin: const EdgeInsets.only(left: 14 ,top :50,right: 20),
              //padding: const EdgeInsets.all(8.0),

              child:                   Row(
                  children: [

                    Expanded( child:
                    GestureDetector(
                        onTap: () {

                          //onTapSearchPage();
                        } ,
                        child: Container(
                          padding:  const EdgeInsets.only(top: 15 ,bottom: 15 , left: 15 , right: 10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 204, 249, 0.3),

                              borderRadius: BorderRadius.all(Radius.circular(4.0))),


                          child: Row(
                              children: <Widget>[
                                Expanded(  child: Text(  'Search...eg Suburb, City',
                                    textAlign: TextAlign.left,

                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,

                                    ))),Icon(Icons.search,color:Colors.white,)]),

                        ) ))

                  ]

              ),
            )
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_tabBar.preferredSize.height + 50),
          child: _tabBar,
        ),
      ),
      body: listOfHomePosts.length > 0 ?Stack(

          children: <Widget>[ GoogleMap(
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              markers: _markers,
              initialCameraPosition: initialLocation,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setState(() {

                });
              }) ,Positioned(
              right: 30.0,
              left: 30.0,
              top: 0.0,
              child: Container(

                  child:Center(

                      child :Card (
                        //color:,

                          child : Container(
                            //color: Color.fromRGBO(255, 204, 249, 0.4),
                              padding:const EdgeInsets.only(left: 12,right: 12, top: 8 ,bottom: 8) ,
                              margin: const EdgeInsets.only(left: 0,top : 0 ,right: 0),
                              child:  Text( 'Showing ' + listOfHomePosts.length.toString() +' Results',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color:Color.fromRGBO(74, 77, 75, 0.9),
                                ),
                              ))) )))] ): FutureBuilder<List<Kupeza>>(
          future: _fetchHomePosts(), // async work
          builder: (BuildContext context, AsyncSnapshot<List<Kupeza>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return  Stack(

                      children: <Widget>[ GoogleMap(
                          zoomGesturesEnabled: true,
                          myLocationEnabled: true,
                          markers: _markers,
                          polylines: _polylines,
                          initialCameraPosition: initialLocation,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                            setState(() {

                            });
                          }) ,Positioned(
                          right: 30.0,
                          left: 30.0,
                          top: 0.0,
                          child: Container(

                              child:Center(

                                  child :Card (
                                    //color:,

                                      child : Container(
                                        //color: Color.fromRGBO(255, 204, 249, 0.4),
                                          padding:const EdgeInsets.only(left: 12,right: 12, top: 8 ,bottom: 8) ,
                                          margin: const EdgeInsets.only(left: 0,top : 0 ,right: 0),
                                          child:  Text( 'Showing ' +snapshot.data.length.toString() +' Results',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color:Color.fromRGBO(74, 77, 75, 0.9),
                                            ),
                                          ))) )))] );} }),

    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  BitmapDescriptor pinLocationIcon;
  BitmapDescriptor rentLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String error  = "Server host is having issues";
  List<Kupeza> listOfHomePosts = new List<Kupeza>();
  String authorization_value ='';
  String url = 'https://kupeza.co.zm/api/newsearcher?location=Lusaka';
  String urlloggedin = 'https://kupeza.co.zm/api/newsearcher2?location=Lusaka';
  LatLng pinPosition = LatLng(37.3797536, -122.1017334);
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  CameraPosition initialLocation = CameraPosition(
      zoom: 16,
      bearing: 30,
      target: LatLng(37.3797536, -122.1017334)
  );

  Future<List<Kupeza>> _fetchHomePosts() async {
    var headers = {
      //'Authorization':'Bearer '+ authorization_value,
      'Accept': 'application/json'

    };


    try {

      var response;
      if(authorization_value!= '') {
        response = await http.post(urlloggedin,headers: headers).timeout(const Duration(seconds: 50));


      }
      else {
        response = await http.post(url,headers: headers).timeout(const Duration(seconds: 50));


      }
      if (response.statusCode == 200) {
        final items = json.decode(response.body);
        final intems = items['data'];
        print(intems);
        List<Kupeza> listOfUsers1 = intems.map<Kupeza>((json) {
          return Kupeza.fromJson(json);
        }).toList();

        print(listOfUsers1);

        listOfHomePosts = listOfUsers1;

        for (var i=0; i< listOfHomePosts.length; i++) {

          if(i == 0){

            initialLocation  = CameraPosition(
              target: LatLng(double.parse( listOfHomePosts.elementAt(i).latitude), double.parse( listOfHomePosts.elementAt(i).longitude)),
              zoom: 12.4746,
            );

          }





          _markers.add(Marker(
            // This marker id can be anything that uniquely identifies each marker.
            markerId: MarkerId("suck"),
            position: LatLng(double.parse( listOfHomePosts.elementAt(i).latitude) , double.parse(  listOfHomePosts.elementAt(i).longitude)),
            infoWindow: InfoWindow(
              title:  listOfHomePosts.elementAt(i).title,
              snippet:  listOfHomePosts.elementAt(i).description,
            ),
            icon:  listOfHomePosts.elementAt(i).purpose  =='sale' ? pinLocationIcon : rentLocationIcon ,
          ));





        }


        return listOfUsers1;
      } else {
        print('Failed to load internet');

        final snackBar = SnackBar(
            duration: Duration(days: 365),
            backgroundColor: Colors.purple,


            content:Container(

                margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
                //padding: const EdgeInsets.all(8.0),

                child:  Text("Server host is having issues, please try again later",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color:Colors.white,
                ))),  action: SnackBarAction(
          textColor: Colors.white,

          label: 'RELOAD',
          onPressed: () {

            setState(() {


              listOfHomePosts= new List<Kupeza>();

            });
          },
        ));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        setState(() {


          error = "Server Host Is Having Issues";

          throw Exception('Server host is having issues');

        });

        print(response );
        throw Exception('Failed to load internet');
      }
    }
    catch (e) {

      print(e.toString());
      if (e.toString()=="SocketException: Failed host lookup: 'kupeza.co.zm' (OS Error: No address associated with hostname, errno = 7)"){
        final snackBar = SnackBar(
            duration: Duration(days: 365),
            backgroundColor: Colors.purple,


            content:Container(

                margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
                //padding: const EdgeInsets.all(8.0),

                child:  Text("Can't access the internet, please try again later",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color:Colors.white,
                ))),  action: SnackBarAction(
          textColor: Colors.white,

          label: 'RELOAD',
          onPressed: () {

            setState(() {


              listOfHomePosts = new List<Kupeza>();

            });
          },
        ));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        setState(() {


          error = "Can't Access The Internet";
          throw Exception("Can't Access The Internet");


        });




      } else if (e.toString()=="TimeoutException after 0:00:05.000000: Future not completed"){
        final snackBar = SnackBar(
            duration: Duration(days: 365),
            backgroundColor: Colors.purple,


            content:Container(

                margin: const EdgeInsets.only(left: 10 ,top :10, bottom :10 ,right: 10),
                //padding: const EdgeInsets.all(8.0),

                child:  Text("Internet is taking too long to connect, please try again later",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color:Colors.white,
                ))),  action: SnackBarAction(
          textColor: Colors.white,

          label: 'RELOAD',
          onPressed: () {

            setState(() {

              listOfHomePosts= new List<Kupeza>();


            });
          },
        ));
        _scaffoldKey.currentState.showSnackBar(snackBar);
        setState(() {


          error = "Internet Is Taking Too Long To Connect";
          throw Exception('Internet is taking too long to connect');


        });

      }
      throw Exception('Internet is taking too long to connect');

    }
  }
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LISTING',),
    new Tab(text: 'MAP'),
  ];

    TabController _tabController;

    @override
    void initState() {
      super.initState();
    _tabController = new TabController(length: 2, vsync:this ,initialIndex: 0);
      _tabController.addListener(() {
        if (_tabController.indexIsChanging) {
          Navigator.of(context).pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) { return new MyOtherPage(); }));
        }
      });
      BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/images/sale.png').then((onValue) {
        pinLocationIcon = onValue;
      });
      BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5),
          'assets/images/rent.png').then((onValue) {
        rentLocationIcon = onValue;
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    TabBar _tabBar = new TabBar(
      indicatorSize:TabBarIndicatorSize.tab,
      controller: _tabController,
      indicatorColor: Colors.white,
      tabs: [
        new Tab(text: 'LISTING'),
        GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) { return new MyOtherPage(); }));
            },
            child:new Tab(text: 'MAP',)),

      ],
      labelStyle: TextStyle(
        //fontSize: 20,
        fontWeight: FontWeight.w900,
        //color: Colors.white,

      ),
    );


    // these are the minimum required values to set
    // the camera position

    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          backgroundColor:Colors.purple,

          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: GestureDetector(
            //onTap: () => showSearch(context: context, delegate: CustomSearchDelegate()),
              child:  Container(

                margin: const EdgeInsets.only(left: 14 ,top :50,right: 20),
                //padding: const EdgeInsets.all(8.0),

                child:                   Row(
                    children: [

                      Expanded( child:
                      GestureDetector(
                          onTap: () {

                            //onTapSearchPage();
                          } ,
                          child: Container(
                            padding:  const EdgeInsets.only(top: 15 ,bottom: 15 , left: 15 , right: 10),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 204, 249, 0.3),

                                borderRadius: BorderRadius.all(Radius.circular(4.0))),


                            child: Row(
                                children: <Widget>[
                                  Expanded(  child: Text(  'Search...eg Suburb, City',
                                      textAlign: TextAlign.left,

                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,

                                      ))),Icon(Icons.search,color:Colors.white,)]),

                          ) ))

                    ]

                ),
              )
          ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_tabBar.preferredSize.height + 50),
          child: _tabBar,
        ),
      ),
      body: Text(  'Search...eg Suburb, City') ,

    );
  }
}
