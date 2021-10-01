import 'package:flutter/material.dart';

void main() => runApp(TextEditApp());

class TextEditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: new TextScreen(),
    );
  }
}

class TextScreen extends StatefulWidget {
  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  String _texto = "Edite el texto";
  List<Widget> textos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Edit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_texto),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Edita"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => EditSreen(),
                ))
                    .then((result) {
                  if (result != null) {
                    setState(() {
                      textos.add(Center(child: Text(result,textAlign: TextAlign.center,)));
                    });
                  }
                });
              },
            ),
            Container(height: 400,width: MediaQuery.of(context).size.width,
              child: ListView(
                children:
                textos
                ,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditSreen extends StatefulWidget {


  @override
  _EditSreenState createState() => _EditSreenState();
}

class _EditSreenState extends State<EditSreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text:"");
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _controller,
              ),
              RaisedButton(
                  child: Text("Guarda"),
                  onPressed: () {
                    Navigator.of(context).pop(_controller.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
