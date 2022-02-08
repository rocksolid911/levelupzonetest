import 'package:flutter/material.dart';
import 'package:levelupzonetest/Screens/gamescreen.dart';
import 'package:levelupzonetest/Screens/homepage.dart';
import 'package:levelupzonetest/dataprovider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();



}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {

  final List<Tab> tabs = <Tab>[
    Tab(icon: Icon(Icons.add)),
    Tab(icon: Icon(Icons.games)),
  ];
    late TabController tabController ;
  TextEditingController survivor = TextEditingController();
  TextEditingController toskip = TextEditingController();
  late String s = '' ;
  late String t = '';
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('Game Of Survivor'),
            bottom:  TabBar(
              indicatorColor: Colors.orange,
              controller: tabController,
              tabs:tabs,
            ),
          ),
          body:  TabBarView(
            controller: tabController,
            children: [
              // Icon(Icons.directions_car),
          Center(
          child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          const Text('No of Participents'),
          //SizedBox(height: 40,),
          Container(
            width: 100,
            child: TextFormField(
              controller: survivor,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("enter no of Participents"),
                border:  OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.teal)
                ),
              ),
              onChanged: (value){
                setState(() {
                  s = value ;
                });
              },
            ),
          ),
         // SizedBox(height: 20,),
          const Text('No to skip'),
          //SizedBox(height: 40,),
          Container(
            width: 100,
            child: TextFormField(
              controller: toskip,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("enter no to skip"),
                border:  OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.teal)
                ),
              ),
              onChanged: (value){
                setState(() {
                  t = value ;
                });
              },
            ),
          ),
          Text('values are ${s}and${t}'),
          ElevatedButton(
            style:ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
              onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder:  (context) =>  GameScreen(part: int.parse(s), skip: int.parse(t))));
           // DefaultTabController.of(context)?.animateTo(1);
            Provider.of<Datap>(context,listen: false).setPart(int.parse(s)) ; /* your value */
            Provider.of<Datap>(context,listen: false).setSkip(int.parse(t)) ;
            tabController.animateTo(1, duration: Duration(seconds: 1));

          }, child: const Text('submiit'))
          ],
        ),
      ),
    ),
             GameScreen(tabController: tabController,),


            ],
          ),
        ),
      ),


      );

  }
}
