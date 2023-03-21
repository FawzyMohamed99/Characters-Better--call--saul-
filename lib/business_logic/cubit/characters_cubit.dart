import 'package:bloc_with_omr_ahmed/business_logic/cubit/characters_state.dart';
import 'package:bloc_with_omr_ahmed/data/models/quote.dart';
import 'package:bloc_with_omr_ahmed/data/repositry/character_repositoey.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/character.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<Character> character = [];
  List<Quote> quote = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) =>
        {emit(CharactersLoaded(characters)), character = characters});

    return character;
  }

  void getCharacterQuotes(String charName) {
    characterRepository.getCharacterQuotes(charName).then((quotes) => {
          emit(QuotesLoaded(quotes)),
        });
  }
}
