import 'package:cuts/views/container/container.view.dart';
import 'package:cuts/views/loading/loading.view.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:cuts/controllers/user.controller.dart';
import 'package:cuts/utils/const.dart';
import 'package:cuts/views/welcome/welcome.view.dart';

void main() => initializeDateFormatting().then((value) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => LoadingView(),
          "/home": (context) => ContainerView(),
        },
        theme: ThemeData(
            primaryColor: PRIMARY_COLOR,
            primaryColorDark: Colors.amber,
            accentColor: PRIMARY_COLOR,
            scaffoldBackgroundColor:
                Colors.grey[50], //Best color for backgrounds
            bottomAppBarColor: Colors.grey[800],
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey[850],
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.grey,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.grey),
              bodyText2: TextStyle(color: Colors.grey),
            ),
            iconTheme: IconThemeData(
              color: Colors.grey[400],
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: PRIMARY_COLOR,
              textTheme: ButtonTextTheme.primary,
            ),
            // elevatedButtonTheme: ElevatedButtonThemeData(
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors.white),
            //   ),
            // ),
            dividerTheme: DividerThemeData(
              color: Colors.grey[800],
              space: 50,
            )),
      ),
    )));
