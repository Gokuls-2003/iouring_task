import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouring_task/core/theme/app_theme.dart';
import 'package:iouring_task/presentation/bloc/nav/navigation_bloc.dart';

import 'di/injection_container.dart' as di;
import 'presentation/bloc/watchlist/watchlist_bloc.dart';
import 'presentation/bloc/watchlist/watchlist_event.dart';
import 'presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watchlist App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(create: (_) => di.sl<NavigationBloc>()),
          BlocProvider<WatchlistBloc>(
            create: (_) {
              final bloc = di.sl<WatchlistBloc>();
              bloc.add(LoadWatchlists());
              return bloc;
            },
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
