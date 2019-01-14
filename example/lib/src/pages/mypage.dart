import 'package:example/src/blocs/first_page_bloc.dart' as first_bloc;
import 'package:example/src/widgets/Button_one.dart';
import 'package:example/src/widgets/button_two.dart';
import 'package:example/src/widgets/txt_field_one.dart';
import 'package:example/src/widgets/txt_field_two.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return first_bloc.MagicalWidget(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BtnOneWidget(),
            BtnTwoWidget(),
            TxtFieldOneWidget(),
            TxtFieldTwoWidget(),
          ]),
    );
  }
}
