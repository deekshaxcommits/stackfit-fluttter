import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/app/router/app_router.dart';

import 'app/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(child: StackFitApp()));
}

class StackFitApp extends ConsumerWidget {
  StackFitApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
