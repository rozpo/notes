import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/notes/notes_bloc.dart';
import 'src/screens/home/home_screen.dart';
import 'src/services/notes_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotesService.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotesBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange,
        ),
        home: const HomeScreen(),
      ),
    ),
  );
}
