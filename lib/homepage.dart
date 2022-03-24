import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController myController = TextEditingController();
   String? text = '';

  String checkPrimeNumber() {
    int number = int.parse(myController.text.toString());
    for (var i = 2; i<=number/2; ++i){
      text = number % 2 != 0
          ? 'This is a prime number'
          : 'Entered Number is not a prime number';
    }
    return text!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Prime Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkPrimeNumber();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Answer'),
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(text!),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
