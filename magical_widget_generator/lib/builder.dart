import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';

import 'package:magical_widget_generator/src/magical_widget_generator.dart';



Builder magicalBuilder(BuilderOptions options) =>

    SharedPartBuilder(const [MagicalWidgetGenerator()], 'magical_builder');