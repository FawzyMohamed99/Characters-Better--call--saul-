import 'package:bloc_with_omr_ahmed/data/models/character.dart';
import 'package:bloc_with_omr_ahmed/data/models/quote.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class CharactersLoaded extends CharactersState{
  final List<Character> character;

  CharactersLoaded(this.character);
}
class QuotesLoaded extends CharactersState{
  final List<Quote> quote;

  QuotesLoaded(this.quote);
}