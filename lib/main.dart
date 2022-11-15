import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {

    var time = DateTime.now();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Date: ${time.day}/${time.month}/${time.year}'),
              Text('Date: ${DateFormat('jms').format(time)}'),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
              });}, child: Text('Refrash Time')),
              const Text('Pick Date', style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed: () async {
                 DateTime? picDate = await  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2023));
                 if(picDate != null) {
                   print('Date is : ${picDate.year}:${picDate.month}:${picDate.day}');
                 }

              }, child: const Text('Pick Date')),
              ElevatedButton(onPressed: () async {
                TimeOfDay? pickTime = await showTimePicker(context: context, initialTime: TimeOfDay.now(), initialEntryMode: TimePickerEntryMode.dial);
                if(pickTime != null) {
                  print('Date is : ${pickTime.hour}:${pickTime.minute}');
                }
              }, child: const Text('Pick Time'),)
            ],
          ),
        ));
  }
}
