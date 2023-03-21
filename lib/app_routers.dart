import 'package:bloc_with_omr_ahmed/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_with_omr_ahmed/constants/string.dart';
import 'package:bloc_with_omr_ahmed/data/models/character.dart';
import 'package:bloc_with_omr_ahmed/data/repositry/character_repositoey.dart';
import 'package:bloc_with_omr_ahmed/data/web_services/character_web_services.dart';
import 'package:bloc_with_omr_ahmed/presentation/screen/character_details_screen.dart';
import 'package:bloc_with_omr_ahmed/presentation/screen/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(characterRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
