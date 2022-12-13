import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/ChatScreenCubit.dart';
import 'package:mental_health/BLoC/DashboardScreenCubit.dart';
import 'package:mental_health/BLoC/DataManagerCubit.dart';
import 'package:mental_health/Screens/ChatScreen.dart';
import 'package:mental_health/Screens/DashboardScreen.dart';
import 'package:mental_health/Screens/MainChatScreen.dart';
import 'package:mental_health/Screens/PayScreen.dart';
import 'package:mental_health/Screens/ProfileScreen.dart';
import 'package:mental_health/screens/BookingScreen.dart';
import 'package:mental_health/screens/LoginScreen.dart';
import 'package:mental_health/screens/HomeScreen.dart';
import 'package:mental_health/screens/RegisterScreen.dart';

import 'BLoC/BookingScreenCubit.dart';
import 'BLoC/HealthCategoryFilterCubit.dart';
import 'BLoC/SpecialistCubit.dart';

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
        BlocProvider(create: (context) => DataManagerCubit()),
        BlocProvider(create: (context) => SpecialistCubit()),
        BlocProvider(create: (context) => HealthCategoryCubit()),
        BlocProvider(create: (context) => BookingScreenCubit()),
        BlocProvider(create: (context) => DashboardScreenCubit()),
        BlocProvider(create: (context) => ChatScreenCubit()),
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
            PayScreen.id: (context) => PayScreen(),
            DashboardScreen.id: (context) => DashboardScreen(),
            ChatScreen.id: (context) => ChatScreen(),
            MainChatScreen.id: (context) => MainChatScreen(),
            ProfileScreen.id: (context) => ProfileScreen(),
          }),
    );
  }
}
