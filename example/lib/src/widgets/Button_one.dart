import 'package:flutter/material.dart';
import 'package:example/src/blocs/first_page_bloc.dart' as first_bloc;

class BtnOneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = first_bloc.MagicalWidget.of(context);
    return StreamBuilder<first_bloc.MagicalController>(
      stream: bloc.magicalStream,
      initialData: first_bloc.MagicalController(),
      builder: (context, snapshot) {
        final enable = snapshot.data.enableFirstBtn;
        return RaisedButton(
          child: Text("First Btn"),
          onPressed: enable ? () => _onPressedFirstBtn(bloc) : null,
        );
      },
    );
  }

  _onPressedFirstBtn(first_bloc.MagicalBloc bloc) {
    bloc.changeUIElement(true, first_bloc.MAGICAL_firstPageControls.enableSecondBtn);
  }
}
