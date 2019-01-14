import 'package:rxdart/rxdart.dart';
import 'package:quiver/iterables.dart';
import 'package:flutter/material.dart';
import 'package:magical_widget/magical_widget.dart';


part 'first_page_bloc.g.dart';

@Alakazam() // The default @Alakazam(withProvider=true)
enum firstPageControls {
 enableFirstBtn$bool$true,
 enableSecondBtn$bool, //this defaults to enableSecondBtn$bool$false
 txtField1Input, // this defaults to txtFieldInput$String$
 txtField2Input$String$Magic,
}