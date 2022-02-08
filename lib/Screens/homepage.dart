import 'package:flutter/material.dart';

import 'gamescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController survivor = TextEditingController();
  TextEditingController toskip = TextEditingController();
  late String s = '' ;
  late String t = '';
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Form(
        child: Column(children: [
          const Text('No of Participents'),
          SizedBox(height: 40,),
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
              onFieldSubmitted: (value){
                setState(() {
                  s = value ;
                });
              },
            ),
          ),
          SizedBox(height: 20,),
          const Text('No to skip'),
          SizedBox(height: 40,),
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
              onFieldSubmitted: (value){
                setState(() {
                  t = value ;
                });
              },
            ),
          ),
          Text('values are ${s}and${t}'),
          ElevatedButton(onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder:  (context) =>  GameScreen(part: int.parse(s), skip: int.parse(t))));
            DefaultTabController.of(context)!.animateTo(1);

          }, child: const Text('submiit'))
        ],
        ),
      ),
    );
  }
}
