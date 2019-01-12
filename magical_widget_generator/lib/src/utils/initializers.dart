import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:magical_widget_generator/src/utils/utils.dart';

Map<String, List<String>> initializeMap(List<FieldElement> fields) {
  final map = HashMap<String, List<String>>();

  for (var field in fields) {
    if (field.isEnumConstant) {
      buildMap(field.name, map);
    }
  }
  return map;
}

void buildMap(String field, HashMap<String, List<String>> map) {
  final sections = field.split('\$');
  if (sections.length == 0) handleZeroLengthField();
  if (sections.length == 1)
    handleLengthOneField(sections[0], map);
  else if (sections.length == 2)
    handleLengthTwoField(sections[0], sections[1], map);
  else if (sections.length == 3)
    handleLengthThreeField(sections[0], sections[1], sections[2], map);
  else
    handleLengthThreeField(sections[0], sections[1], sections[2], map);
}
