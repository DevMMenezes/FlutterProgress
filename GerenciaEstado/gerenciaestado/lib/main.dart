import 'package:flutter/material.dart';
import 'package:gerenciaestado/teste.dart';
import 'package:gerenciaestado/view/home_view.dart';
import 'package:get/get.dart';

import 'bindings/home_bindings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomeView(title: 'Gerencia de Estado'),
          binding: HomeBinding(),
        ),
        GetPage(name: '/teste', page: () => TesteWidget()),
      ],
    );
  }
}
