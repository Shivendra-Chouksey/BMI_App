import "package:flutter/material.dart";
import "package:bmi_app/main.dart";

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 2),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Know Your BMI")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   color: Colors.deepPurple,

      // ),
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(1, 140, 1,0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                Container(
                  height: 200,
                  width: 300,
                  //color: Colors.blue,
                   child: Image.asset('assets/images/bmi.png'),
                  
                ),
                SizedBox(height: 260,
                  child: Container(
                    height: 200,
                    width: 300,
                    //color: Colors.blue,
                     
                    
                  ),
                ),
                 Container(
                    height: 25,
                    width: 175,
                    //color: Colors.blue,
                    child: Center(child: Text("Developed By", style: TextStyle(color: Colors.white,fontSize: 15))),
                  ),
                  
                
                Container(
                    height: 40,
                    width: 400,
                   // color: Colors.blue,
                    child: Center(child: Text("Shivendra Chouksey", style:TextStyle(color: Color.fromARGB(255, 227, 223, 0),fontSize: 28,fontWeight: FontWeight.bold))),
                  ),
                  
              
                
                
              ],
              
              
            ),
          )
        ),
      ),
    );
  }
}