import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:counterplus/store/counter/counter.dart';

class CounterApp extends StatefulWidget {
  CounterApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<Counter>(create: (_) => Counter())],
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Observer(builder: (context) {
              final counter = context.watch<Counter>();
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Text(
                        counter.value.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: counter.decrement,
                          child: Text("Minus"),
                        ),
                        FlatButton(
                          onPressed: counter.increment,
                          child: Text("Plus"),
                        ),
                      ],
                    )
                  ],
                ),
              );
            })));
  }
}
