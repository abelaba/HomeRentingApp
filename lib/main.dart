import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_renting_app/rental/blocs/image/image_bloc.dart';

import 'rental/bloc_observer.dart';
import 'rental/blocs/blocs.dart';
import 'rental/data_providers/rental-data-provider.dart';
import 'rental/repository/rental-repository.dart';
import 'rental/screens/rental_route.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final RentalRepository courseRepository =
      RentalRepository(RentalDataProvider());

  runApp(
    CourseApp(courseRepository: courseRepository),
  );
}

class CourseApp extends StatelessWidget {
  final RentalRepository courseRepository;

  CourseApp({required this.courseRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.courseRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RentalBloc(rentalRepository: this.courseRepository)
                  ..add(RentalLoadAll()),
          ),
          BlocProvider(
            create: (context) => ImageBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Course App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: CourseAppRoute.generateRoute,
        ),
      ),
    );
  }
}
