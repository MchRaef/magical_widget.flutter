import 'dart:collection';

const STRING = 'String';
const NUM = 'num';
const BOOL = 'bool';
const STRINGDEFAULT = '';
const NUMDEFAULT = '0';
const BOOLDEFAULT = 'false';

void handleZeroLengthField() {
  throw Exception(
      '`@Alakazam` is misused, it could only be used on enum that have specified an element_name.');
}

void handleLengthOneField(String name, HashMap<String, List<String>> map) {
  map.putIfAbsent(name, () => [STRING, STRINGDEFAULT]);
}

void handleLengthTwoField(
    String name, String type, HashMap<String, List<String>> map) {
  map.putIfAbsent(name, () => _inferTypeAndDefaultValue(type));
}

List<String> _inferTypeAndDefaultValue(String type) {
  if (_inferType(type) == NUM)
    return [NUM, NUMDEFAULT];
  else if (_inferType(type) == BOOL) return [BOOL, BOOLDEFAULT];
  return [STRING, STRINGDEFAULT];
}

String _inferType(String type) {
  if (type.toLowerCase().startsWith('n')) return NUM;
  if (type.toLowerCase().startsWith('b')) return BOOL;
  return STRING;
}

void handleLengthThreeField(String name, String type, String value,
    HashMap<String, List<String>> map) {
      map.putIfAbsent(name, () => [_inferType(type), _inferValue(_inferType(type), value)]);
    }

String _inferValue(String type, String value) {
  if (type == STRING)
    return value;
  else if (type == NUM) return num.tryParse(value) != null ? value : NUMDEFAULT;
  return value.toLowerCase().startsWith('t')? 'true': 'false';
}
