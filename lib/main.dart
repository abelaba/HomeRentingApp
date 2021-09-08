import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_renting_app/auth/bloc/login/login_bloc.dart';
import 'package:home_renting_app/auth/bloc/signup/signup_bloc.dart';
import 'package:home_renting_app/auth/data-provider/auth-data-provider.dart';
import 'package:home_renting_app/auth/repository/authRepository.dart';
import 'package:home_renting_app/rental/blocs/blocs.dart';
import 'package:home_renting_app/rental/blocs/image/image_bloc.dart';
import 'package:home_renting_app/rental/data_providers/rental-data-provider.dart';
import 'package:home_renting_app/rental/repository/rental-repository.dart';
import 'package:home_renting_app/routes.dart';

import 'package:home_renting_app/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final RentalRepository rentalRepository =
      RentalRepository(RentalDataProvider());
  final AuthenticationDataProvider authenticationDataProvider =
      AuthenticationDataProvider();
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository(dataProvider: authenticationDataProvider);
  runApp(MyApp(
    authenticationRepository: authenticationRepository,
    rentalRepository: rentalRepository,
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final RentalRepository rentalRepository;

  const MyApp({
    Key? key,
    required this.authenticationRepository,
    required this.rentalRepository,
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
                SignUpBloc(authenticationRepository: authenticationRepository)),
        BlocProvider(
          create: (context) =>
              RentalBloc(rentalRepository: this.rentalRepository),
        ),
        BlocProvider(
          create: (context) => ImageBloc(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
