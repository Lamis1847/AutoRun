

import 'package:AutoRun/Attente.dart';
import 'package:flutter/material.dart';
import 'package:AutoRun/constant.dart';
import 'main.dart';



class tabselector extends StatefulWidget {
  const tabselector({Key? key}) : super(key: key);

  @override
  _tabselectorState createState() => _tabselectorState();
}

class _tabselectorState extends State<tabselector> with SingleTickerProviderStateMixin {
   int _numDots = 2;
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _numDots, vsync: this );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [

        PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        onPageChanged: (index){

          _controller?.animateTo(index);
        },
        children:  [
          //MyHomePage(title: '',),
          WaitingPage(),



        ],
      ),

          Positioned(

            left: 140,
            right: 0,
            bottom: 8,
            height: 24,




            child:  TabPageSelector(
              selectedColor: primarycolor,

            controller: _controller,
            indicatorSize: 50,
          ),)

        ],

      ),
    );
  }
}
