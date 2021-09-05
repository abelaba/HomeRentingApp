import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_renting_app/auth/bloc/login/login_bloc.dart';
import 'package:home_renting_app/auth/bloc/signup/signup_bloc.dart';
import 'package:home_renting_app/auth/data-provider/auth-data-provider.dart';
import 'package:home_renting_app/auth/repository/authRepository.dart';
import 'package:home_renting_app/routes.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final AuthenticationDataProvider authenticationDataProvider =
      AuthenticationDataProvider();
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository(dataProvider: authenticationDataProvider);
  runApp(MyApp(
    appRouter: AppRouter(),
    authenticationRepository: authenticationRepository,
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter;
  final AuthenticationRepository authenticationRepository;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.authenticationRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                LoginBloc(authenticationRepository: authenticationRepository)),
        BlocProvider(
            create: (context) =>
                SignUpBloc(authenticationRepository: authenticationRepository))
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.onGeneratedRoute,
      ),
    );
  }
}
