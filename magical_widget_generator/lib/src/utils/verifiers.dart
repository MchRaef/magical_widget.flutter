import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

bool checkIfEnum(Element element) {
  if (element is! ClassElement)
    throw InvalidGenerationSourceError(
        'Generator cannot target `${element.displayName}`. '
        '`@Alakazam` can only be applied to an enum.',
        todo: 'Remove the `@OnOff` annotation from `${element.displayName}`.',
        element: element);
  return true;
}

bool checkNotEmpty(Map<String, List<String>> map, Element element){
  if(map.isEmpty)
  throw InvalidGenerationSourceError(
        'Generator cannot target `${element.displayName}`. '
        '`@Alakazam` can only be applied to an enum.',
        todo: 'Remove the `@OnOff` annotation from `${element.displayName}`.',
        element: element);
  return true;
}

