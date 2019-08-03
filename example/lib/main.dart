import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:short_stream_builder/short_stream_builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Short Stream Builder Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Short Stream Builder Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BehaviorSubject<String> streamController = new BehaviorSubject<String>();
  Stream<String> get outStream => streamController.stream;
  Sink<String> get inStream => streamController.sink;

  @override
  Widget build(BuildContext context) {
    /* Simple example:
            SSB(stream: your_stream,buildfunction: (context,snap){
                return Text(snap.data);
              }),

   List Example
                SSB(
                stream: your_stream,
                isList: true,
                emptylist: () {
                  return Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        'Your Custom no List Widget',
                        textAlign: TextAlign.center,
                      )),
                    ],
                  );
                },
                buildfunction: (context, snapshot) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .7,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListItem(snapshot.data[index], index);
                          }));
                },
                error: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .5,
                    child: Center(
                      child: SpinKitFoldingCube(
                        color: myGreen,
                        size: 80,
                      ),
                    )),

              ),
 */
    inStream.add('Hello Short Stream Builder');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SSB(
            stream: outStream,
            buildfunction: (context, snap) {
              return Center(child: Text(snap.data));
            }));
  }
}
