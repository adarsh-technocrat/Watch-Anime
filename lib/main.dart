import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/landing_page_cubit.dart';
import 'package:watch_anime/bloc/search_page_cubit.dart';
import 'package:watch_anime/pages/SplashScreen/splash_screen.dart';
import 'package:win_toast/win_toast.dart';

Future<void> main() async {
  runApp(const MyApp());
  await WinToast.instance().initialize(
      appName: "watch_anime",
      companyName: "technoctat",
      productName: "watch_anime_app");
  doWhenWindowReady(() {
    const initialSize = Size(960, 640);
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
        BlocProvider<LandingPageCubit>(create: (_) => LandingPageCubit()),
        BlocProvider<SearchPageCubit>(create: (_) => SearchPageCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Watch Anime',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            fontFamily: "Lato",
          ),
          home: const SplashScreen()),
    );
  }
}
