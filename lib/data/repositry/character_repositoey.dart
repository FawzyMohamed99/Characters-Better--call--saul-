import 'package:bloc_with_omr_ahmed/data/models/character.dart';
import 'package:bloc_with_omr_ahmed/data/models/quote.dart';
import 'package:bloc_with_omr_ahmed/data/web_services/character_web_services.dart';

class CharacterRepository{
  final CharacterWebServices characterWebServices;

  CharacterRepository(this.characterWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters=await characterWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quote=await characterWebServices.getCharacterQuotes(charName);
    return quote.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}