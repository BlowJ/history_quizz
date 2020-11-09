import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_quizz/widgets/subject_cards.dart';
import 'package:history_quizz/widgets/drawer_list.dart';
import 'package:history_quizz/widgets/box_title.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: DrawerList(),
        ),
        appBar: AppBar(
            leading: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Builder(
            builder: (context) => IconButton(
                icon: Icon(
                  Icons.dehaze,
                  size: 50.0,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
          ),
        )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 70.0),
                  ),
                  Center(
                    child: BoxTitle(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  Center(
                      child: Column(
                    children: <Widget>[
                      SubjectCard(
                        cardImage: Image.asset('images/thoitiensu.jpg'),
                        cardText: 'Thời kỳ Tiền Sử',
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      SubjectCard(
                        cardImage: Image.asset('images/thoihongbang.jpg'),
                        cardText: 'Thời kỳ Hồng Bàng',
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      SubjectCard(
                        cardImage: Image.asset('images/thoibacthuoc.jpg'),
                        cardText: 'Thời kỳ Bắc thuộc',
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      SubjectCard(
                        cardImage: Image.asset('images/thoiphongkien.jpg'),
                        cardText: 'Thời kỳ Phong kiến',
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      SubjectCard(
                        cardImage: Image.asset('images/thoiphapthuoc.jpg'),
                        cardText: 'Thời kỳ Pháp thuộc',
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      SubjectCard(
                        cardImage: Image.asset('images/thoidoimoi.jpg'),
                        cardText: 'Thời kỳ đổi mới',
                      ),
                    ],
                  )),
                ]),
          ),
        ));
  }
}
