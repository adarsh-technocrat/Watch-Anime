import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/presentation/pages/SplashScreen/splash_screen.dart';
import 'package:win_toast/win_toast.dart';

Future<void> main() async {
  runApp(const MyApp());
  await WinToast.instance().initialize(
      appName: "watch_anime",
      companyName: "technoctat",
      productName: "watch_anime_app");
  DartVLC.initialize();
  doWhenWindowReady(() {
    const initialSize = Size(1100, 750);
    const windowSized = Size(1024, 640);
    appWindow.minSize = initialSize;
    appWindow.size = windowSized;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Watch Anime',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            fontFamily: "Poppins",
          ),
          home: const SplashScreen()),
    );
  }
}
