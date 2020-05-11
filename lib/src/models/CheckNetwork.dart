import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_bloc/src/ui/movie_list.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (BuildContext ctxt,
                AsyncSnapshot<ConnectivityResult> snapShot) {
              if (!snapShot.hasData) return CircularProgressIndicator();
              var result = snapShot.data;
              switch (result) {
                case ConnectivityResult.none:
                  print("no net");
                  return noNet();
                case ConnectivityResult.mobile:
                  print("yes net");
                  return MovieList();
                case ConnectivityResult.wifi:
                  print("yes net");
                  return MovieList();

                default:
                  return noNet();
              }
            })
    );
  }

  Widget noNet()
  {

    return Center(child:


    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        Padding(
          padding:  EdgeInsets.only(bottom: 30),
          child: Icon(Icons.signal_wifi_off,size: 100,color: Colors.grey[700],),
        ),

        Padding(
          padding:  EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Center(
                child: Text("No Internet Connection",
                  style:TextStyle(
                    color: Color(0xffff4848),
                    fontSize:20,
                    letterSpacing: 0.7,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    //fontStyle: FontStyle.italic
                  ),),
              ),


            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Center(
              child: Text("Make sure WiFi or Cellular data is turned on",
                style:TextStyle(
                  color: Colors.blueGrey,
                  fontSize:14,
                  letterSpacing: 0.074,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  //fontStyle: FontStyle.italic
                ),),
            ),


          ],
        ),


      ],
    )

    );

  }

}