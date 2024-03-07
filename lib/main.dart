import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/view/home_view.dart';
import 'package:twitter_clone/theme/theme.dart';

import 'features/auth/view/login_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {
            if(user!=null) {
              return HomeView();
            }
            else {
              return LoginView();
            }
          },
          error: (error, st) {ErrorPage(error: error.toString(),);},
          loading: () {
            LoadingPage();
          }),
    );
  }
}
