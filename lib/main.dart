import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart_cubit.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const ShopsyApp());
}

class ShopsyApp extends StatelessWidget {
  const ShopsyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: MaterialApp(
        title: 'Shopsy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple, primary: Colors.purple),
          useMaterial3: true,
          primaryColor: Colors.purple,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/splash',
        routes: getAppRoutes(),
      ),
    );
  }
}
