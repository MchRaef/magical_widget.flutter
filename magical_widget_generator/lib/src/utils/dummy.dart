import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

    /// This is the generated enum that will be used as the control for your UI widgets, you can use these control for any widget as you wish
    /// This is enum will start with MAGICAL_ then the name of your original enum will be appended
    /// The elements of this enum will be used by the users to select which contol to change

enum ENUMNAME {
key9,
k1,
key6,
key8,
k2,
k3,
key1,
k4,
key7,
}
    /// This is a generated class that will hold the controls for your UI
    /// This class is always named [MagicalController]
    /// This is going to be the class of the stream

class MagicalControl {
String key9;
bool k1;
num key6;
String key8;
num k2;
num k3;
String key1;
num k4;
bool key7;
MagicalControl({
this.key9 = "strongos",
this.k1 = false,
this.key6 = 0,
this.key8 = "",
this.k2 = 0,
this.k3 = 1.25,
this.key1 = "",
this.k4 = 1,
this.key7 = false,
});
MagicalControl.fromOld(MagicalControl old){
this.key9 = old.key9;
this.k1 = old.k1;
this.key6 = old.key6;
this.key8 = old.key8;
this.k2 = old.k2;
this.k3 = old.k3;
this.key1 = old.key1;
this.k4 = old.k4;
this.key7 = old.key7;
}
    factory MagicalControl.setValues(
      MagicalControl old, List<ENUMNAME> configs, List<dynamic> values) {
        var uiConfig = MagicalControl.fromOld(old);
        for(var pair in zip([configs, values])){
          uiConfig = MagicalControl.setValue(uiConfig, [pair[0]], pair[1]);
        }
        return uiConfig;
    }

    factory MagicalControl.setValue(
      MagicalControl old, List<ENUMNAME> configs, dynamic value) {
        var uiConfig = MagicalControl.fromOld(old);
        for (var config in configs) {
         uiConfig = _handleUIConfigs(config, uiConfig, value: value);
        }
        return uiConfig;
    }

      static MagicalControl _handleUIConfigs(
      ENUMNAME config, MagicalControl uiConfig,
      {dynamic value}) {
        switch (config) {

          case ENUMNAME.key9:
            uiConfig.key9 = value;
            break;

          case ENUMNAME.k1:
            uiConfig.k1 = value;
            break;

          case ENUMNAME.key6:
            uiConfig.key6 = value;
            break;

          case ENUMNAME.key8:
            uiConfig.key8 = value;
            break;

          case ENUMNAME.k2:
            uiConfig.k2 = value;
            break;

          case ENUMNAME.k3:
            uiConfig.k3 = value;
            break;

          case ENUMNAME.key1:
            uiConfig.key1 = value;
            break;

          case ENUMNAME.k4:
            uiConfig.k4 = value;
            break;

          case ENUMNAME.key7:
            uiConfig.key7 = value;
            break;

          default:
        }
        return uiConfig;
      }

}
    /// This is a generated bloc class that holds the logic of changing the controls
    /// It makes sure that only the targeted widget is changed and all other components remain inteact
    /// The bloc contains a _dispose_ method to close the subjects generated within this class.
    /// The class is always [MagicalBloc]
    /// The fields that the user will use within this class are:
    /// - __magicalStream__ to refer to the stream
    /// - __magicalValue__ to refer to the current value of the stream

class MagicalBloc {
MagicalBloc(){ firstLoad(); }
    final _magicalSubject = BehaviorSubject<MagicalControl>();
    Stream<MagicalControl> get magicalStream => _magicalSubject.stream;
    Function(MagicalControl) get _magicalAdd => _magicalSubject.sink.add;
    void magicalAddEventToStream(event) => _magicalAdd(event);
    MagicalControl get magicalValue => _magicalSubject.value;

    Future dispose() async {
    _magicalSubject.close();
    }
    firstLoad() { magicalAddEventToStream(MagicalControl());}
    /// This is the main method to use in order to change a set of value for a set of controls
    /// [values] is a list of new values that you want to submit for the specific controls
    /// [configs] is a list of the controls that you want to change. They are all elements from the generated enum that starts with MAGICAL_
    /// The ith element in values should correspond to the ith element in configs: That is, first in values to first in configs, second in values to second in configs, and so on

changeUIElements(values, configs){ magicalAddEventToStream(MagicalControl.setValues(magicalValue, configs, values));}
    /// This is the main method to use in order to change the value of a control
    /// [value] is the new value that you want to submit for the specific control
    /// [config] is the control that you want to change. It is an element from the generated enum that starts with MAGICAL_

changeUIElement(value, config){ magicalAddEventToStream(MagicalControl.setValue(magicalValue, [config], value));}
}
    /// By default the withProvider of the [Alakazam] annotation is set to true.
    /// This will generate the [MagicalWidget] class. This widget is an inherited widget and it holds the generated bloc, which it returns from its _of()_ method
    /// If you do not want this behavior, the withProvider argument could be set to false, and this widget will not be generated

class MagicalWidget extends InheritedWidget {
final MagicalBloc magicalBloc = MagicalBloc();
        MagicalWidget({
          Key key,
          @required Widget child,
        }) : assert(child != null),
             super(key: key, child: child);

        static MagicalBloc of(BuildContext context) {
          return (context.inheritFromWidgetOfExactType(MagicalWidget)
            as MagicalWidget)
            .magicalBloc;
        }

        @override
        bool updateShouldNotify(MagicalWidget old) {
          return old.magicalBloc != magicalBloc;
        }

}