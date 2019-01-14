import 'package:flutter/material.dart';
import 'package:example/src/blocs/first_page_bloc.dart' as first_bloc;

class TxtFieldOneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = first_bloc.MagicalWidget.of(context);

    return StreamBuilder<first_bloc.MagicalController>(
        stream: bloc.magicalStream,
        initialData: first_bloc.MagicalController(),
        builder: (context, snapshot) {
          final code = snapshot.data.txtField1Input;
          return TextField(
            controller: TextEditingController()..text = code,
            onChanged: (text) => _onTxtChanged(text, bloc),
          );
        });
  }

  _onTxtChanged(String text, first_bloc.MagicalBloc bloc) {
    if (text == 'disable')
      bloc.changeUIElements(
          [false, text], [first_bloc.MAGICAL_firstPageControls.enableFirstBtn, first_bloc.MAGICAL_firstPageControls.txtField1Input]);
    else if (text == 'enable')
      bloc.changeUIElements(
          [true, text], [first_bloc.MAGICAL_firstPageControls.enableFirstBtn, first_bloc.MAGICAL_firstPageControls.txtField1Input]);
  }
}
