import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.all(20.0),
              height: 250.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.home, size: 50.0),
                      Text("Walter Matsuda", style: TextStyle(fontSize: 30)),
                    ],
                  ),
                  Text(
                    "Desenvolvedor Mobile Flutter / RN / Java / iOS",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),

              color: Colors.green,
              height: 180.0,
              width: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("A"), Text("B")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
