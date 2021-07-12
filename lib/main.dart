import 'package:terkelola/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'commons/nav_key.dart';
import 'constants/colors.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await getPEMKeyCert();
  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

getPEMKeyCert() async {
  String data = await rootBundle.loadString("assets/certs/certificate.pem");
  NavKey.pemKey = data;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    initializeFlutterLocalNotification();
    initializeFirebase();
  }

  Future<dynamic> onSelectNotification(String? payload) async {
    /*Do whatever you want to do on notification click. In this case, I'll show an alert dialog*/
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(payload!),
        content: Text("Payload: $payload"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Base Flutter 2",
      navigatorKey: NavKey.navKey,
      theme: new ThemeData(
          primaryColor: primary,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          accentColor: accent,
          fontFamily: "NunitoSans",
          canvasColor: Colors.white),
      initialRoute: "/",
      routes: routes,
    );
  }

  static Future<void> _showNotification(
    int notificationId,
    String? notificationTitle,
    String? notificationContent,
    String payload, {
    String channelId = '1234',
    String channelTitle = 'Android Channel',
    String channelDescription = 'Default Android Channel for notifications',
    Priority notificationPriority = Priority.high,
    Importance notificationImportance = Importance.max,
  }) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      channelId,
      channelTitle,
      channelDescription,
      playSound: false,
      importance: notificationImportance,
      priority: notificationPriority,
    );
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      notificationId,
      notificationTitle,
      notificationContent,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void initializeFlutterLocalNotification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  // Create a [AndroidNotificationChannel] for heads up notifications
  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    var jsonData = message["notification"];
    _showNotification(1234, jsonData["title"], jsonData["body"], "");
    return Future<void>.value();
  }

  void initializeFirebase() async {
    // if (environment.env['CURRENT_ENV'] == "1") {
    //Force Collect Crash if in Production
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // }
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      onBackgroundMessage(message.data);
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    NotificationSettings settings = await _firebaseMessaging.requestPermission( // ignore: unused_local_variable
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


}
