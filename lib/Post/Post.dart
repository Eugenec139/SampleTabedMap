import 'package:flutter/material.dart';

import '../globals.dart';
import '../kupeza.dart';
import '../support_functions.dart';


class PostTileWidget extends StatefulWidget {
  final Kupeza kupeza;
  final int index;
  final bool homepage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const PostTileWidget(this.kupeza ,this.scaffoldKey,this.index,this.homepage);

  @override
  PostTile createState() => PostTile();
}

class PostTile extends State<PostTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
              margin:const EdgeInsets.only(left: 20,right:20 ,bottom:8,top: 20),
              child: Column( children : [  Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded( child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0) ,bottom: Radius.circular(8.0)),
                        child:  FadeInImage.assetNetwork(
                            height: 200,
                            fit: BoxFit.cover,


                            placeholder: "assets/images/placeholder.png" ,image: widget.kupeza.media ))

                    )  ]),//Image.network(user.media)
                Column(
                    children : [ Row(
                        children: [


                          Expanded( child:
                          Container(
                              margin: const EdgeInsets.only(left: 0,top:17 ),
                              child: Text(
                                widget.kupeza.purpose == 'sale' ? widget.kupeza.price == '0' ? toTitleCal(widget.kupeza.priceunit,widget.kupeza.squarefeet) :"K"+widget.kupeza.price : "K"+ widget.kupeza.price+" per month" ,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(74, 77, 75, 0.9),
                                ),
                              )),



                          ),
                          Container(
                            color: Color.fromRGBO(255, 204, 249, 0.4),
                            padding:const EdgeInsets.only(left: 8,right: 8, top: 4 ,bottom: 4) ,
                            margin: const EdgeInsets.only(left: 0,top : 17 ,right: 0),
                            child: widget.kupeza.media == 'land' ? Text(''): Text(
                              toTitleCase(widget.kupeza.type),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:Colors.purple,
                              ),
                            ),

                          )

                        ]

                    ), Row(children :[
                      // if(true) {

                      widget.kupeza.bedrooms != '' ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 19,
                                height: 19,
                                margin: const EdgeInsets.only(left: 0,top : 10),
                                child: Image.asset(
                                  "assets/images/icon-5.png",
                                  color: Color.fromRGBO(74, 77, 75, 0.9),
                                  fit: BoxFit.fitWidth,
                                )),
                            Container(
                              //margin: const EdgeInsets.only(top: 8),
                              margin: const EdgeInsets.only(left: 10,top : 12 , right: 20),
                              child: Text(
                                widget.kupeza.bedrooms +" bd",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(74, 77, 75, 0.9),

                                  //color: color,
                                ),
                              ),



                            )
                          ]
                      ) : new Container(width: 0, height: 0) ,

                      widget.kupeza.bathrooms != '' ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 17,
                                height: 17,
                                margin: const EdgeInsets.only(left: 0,top : 10),
                                child: Image.asset(
                                  "assets/images/icon-2.png",
                                  color: Color.fromRGBO(74, 77, 75, 0.9),

                                  fit: BoxFit.fitWidth,
                                )),

                            Container(
                              margin: const EdgeInsets.only(left: 8,top : 12 ,right: 20),
                              child: Text(
                                widget.kupeza.bathrooms +" ba",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(74, 77, 75, 0.9),

                                  //color: color,
                                ),
                              ),



                            )
                          ]
                      )  : new Container(width: 0, height: 0) ,

                      widget.kupeza.squarefeet != '0' ?

                      widget.kupeza.squarefeet == '' ? new Container(width: 0, height: 0) :Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 14,
                                height: 14,
                                margin: const EdgeInsets.only(left: 0,top : 10),
                                child: Image.asset(
                                  "assets/images/cvg.png",
                                  color: Color.fromRGBO(74, 77, 75, 0.9),
                                  fit: BoxFit.fitWidth,
                                )),
                            Container(
                              //margin: const EdgeInsets.only(top: 8),
                              margin: const EdgeInsets.only(left: 10,top : 12),
                              child: Text(
                                widget.kupeza.squarefeet +" sq",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(74, 77, 75, 0.9),

                                  //color: color,
                                ),
                              ),



                            )
                          ]
                      ) : new Container(width: 0, height: 0) ,
                    ]

                    ),Row(
                        children: [

                          Expanded( child: Container(
                              margin: const EdgeInsets.only(left: 0,top : 4),
                              child: Text(
                                titleCase(widget.kupeza.title) +" ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(74, 77, 75, 0.9),

                                  //fontWeight: FontWeight.bold,
                                  //color: color,
                                ),
                              )),



                          )

                        ]

                    ),    widget.kupeza.address == '' ? Row(
                        children: [

                          Expanded( child: Container(
                              margin: const EdgeInsets.only(left: 0,top : 4),
                              child: Text(
                                titleCase(widget.kupeza.city +", Zambia ."),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(74, 77, 75, 0.9),

                                  //fontWeight: FontWeight.bold,
                                  //color: color,
                                ),
                              )),



                          )

                        ]

                    ):
                    Row(
                        children: [

                          Expanded( child: Container(
                              margin: const EdgeInsets.only(left: 0,top : 4),
                              child: Text(
                                titleCase(widget.kupeza.address +""),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(74, 77, 75, 0.9),

                                  //fontWeight: FontWeight.bold,
                                  //color: color,
                                ),
                              )),



                          )

                        ]

                    ),  ]),

                Row(
                    children: [

                      Expanded( child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Text(
                            '',
                            style: TextStyle(
                              fontSize: 1,
                              fontWeight: FontWeight.bold,
                              //color: color,
                            ),
                          )),



                      )

                    ]

                )

              ]
              )
          )
          ,Positioned(
            left: 30.0,
            top: 30.0,
            child: Container(
              padding:const EdgeInsets.only(left: 8,right: 8, top: 4 ,bottom: 4) ,
              decoration: BoxDecoration(
                  color: widget.kupeza.purpose == 'sale' ? Color.fromRGBO(153, 0, 204, 0.5) : Color.fromRGBO(255, 102, 0, 0.7) ,

                  borderRadius: BorderRadius.all(Radius.circular(4.0))),

              child: Text(
                widget.kupeza.purpose.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          )
          ,Positioned(
            right: 30.0,
            top: 10.0,
            child:  Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(left: 10 ,right: 8 ,top : 4),
                child:  IconButton(
                  color: Colors.purple,

                  icon: widget.kupeza.fav ? Icon(Icons.favorite,size: 40) : Icon(Icons.favorite_border,size: 40),
                  onPressed: (){
                    setState(() {

                      if (authorization_value !=""){

                        callWebServiceFoaddfavorites(widget.kupeza.slug ,context ,widget.scaffoldKey);
                        if(widget.kupeza.fav){


                          if (widget.homepage){
                            listOfFavorites= new List<Kupeza>();
                            listOfHomePosts.elementAt(widget.index).fav = false;


                          }else{
                            listOfHomePosts= new List<Kupeza>();
                            listOfFavorites.elementAt(widget.index).fav = false;
                            listOfFavorites.removeAt(widget.index);
                            listOfFavorites = new List<Kupeza>();



                          }

                        }
                        else{


                          if (widget.homepage){
                            listOfFavorites = new List<Kupeza>();
                            listOfHomePosts.elementAt(widget.index).fav = true;


                          }else{
                            listOfHomePosts = new List<Kupeza>();
                            listOfFavorites.elementAt(widget.index).fav = true;
                            listOfFavorites.removeAt(widget.index);
                            //listOfFavorites = new List<Kupeza>();



                          }

                        }

                      }
                      else{




                      }


                    });
                  },
                )



            ),
          )
        ]
    )
    ;
  }
}