import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heybuddy/Screens/aspirant_meeting_complete.dart';
import 'package:heybuddy/Screens/homePage.dart';
import 'package:heybuddy/Screens/mypayments.dart';
import 'package:heybuddy/Screens/notifications.dart';
import 'package:heybuddy/Screens/onboarding_Screen.dart';
import 'package:heybuddy/Screens/professional_addComments.dart';
import 'package:heybuddy/Screens/proff_cancle_booking.dart';
import 'package:heybuddy/Screens/signup_email.dart';
import 'package:heybuddy/Screens/slotbooktime.dart';
import 'package:heybuddy/Screens/userprofile.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/notifications/notifications.dart';
import 'package:heybuddy/provider/dark_theme_provider.dart';
import 'package:heybuddy/provider/loading_indicator.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/token_preference.dart';
import 'package:heybuddy/shared_preference/user.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:heybuddy/widgets/token_profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

LocalNotification localNotification = LocalNotification();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // login?.getLogin();
  await GetStorage.init();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  Future.delayed(Duration(seconds: 5), () async {
    await localNotification.initializeLocalNotificationSettings();
  });

  FirebaseMessaging.onMessage.listen((event) async {
    localNotification.showNotification(event.notification);
  });

  configLoading();
  runApp(
    ChangeNotifierProvider(
      create: (_) => Favourite(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  void getCurrentAppTheme() async {
    themeChangeProvider.liteTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  var val;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    tokenPreference = TokenPreference();
    loginPreference = LoginPreference();
    login = Login();
    // ggzz();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             channel.description,
    //             color: Colors.blue,
    //             playSound: true,
    //             // icon: '@mipmap/ic_launcher',
    //           ),
    //         ));
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             title: Text(notification.title.toString()),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [Text(notification.body.toString())],
    //               ),
    //             ),
    //           );
    //         });
    //   }
    // });
  }

  // void showNotification() {
  //   setState(() {
  //     _counter++;
  //   });
  //   flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Testing $_counter",
  //       "How you doin ?",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(
  //         channel.id, channel.name, channel.description,
  //         importance: Importance.high,
  //         color: Colors.blue,
  //         playSound: true,
  //         // icon: '@mipmap/ic_launcher',
  //       )));
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   tokenPreference = TokenPreference();
  //   loginPreference = LoginPreference();
  //   login = Login();
  //   // getUserData();
  //   // choose();
  // }
  choose() async {
    val = await login?.getLogin();
    print("11l$val");
    print('valbbbbb$val');
    return val;
  }

  //
  // var pp;
  // choose() async {
  //   pp = await login?.getLogin();
  //   val = await pp;
  //   print("vall$val");
  // }

  // void getUserData() async {
  //   tokenProfile =
  //       TokenProfile.fromJson(await tokenPreference.getTokenPreferenceData());
  //   print("User Data");
  // }

  // var bbcc;
  // ggzz() async {
  //   bbcc = await firebaseMessaging.getToken();
  //   print(bbcc);
  //   print("ggzz");
  // }

  @override
  Widget build(BuildContext context) {
    //var word = Provider.of<Favourite>(context).fav;
    // ggzz();
    // print("Token is ${bbcc}");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkThemeProvider>(
            create: (context) => themeChangeProvider),
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, value, _) {
        return FutureBuilder(
            future: choose(),
            builder: (context, snapShot) {
              print("object$val");
              print("456${snapShot.data}");
              return //AdaptiveTheme(
                  // light: ThemeData.light(),
                  // dark: ThemeData.dark(),
                  // initial: AdaptiveThemeMode.system,
                  // builder: (light, dark) =>
                  GetMaterialApp(
                builder: EasyLoading.init(builder: (context, builder) {
                  final mediaQueryData = MediaQuery.of(context);
                  return MediaQuery(
                    child: builder!,
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  );
                }),
                title: 'Flutter Demo',
                //   initialRoute: val == true?"home":FirebaseAuth.instance.currentUser != null?"home":"/board",
                // ? FirebaseAuth.instance.currentUser != null
                //     ? "home"
                //     : "/board"
                // : "/board",
                // theme: light,
                theme: Styles.themeData(themeChangeProvider.liteTheme, context),
                // darkTheme: dark,
                // routes: {
                //   "/board": (context) => OnBoardingScreen(),
                //   "home": (context) => Nav1(),
                // },
                home: val == true
                    ? Nav1(
                        selectedIndex: 0,
                      )
                    : OnBoardingScreen(),
                // : FirebaseAuth.instance.currentUser == null
                //     ? OnBoardingScreen()
                //     : Nav1(),
                debugShowCheckedModeBanner: false,
                // home: val == true
                //     ? FirebaseAuth.instance.currentUser == null
                //         ? Nav1()
                //         : OnBoardingScreen()
                //     : OnBoardingScreen(),
              );
              // );
            });
      }),
    );
  }

  // dynamic ww(BuildContext context) => pp == true
  //     ? FirebaseAuth.instance.currentUser != null
  //         ? Nav1()
  //         : OnBoardingScreen()
  //     : OnBoardingScreen();
}

/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heybuddy/Screens/aspirant_meeting_complete.dart';
import 'package:heybuddy/Screens/homePage.dart';
import 'package:heybuddy/Screens/mypayments.dart';
import 'package:heybuddy/Screens/notifications.dart';
import 'package:heybuddy/Screens/onboarding_Screen.dart';
import 'package:heybuddy/Screens/professional_addComments.dart';
import 'package:heybuddy/Screens/proff_cancle_booking.dart';

import 'package:heybuddy/Screens/signup_email.dart';
import 'package:heybuddy/Screens/slotbooktime.dart';
import 'package:heybuddy/Screens/userprofile.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/token_preference.dart';
import 'package:heybuddy/shared_preference/user.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:heybuddy/widgets/token_profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // login?.getLogin();
  await GetStorage.init();
  runApp(
    ChangeNotifierProvider(
      create: (_) => Favourite(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var val;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokenPreference = TokenPreference();
    loginPreference = LoginPreference();
    login = Login();
    // getUserData();
    // choose();
  }
choose() async {
      val = await login?.getLogin();
      print("11l$val");
      print('valbbbbb$val');
      return val;

    }

    // 
  // var pp;
  // choose() async {
  //   pp = await login?.getLogin();
  //   val = await pp;
  //   print("vall$val");
  // }

  // void getUserData() async {
  //   tokenProfile =
  //       TokenProfile.fromJson(await tokenPreference.getTokenPreferenceData());
  //   print("User Data");
  // }

  @override
  Widget build(BuildContext context) {
    

    //var word = Provider.of<Favourite>(context).fav;
    return FutureBuilder(
        future: choose(),
        builder: (context, snapShot) {
          print("object$val");
          print("456${snapShot.data}");
          return MaterialApp(
            title: 'Flutter Demo',
            //   initialRoute: val == true?"home":FirebaseAuth.instance.currentUser != null?"home":"/board",
            // ? FirebaseAuth.instance.currentUser != null
            //     ? "home"
            //     : "/board"
            // : "/board",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // routes: {
            //   "/board": (context) => OnBoardingScreen(),
            //   "home": (context) => Nav1(),
            // },
            home: val == true
                ? Nav1()
                : FirebaseAuth.instance.currentUser == null
                    ? OnBoardingScreen()
                    : Nav1(),
            debugShowCheckedModeBanner: false,
            // home: val == true
            //     ? FirebaseAuth.instance.currentUser == null
            //         ? Nav1()
            //         : OnBoardingScreen()
            //     : OnBoardingScreen(),
          );
        });
  }

  // dynamic ww(BuildContext context) => pp == true
  //     ? FirebaseAuth.instance.currentUser != null
  //         ? Nav1()
  //         : OnBoardingScreen()
  //     : OnBoardingScreen();
}
*/
