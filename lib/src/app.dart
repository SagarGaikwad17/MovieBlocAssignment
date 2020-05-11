import 'package:flutter/material.dart';
import 'models/CheckNetwork.dart';
import 'models/NetworkProvider.dart';
import 'ui/movie_list.dart';
import 'package:flutter/services.dart';

/*
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}

*/




class App extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }


}

class _MyApp extends State<App>
{


  bool _hasNetworkConnection;
  bool _fallbackViewOn;

  void _updateConnectivity(dynamic hasConnection) {

    if (!_hasNetworkConnection) {
      if (!_fallbackViewOn) {
        setState(() {
          _fallbackViewOn = true;
          _hasNetworkConnection = hasConnection;
        });
      }
    } else {
      if (_fallbackViewOn) {
        setState(() {
          _fallbackViewOn = false;
          _hasNetworkConnection = hasConnection;
        });
      }
    }
  }

  @override
  void initState() {
    _hasNetworkConnection = false;
    _fallbackViewOn = false;

    ConnectionStatusSingleton connectionStatus =
    ConnectionStatusSingleton.getInstance();
    connectionStatus.connectionChange.listen(_updateConnectivity);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      title: 'Status Adda',

      theme: ThemeData(

          primaryColor: Color(0xfffafafa),
          accentColor: Colors.redAccent),

      home: MyHomePage(),


    );

  }


}
