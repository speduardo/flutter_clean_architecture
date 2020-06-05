import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercleanarchitecture/features/home/data/models/navigationtabs.model.dart';
import 'package:fluttercleanarchitecture/features/home/presentation/controllers/configurations.dart';
import 'package:fluttercleanarchitecture/features/home/presentation/controllers/home.controller.dart';
import 'package:fluttercleanarchitecture/features/home/presentation/widgets/custom_fab_button.dart';
import 'package:get/get.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  bool _isTapped = false;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  List<NavigationTabs> _navigationTabs = [
    NavigationTabs(title: "Guia", icon: Icons.store, index: 0),
    NavigationTabs(title: "Anuncie Aqui", icon: Icons.announcement, index: 1),
    NavigationTabs(title: "Fidelidade", icon: Icons.star, index: 2),
    NavigationTabs(
        title: "Sobre Nós", icon: Icons.supervised_user_circle, index: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Guia Comercial'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GFItemsCarousel(
                //enlargeMainPage: true,
                //viewportFraction: 1.0,
                itemHeight: 80,
                rowCount: 4,
                children: categories.map(
                      (url) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        //margin: EdgeInsets.all(0),
                        //padding: EdgeInsets.all(0),
                        children: [
                          Image(
                            image: AssetImage(url['iconPath']),
                            //color: Colors.white,
                            //fit: BoxFit.contain,
                            height: 60,
                          ),
                        ],
                      ),
                      color: Colors.deepPurple,
                    );
                  },
                ).toList(),
              ),

              GFCarousel(
                enlargeMainPage: true,
                viewportFraction: 1.0,
                height: 200,
                //pagerSize: 100,
                items: banners.map(
                      (url) {
                    return Container(
                      //margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        child: Image.asset(
                            url['image'],
                            fit: BoxFit.fitWidth,
                            width: 2000
                        ),
                      ),
                    );
                  },
                ).toList(),
                onPageChanged: (index) {
                  setState(() {
                    index;
                  });
                },
              ),

              Container(height: 80,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: horizontal_menu.length,
                  itemBuilder: (context,index){
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            //padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 10),
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                //boxShadow: shadowList,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  colorFilter:
                                  ColorFilter.mode(Colors.black.withOpacity(0.8),
                                      BlendMode.dstATop),
                                  image: AssetImage(horizontal_menu[index]['backgroundPath']),
                                  fit: BoxFit.cover,

                                ),
                              ),
                              child: Center( child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(horizontal_menu[index]['icon'], color: Colors.white, size: 28,),
                                  Text(horizontal_menu[index]['name'], style: TextStyle(fontSize: 16, color: Colors.white),)
                                ],))
                          ),
                        ],
                      ),
                    );
                  },

                ),
              ),

              Container(
                //margin: EdgeInsets.only(top: 10),
                height: 300,
                color: Colors.white,
                child: Column(
                    children: [
                      Text('EMPRESA'),
                      Text('Conheça os destaques da nossa cidade!'),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  padding: EdgeInsets.only(left: 15),
                  height: 120.0,
                  child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 120.0,
                            color: Colors.white,
                            child: Column(children: [
                              Image(
                                image: AssetImage('assets/images/diskpizza-logo.jpg'),
                              ),
                              Text('Disk Pizza'),
                              Text('(64) 3645-2388')
                            ],),
                          ),

                          SizedBox(width: 10,),

                          Container(
                            width: 120.0,
                            color: Colors.white,
                            child: Column(children: [
                              Image(
                                image: AssetImage('assets/images/diskpizza-logo.jpg'),
                              ),
                              Text('Disk Pizza'),
                              Text('(64) 3645-2388')
                            ],),
                          ),

                          SizedBox(width: 10,),

                          Container(
                            width: 120.0,
                            color: Colors.white,
                            child: Column(children: [
                              Image(
                                image: AssetImage('assets/images/diskpizza-logo.jpg'),
                              ),
                              Text('Disk Pizza'),
                              Text('(64) 3645-2388')
                            ],),
                          ),
                      ]
                    ),
                ),
                    ],

                  ),
              ),

            ],
          ),
          ),
    );
  }
}