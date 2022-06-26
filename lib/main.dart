import 'package:cubit_connect/cubits/color/color_cubit.dart';
import 'package:cubit_connect/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementsize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.color == Colors.red) {
          incrementsize = 1;
        } else if (state.color == Colors.green) {
          incrementsize = 10;
        } else if (state.color == Colors.black) {
          context.read<CounterCubit>().changeCounter(-100);
          incrementsize = -100;
        } else if (state.color == Colors.blue) {
          incrementsize = 100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        appBar: AppBar(
          title: const Text("Cubit Commuinication"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ColorCubit>().ChangeColor();
                  print("Clicked2");
                },
                child: const Text("Change Color !"),
              ),
              const SizedBox(
                height: 22.0,
              ),
              Text(
                '${context.watch<CounterCubit>().state.counter}',
              ),
              const SizedBox(
                height: 22.0,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().changeCounter(incrementsize);
                  print("Clicked1");
                },
                child: Text(
                  "Increment the value!",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
