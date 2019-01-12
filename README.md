# magical_widget.flutter

## Overview
The __Magical Widget__ is a package developed in Dart initially for the Flutter framework. 
It uses BLoC for state management, as recommended by Google, in order to control UI widgets. More specifically, a pattern using the BehaviorSubject is created.
In addition, it exploits the functionitlities offered by [the source_gen](https://github.com/dart-lang/source_gen) package in order to automatically generate most of the code.
Therefore, this library makes it really easy for developper to control their UI widgets with the minimum setup required.
Regardless of the level of expertise in Flutter or state management, anyone could now manipulate the widgets with ease.

## Getting Started
It is very easy to start using this package, in fact it is boiled down to preperly update your _pubspec.yaml_ file, and to include one single annotation in your code.

### Prerequisites
First you should update your _pubspec.yaml_ to include [the build_runner package](https://pub.dartlang.org/packages/build_runner) under the _dev_dependencies_ key. 
Also add [the magical widget generator](https://pub.dartlang.org/packages/magical_widget_generator) package under the same key. 
For example for build_runner version 1.1.2, and magical_widget_generator version 1.0.0:
```
dev_dependencies:
  build_runner: ^1.1.2
  magical_widget_generator: ^1.0.0
```
The last step to finish the _pubspec.yaml_ file is to update your _dependencies_ key and include the main [magical widget](https://pub.dartlang.org/packages/magical_widget) package that will expose the annotation.
In addition, the package makes use of the BLoC state management offered by dart, so you should also include the [rxdart](https://pub.dartlang.org/packages/rxdart) package.
```
dev_dependencies:
  magical_widget: ^1.0.0
  rxdart: ^0.20.0
```

### Using the Annotation
The __Magical Widget__ package is easy to use, and it exposes only one annotation called __Alakazam__
This annotaiton takes one optional parameter called __withProvider__ (default true) and it should be used to annotate an enum in your code.
The enum elements should follow this syntax: `element_name$element_type$default_value`
Currently three element types are supported: String, bool, and num
In the enum, you are required to specify the element_name, however the last two (element_type and default_value) are optional.
If you do not specify the element_type, the default will be String.
If you do not specify the default_value, the default settings are:
* For String, the default value is an empty string
* For bool, the default value is false
* For enum, the default is 0
With that being said, an example of using __Alakazam__:
```
@Alakazam()
enum myLoginScreen {
  enableMobileTxt$bool$true,
  enableSendBtn$bool,
  mobileTxt,
  numberDigitsExpected$num$9
}
```
Of course, you should import the magical widget package in order to use this annotation: `import 'package:magical_widget/magical_widget.dart';`

### Generating the Code
After using the annotation as described above on an enum that contains whatever controls you want for your screens, you can now generate the code with build_runner, to do so, you can use
```
flutter packages pub run build_runner build
// OR
flutter packages pub run build_runner watch
```
The first build_runner command (build) will generate the source file for you once when you run it, so each time you change the enum, you need to rerun this command. 
The second command (watch) will generate it once and keep listening to changes in your code, so it will continuously update the generateed code.

Before running the build commands make sure to include `part 'your_file_name.g.dart';` at the top of your source file and after your imports.

The generated code makes use of the rxdart package, so make sure to import it in your source file `import 'package:rxdart/rxdart.dart';`.
And if the __withProvider__ parameter of the __Alakazam__ annotation is set to true (default value), the code will generate an inherited widget for you, so you should import the material library `import 'package:flutter/material.dart';`.

### Using the Generated Code
The magical widget package will always generate one enum and two classes.
The enum name will be the same as your specified enum name but it will be prefixed by `MAGICAL_`

The first generated class contains the UI controls defined and initialized to the proper types and values, along side other boilerplate code.
The class will always be named `MagicalController`, and this is the class that will be used with the BLoC, it is the type of the stream.
You will never want to use this class explicitly other than referencing it when building a [StreamBuilder](https://docs.flutter.io/flutter/widgets/StreamBuilder-class.html)
widget and calling its default constructor `MagicalController()` if you want to use the _initialData_ argument of the _StreamBuilder_. 

The second generated class is the actual BLoC. It contains the [Behavior Subject](https://pub.dartlang.org/documentation/rxdart/latest/rx/BehaviorSubject-class.html) that will contain a stream of events of the type `MagicalController`.
This class generates all required codes and boilerplates to use the BLoC state management techniques. The class name will always be `MagicalBloc`.
From this class you will be interested to use two properties and two methods:
1. The `magicalValue` property that returns the current value of the stream, the returned object is always of type `MagicalController`
2. The `magicalStream` property that returns the actual stream, this will required by the _stream_ argument of the _StreamBuilder_
3. The `changeUIElement(value, control)` method. You want to call this method to change the value of the control (the contol is from the generated enum that starts with `MAGICAL_`)
4. The `changeUIElements(values, controls)` method. Same as above, but it allows to submit a list of values and controls to change at once. The values and controls lists should be of the same size
At this point, you can instantiate the MagicalBloc and use the instance in your own inherited widget or provide it as a global parameter for other widgets to use. It depends on your preference, but you are all set to go.

#### The __withProvider__ Argument
If this argument of the __Alakazam__ annotation is set to true, which is the default behavior, a third class will be generated.
The third class is always called `MagicalWidget` and it is an [inherited widget](https://docs.flutter.io/flutter/widgets/InheritedWidget-class.html) that provides the BLoC to you.
So if the __withProvider__ argument is set to true, you can instantly use the `MagicalWidget` provider to wrap your widgets and use the static `of()` method to get access to the `MagicalBloc` instance, which will be always called `magicalBloc`

In case, you do not want this behavior, you need to explicitly set __withProvider__ to false, then no inherited widget will be generated.

## Resources
For an example on how to use the magical widget please refer to the [TK-example package](https://github.com/MchRaef/magical_widget.flutter/example) provided in this github repo.

For a complete tutorial about this package, please refer to this [TK-medium article](medium)

You can always refer to the API documentation related to these packages:
* [magical_widget](https://pub.dartlang.org/packages/magical_widget)
* [magical_widget_generator](https://pub.dartlang.org/packages/magical_widget_generator)

## Contributing

Please read [TK-CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## Authors

* **Raef Mousheimish** - *Initial work* - [MchRaef](https://github.com/MchRaef)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Inspired by the active and motivated Dart and Flutter communities, especially by the built_values package developed by David Morgan TK
