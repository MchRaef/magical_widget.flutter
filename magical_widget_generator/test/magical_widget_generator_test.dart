import 'dart:collection';


import 'package:flutter_test/flutter_test.dart';
import 'package:magical_widget_generator/src/utils/initializers.dart';
import 'package:magical_widget_generator/src/utils/utils.dart';
import 'package:magical_widget_generator/src/utils/writers.dart';

void main() {
  final map = HashMap<String, List<String>>();

  test('Test if handleLengthOneField adds to map', () {
    handleLengthOneField('key1', map);
    expect(map.length, 1);
  });

  test('Test if handleLengthTwoField adds properly to map', () {
    handleLengthTwoField('key6', 'n', map);
    expect(map['key6'][0], 'num');
    expect(map['key6'][1], '0');
    handleLengthTwoField('key7', 'bol', map);
    expect(map['key7'][0], 'bool');
    expect(map['key7'][1], 'false');
    handleLengthTwoField('key8', 'other', map);
    expect(map['key8'][0], 'String');
    expect(map['key8'][1], '');
  });

  test('Test if handleLengthThreeField adds properly to map', () {
    handleLengthThreeField('key9', 'type', 'strongos', map);
    expect(map['key9'][0], 'String');
    expect(map['key9'][1], 'strongos');
    handleLengthThreeField('k1', 'bools', 'fals', map);
    expect(map['k1'][0], 'bool');
    expect(map['k1'][1], 'false');
    handleLengthThreeField('k2', 'numeric', 'ra', map);
    expect(map['k2'][0], 'num');
    expect(map['k2'][1], '0');
    handleLengthThreeField('k3', 'num', '1.25', map);
    expect(map['k3'][0], 'num');
    expect(map['k3'][1], '1.25');
    handleLengthThreeField('k4', 'num', '1', map);
    expect(map['k4'][0], 'num');
    expect(map['k4'][1], '1');
  });

  test('Test the map initializer', () {
    final list = [
      'mobileNumberTxtField\$String',
      'enableMobileNumberTxtField\$bool\$true',
      'enableSendBtn\$bool\$true',
      'justField',
      'fieldwith\$',
      'anotherFieldWith\$boolWith\$',
    ];
    final map = HashMap<String, List<String>>();
    for (var name in list) {
      buildMap(name, map);
    }
    expect(map.length, 6);
  });

  test('Test Generated Code Validity', () {
    var buffer = StringBuffer();
    buffer.writeln(r'''
    /// This is the generated enum that will be used as the control for your UI widgets, you can use these control for any widget as you wish
    /// This is enum will start with MAGICAL_ then the name of your original enum will be appended
    /// The elements of this enum will be used by the users to select which contol to change
    ''');
    writeEnum(map, 'ENUMNAME', buffer);

     buffer.writeln(r'''
    /// This is a generated class that will hold the controls for your UI
    /// This class is always named [MagicalController]
    /// This is going to be the class of the stream
    ''');
    writeMagicalControllerClass(map, 'MagicalControl', 'ENUMNAME', buffer);
    buffer.writeln(r'''
    /// This is a generated bloc class that holds the logic of changing the controls
    /// It makes sure that only the targeted widget is changed and all other components remain inteact
    /// The bloc contains a _dispose_ method to close the subjects generated within this class.
    /// The class is always [MagicalBloc]
    /// The fields that the user will use within this class are:
    /// - __magicalStream__ to refer to the stream
    /// - __magicalValue__ to refer to the current value of the stream
    ''');
    writeMagicalBlocClass('MagicalBloc',
        'MagicalControl', buffer);
        buffer.writeln(r'''
    /// By default the withProvider of the [Alakazam] annotation is set to true.
    /// This will generate the [MagicalWidget] class. This widget is an inherited widget and it holds the generated bloc, which it returns from its _of()_ method
    /// If you do not want this behavior, the withProvider argument could be set to false, and this widget will not be generated
    ''');
    writeMagicalWidget(
          'MagicalWidget', 'MagicalBloc', buffer);
    print(buffer.toString());
  });
}
