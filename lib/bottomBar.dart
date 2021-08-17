import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter/sebha.dart';
import 'package:quran_flutter/SideMenu.dart';
import 'AhadeethList.dart';
import 'AppConfigProvider.dart';
import 'sowarListPage.dart';

class BottomBar extends StatefulWidget {

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {

  int curruntIndex = 3;
  final List <Widget> pages=[
    SurahsList(),
    sebha(),
    HadeethsList(),
    SurahsList(),
  ];


  void inc(int x) {
    setState(() {
      curruntIndex = x;
    });
  }
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('Calculator',style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
        backgroundColor: Colors.blueGrey,
      ),
      body:Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: provider.isDarkModeEnable()?AssetImage(
                      "assets/bg.png"):AssetImage(
                      "assets/bg3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            child:pages[curruntIndex],
          ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(223, 170, 97, 1),

        items: [

          BottomNavigationBarItem(
              icon: Image.asset("assets/radio.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/radio_selected.png")
          ),


          BottomNavigationBarItem(
              icon: Image.asset("assets/sebha.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/sebha_selected.png")
          ),

          BottomNavigationBarItem(
              icon: Image.asset("assets/hadeth.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/hadeth_selected.png")
          ),

          BottomNavigationBarItem(
              icon: Image.asset("assets/quran.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/quran_selected.png")
          ),

        ],
        onTap: inc,
        currentIndex: curruntIndex,
        type: BottomNavigationBarType.fixed,

      ),
    );
  }
}
