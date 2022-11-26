import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/screens/booking_screen.dart';
import 'package:mental_health/screens/login_screen.dart';
import 'package:mental_health/screens/main_screen.dart';
import 'package:mental_health/screens/register_screen.dart';

import 'components/health_category_filter_cubit.dart';
import 'components/specialist_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(create: (context) => SpecialistCubit()),
        BlocProvider(create: (context) => HealthCategoryCubit())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: LoginScreen.id,
          routes: {
            LoginScreen.id: (context) => LoginScreen(),
            RegisterScreen.id: (context) => RegisterScreen(),
            MainScreen.id: (context) => MainScreen(),
            BookingScreen.id: (context) => BookingScreen(),
          }),
    );
  }
}
