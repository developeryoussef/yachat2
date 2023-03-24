// ignore_for_file: unused_import

import 'package:flutter/material.dart';

Widget? yachatImage = Padding(
  padding: const EdgeInsets.only(top: 60),
  child: Center(
    child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu6fTqi6Rqjl0bUIEJijCOHcgpnuEHGuf8PA&usqp=CAU'),
  ),
);

Widget? waveImage = Container(
  width: double.infinity,
  child: Padding(
    padding: const EdgeInsets.only(top: 50),
    child: Container(
      child: Image.network(
          'https://scontent-hbe1-1.xx.fbcdn.net/v/t1.15752-9/326875112_868341007781939_381375471588960693_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=ae9488&_nc_ohc=HAW9lELhPREAX85zURI&_nc_ht=scontent-hbe1-1.xx&oh=03_AdRRtcF_fdkLsmpeO6z4iU4DHbuPltgIfFF5BTBafQxquA&oe=640B0AE8'),
    ),
  ),
);

var image = Image.network(
    'https://preview.redd.it/o67iakxcon571.jpg?auto=webp&s=ff1eedad41db913d7701bd577b861b02ca5f613b');
