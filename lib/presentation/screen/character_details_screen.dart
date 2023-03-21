import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc_with_omr_ahmed/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_with_omr_ahmed/business_logic/cubit/characters_state.dart';
import 'package:bloc_with_omr_ahmed/constants/my_colors.dart';
import 'package:bloc_with_omr_ahmed/data/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getCharacterQuotes(character.name!);

    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                          'Job : ', character.occupation!.join(' / ')),
                      buildDivider(315),
                      characterInfo('Status : ', character.status!),
                      buildDivider(290),
                      characterInfo(
                          'Seasons : ', character.appearance!.join(' / ')),
                      buildDivider(278),
                      characterInfo('Birthday : ', character.birthday!),
                      buildDivider(280),
                      characterInfo(
                          'LastAppearance : ', character.lastAppearance!),
                      buildDivider(215),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                          builder: (context, state) {
                        return checkIfQuotesAreLoaded(state);
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuotesOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQuotesOrEmptySpace(state) {
    var quote = (state).quote;
    if (quote.length != 0) {
      int randomQuoteIndex = Random().nextInt(quote.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: MyColors.myWhite, shadows: [
            Shadow(
              blurRadius: 7,
              color: MyColors.myYellow,
              offset: Offset(0, 0),
            )
          ]),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quote[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator(){
    return Center(
      child:  CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildDivider(double endIntent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIntent,
      thickness: 2,
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.myWhite,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 650,
      stretch: true,
      pinned: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '${character.nickname!.join(' / ')}',
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(
            character.img!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
