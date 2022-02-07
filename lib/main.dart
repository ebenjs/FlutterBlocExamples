import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit_cubit.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubitCubit(),
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Bloc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubitCubit, CounterCubitState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Incremented")));
                } else {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Decremented")));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () =>
                      BlocProvider.of<CounterCubitCubit>(context).increment(),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () =>
                      BlocProvider.of<CounterCubitCubit>(context).decrement(),
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
