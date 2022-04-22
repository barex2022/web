import 'package:barex_website/bloc/enquiry/enquiry_bloc.dart';
import 'package:barex_website/bloc/menu_item/menu_item_cubit.dart';
import 'package:barex_website/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/size_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => EnquiryBloc()),
          BlocProvider(create: (_) => MenuItemCubit())],
        child: _MyApp());
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
            debugShowCheckedModeBanner: false, home: LandingPage());
      });
    });
  }
}
