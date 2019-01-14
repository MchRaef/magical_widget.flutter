
import 'package:example/src/blocs/first_page_bloc.dart' as first_bloc;
import 'package:flutter/material.dart';

class BtnTwoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = first_bloc.MagicalWidget.of(context);
    return StreamBuilder<first_bloc.MagicalController>(
      stream: bloc.magicalStream,
      initialData: first_bloc.MagicalController(),
      builder: (context, snapshot) {
        final enable = snapshot.data.enableSecondBtn;
        return RaisedButton(
          child: Text(snapshot.data.txtField2Input),
          onPressed: enable ? () => _onPressedSecondBtn(bloc) : null,
        );
      },
    );
  }

  _onPressedSecondBtn(first_bloc.MagicalBloc bloc) {
    bloc.changeUIElement("You pressed Btn 2", first_bloc.MAGICAL_firstPageControls.txtField1Input);
  }
}