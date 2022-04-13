import 'package:flutter/material.dart';
import 'icons/menu_icons_icons.dart';
class Option {
  Icon? icon;
  String title;
 

  Option({this.icon, this.title= 'hah'});
}

final options = [
  Option(
    icon: Icon(MenuIcons.user, size: 30,),
    title: 'Mon profil',
   
  ),
  Option(
    icon: Icon(MenuIcons.car, size: 30,),
    title: 'Mes locations',
    
  ),
  Option(
    icon: Icon(MenuIcons.money, size: 30,),
    title: 'Mes facteurs',
   
  ),
  Option(
    icon: Icon(MenuIcons.info, size: 30,),
    title: 'Support',
    
  ),
  Option(
    icon: Icon(MenuIcons.settings, size: 30,),
    title: 'Paramètres',
    
  ),
  
];