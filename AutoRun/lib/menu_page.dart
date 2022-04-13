import 'package:flutter/material.dart';
import 'main.dart';
import 'options.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  int selectdoptions = 0;
  Widget build(BuildContext context) {

      return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Text("Boufafa Lamis"),
          leading: Icon(Icons.account_circle_rounded, size: 45,),
          elevation: 0,
          backgroundColor: Color(0xFF4361EE),
          actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
              Navigator.pop(context);
          },
        ),
        ]
          /*actions: <Widget>[
            Align(alignment: Alignment.center,),
            
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/avatar.jpg"),
           
            )
          ],*/        
      
          
        ),
      ),
      body: ListView.builder(
        itemCount: options.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(height: 15.0);
          } else if (index == options.length + 1) {
            return SizedBox(
              height: 100.0,
            );
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              border: selectdoptions == 1
                  ? Border.all(color: Colors.black26)
                  : null,
            ),
            child: ListTile(
              leading: options[index - 1].icon,
              title: Text(
                options[index - 1].title,
                style: TextStyle(
                  fontFamily: 'NexaBold',
                    color: selectdoptions == index - 1
                        ? Colors.black
                        : Colors.grey[600]
                        ),
                        
              ),
              selected: selectdoptions == index - 1,
              onTap: () {
                setState(() {
                  selectdoptions = index - 1;
                });
              },
            ),
          );
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 40,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Déconnexion',
                style: TextStyle(
                    fontFamily: 'NexaBold',
                    color: Color(0xFF707070),
                    fontSize: 18.0),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
                size: 18.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
