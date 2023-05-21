import 'package:flutter/material.dart';
import 'package:bmi_app/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //home: const MyHomePage(title: 'Know Your BMI'),
        home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 var wt_Controller = TextEditingController();
 var ft_Controller = TextEditingController();
 var inch_Controller = TextEditingController();
 var result = "";
 var error = "";
 var bgColor = Colors.deepPurple.shade100;

void clearText(){
  wt_Controller.clear();
  ft_Controller.clear();
  inch_Controller.clear();
  bgColor = Colors.deepPurple.shade100;
  setState(() {
                    result = "";
                    error = "";
                  });
  // result = "";
  // error= "";
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text('Body Mass Index',style: TextStyle(
                  //   fontSize: 34, fontWeight: FontWeight.w700
                  // ),),
                  Container(
                    height: 200,
                    width: 300,
                    color: Colors.deepPurple,
                     child: Image.asset('assets/images/bmi.png'),
                    
                  ),
                  SizedBox(height: 22,),
                  TextField(
                    controller: wt_Controller,
                    decoration: InputDecoration(
                      label: Text('Enter your Weight in Kg'),
                      prefixIcon: Icon(Icons.balance_rounded),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),
                  TextField(
                    controller: ft_Controller,
                    decoration: InputDecoration(
                      label: Text('Enter your Height in feet'),
                      prefixIcon: Icon(Icons.height_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 11,),
                  TextField(
                    controller: inch_Controller,
                    decoration: InputDecoration(
                      label: Text('Enter your Height in inch'),
                      prefixIcon: Icon(Icons.height_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 18,),
                  ElevatedButton(onPressed: (){
                    var wt = wt_Controller.text.toString();
                    var ft = ft_Controller.text.toString();
                    var inch = inch_Controller.text.toString();
                  
                    if(wt!="" && ft!="" && inch!=""){
                  
                      var int_wt = int.parse(wt);
                      var int_ft = int.parse(ft);
                      var int_inch = int.parse(inch);
                      var Sum_inch = (int_ft*12) + (int_inch);
                      var tCm = Sum_inch*2.54;
                      var tM = tCm/100;
            
                      var bmi = int_wt/((Sum_inch*0.0254)*(Sum_inch*0.0254));
                      var msg ="";
            
                      if(bmi>25){
                          msg = "  Oops,You are OverWeight !!  ";
                          bgColor = Colors.orange.shade200;
                      }else if(bmi<18){
                          msg = "  Oops,You are UnderWeight !!  ";
                          bgColor = Colors.red.shade200;
                      }else{
                          msg = "  Keep it up,You are Healthy !!  ";
                          bgColor = Colors.green.shade200;
                      }
                      setState(() {
                        result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                        
                        error = "";
                      });
                      
                    }else{
                        setState(() {
                          error="  Please fill all fields !!   ";
                          result = "";
                        });
                    }
                  
                  }, child:Text('Calculate')),
                  SizedBox(height: 11,),
                  
                  ElevatedButton(
                    onPressed: ()=> clearText(),
                  
                     child:Text('Clear All')),
                  
                  Text(result,style: TextStyle(fontSize: 17,),),
                  Text(error,style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 0, 2, 100),
                    backgroundColor: Color.fromARGB(255, 247, 189, 104)
                    ),),
                ],
              ),
            ),
          ),
        ),
      )
      
    );
  }
}
