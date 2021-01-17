import 'package:beginner_course/temp/temperature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemperatureStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Temperature();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Current Temperature'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TempType(),
            Temp()
          ],
        ),
        floatingActionButton: MyFAB(),
      ),
    );
  }
}

class TempType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Temperature>(builder: (BuildContext context, temp, Widget child) { return Center(child: Text(temp.temperatureType,style: TextStyle(color: temp.temperatureType=="celcius"?Colors.green:Colors.pinkAccent,fontSize: 45),)); },);
  }
}

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var temp = Provider.of<Temperature>(context);
    return Center(child: Text(temp.temperature.toString(),style: TextStyle(color: temp.temperatureType=="celcius"?Colors.blue:Colors.orangeAccent,fontSize: 65),));
  }
}

class MyFAB extends StatelessWidget{

  Color decideColor(Temperature temperature){
    return temperature.temperatureType=="celcius"?Colors.green:Colors.deepOrangeAccent;
  }

  @override
  Widget build(BuildContext context) {
    var temp = Provider.of<Temperature>(context);

    return FloatingActionButton(
      backgroundColor: decideColor(temp),
      tooltip: 'Press to change temperature type',
      child: Icon(Icons.track_changes),
      onPressed: (){
        if(temp.temperatureType=="celcius") {
          temp.temperatureType = "far";
          temp.temperature += 73;
        }else {
          temp.temperatureType = "celcius";
          temp.temperature -= 73;
        }
      },
    );
  }
}
