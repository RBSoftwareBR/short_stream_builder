library short_stream_builder;

import 'package:flutter/material.dart';
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

SSB({Stream stream, buildfunction, error, bool isList = false, emptylist}) {
  if (buildfunction != null) {
    if (stream != null) {
      if (error == null) {
        error = Row(
          children: <Widget>[
            Expanded(
                child: Text(
              'Something went wrong!',
              textAlign: TextAlign.center,
            )),
          ],
        );
      }
      if (emptylist == null) {
        emptylist = Row(
          children: <Widget>[
            Expanded(
                child: Text(
              'The List has no itens',
              textAlign: TextAlign.center,
            )),
          ],
        );
      }
      return StreamBuilder(
        stream: stream,
        builder: (context, snap) {
          if (!snap.hasError) {
            if (snap.hasData) {
              if (snap.data != null) {
                if (!isList) {
                  return buildfunction(context, snap);
                } else {
                  if (snap.data.length == 0) {
                    print('Error SSB: EmptyList');
                    return emptylist;
                  } else {
                    return buildfunction(context, snap);
                  }
                }
              } else {
                print('Error SSB: snap.data == null');
                return error;
              }
            } else {
              print('Error SSB: !snap.hasData');
              return error;
            }
          } else {
            print('Error SSB: ${snap.error}');
            return error;
          }
        },
      );
    } else {
      print("Error SSB: Stream Can't be null");
      return Text('ERROR: STREAM CANNOT BE NULL!');
    }
  } else {
    print("Error SSB: BuildFunction Can't be null");
    return Text('ERROR: BuildFunction CANNOT BE NULL!');
  }
}
