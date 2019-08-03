# short_stream_builder

Stream Builder Short Version, for those who wanna go fast.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

'''
Simple example:
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
'''
For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
