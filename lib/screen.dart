
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
   Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin{
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TabController? tabController;
  int selectedIndex = 0;
  List<Widget> listWidget = [
    Text('page #1',style: TextStyle(fontSize: 30),),
    Text('page #2',style: TextStyle(fontSize: 30),),

  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
         // key: scaffoldKey,
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[400],
            title: Text('TabBar'),
            bottom: TabBar(
              controller: tabController,
              indicatorColor: Colors.grey,
              indicatorWeight: 5,
              labelColor: Colors.grey,
              labelStyle: TextStyle(fontSize: 20),
              unselectedLabelColor: Colors.white,
              unselectedLabelStyle: TextStyle(fontSize: 15),
              tabs: [
                Tab(
                icon:Icon(Icons.laptop) ,
                text: 'LabTop',

                ),
                Tab(
                    icon:Icon(Icons.mobile_friendly) ,
                    text:'Mobile'
                ),

              ],
            ),

          ),
          body: Column(
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.all(10),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('LapTop Page',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                        MaterialButton(onPressed: () {
                          tabController!.animateTo(1);
                        },
                        child: Text('Go to Mobile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Mobile Page',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        MaterialButton(onPressed: () {
                          tabController!.animateTo(0);
                        },
                          child: Text('Go to Laptop',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              Container(
                height:200,
                child: PageView(
                  children: [
                   Image.asset('assets/images/pic1.png',height: 90,),
                    Image.asset('assets/images/pic2.png',height: 90,),
                    Image.asset('assets/images/pic3.png',height: 90,),
                    Image.asset('assets/images/pic4.png',height: 90,),

                  ],
                ),
              ),
              SizedBox(height: 70,),
              listWidget.elementAt(selectedIndex),
            ],
          ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val){
          setState(() {
            selectedIndex = val;
          });
        },
        currentIndex: selectedIndex,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 20,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting',),

        ],
      ),
        );
  }
}
