import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:weathermachine/app/pages/home_controller.dart';
import 'package:weathermachine/data/remote/data_weather_repository.dart';

class HomeView extends CleanView {

  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
  
}

class _HomeViewState extends ResponsiveViewState<HomeView,HomeController> {
  _HomeViewState() : super(HomeController(DataWeatherRepository()));

  @override
  // TODO: implement desktopView
  Widget get desktopView => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text('Binvenido a Clean Aachitecture Desktop'),
          backgroundColor: Colors.blue[300],
        ),
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Text('Hola ${controller.returnedMsg()}');
            },
          ),
        ),
      );

  @override
  // TODO: implement mobileView
  Widget get mobileView => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text('Binvenido a Clean Aachitecture Móvil'),
          backgroundColor: Colors.blue[300],
        ),
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Text('Hola ${controller.returnedMsg()}');
            },
          ),
        ),
      );

  @override
  // TODO: implement tabletView
  Widget get tabletView => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text('Binvenido a Clean Aachitecture'),
          backgroundColor: Colors.blue[300],
        ),
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Text('Hola ${controller.returnedMsg()}');
            },
          ),
        ),
      );

  @override
  // TODO: implement watchView
  Widget get watchView => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text('Binvenido a Clean Aachitecture watch'),
          backgroundColor: Colors.blue[300],
        ),
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Text('Hola ${controller.returnedMsg()}');
            },
          ),
        ),
      );
}