import 'package:flutter/material.dart';
import 'package:gerenciaestado/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final controllerHome = Get.find<HomeController>();
  final String title;

  HomeView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Obx(
              () => Text(
                '${controllerHome.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: controllerHome.incrementar,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: controllerHome.decrementar,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () => {Get.toNamed('/teste')},
            tooltip: 'Avançar Página',
            child: const Icon(Icons.next_plan),
          ),
        ],
      ),
    );
  }
}
