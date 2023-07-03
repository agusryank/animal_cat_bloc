import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/cubits/counter_cubit/counter_cubit_cubit.dart';
import 'package:latihan_bloc/cubits/theme_cubit/theme_cubit.dart';
import 'package:latihan_bloc/page/ui_page/home_view.dart';
import 'package:latihan_bloc/service/notify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize local notification
  await Notify.init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        )
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<ThemeCubit>().state.themeData,
          home: HomePage(),
        );
      }),
    );
  }
}
