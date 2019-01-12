
/// The annotation class that is going to be used to generate the source code
/// It takes a single optional argument [withProvider] that defaults to true
/// This argument instructs the code generating package to create an [InheritedWidget] of the name MagicalWidget that will contain the generated BLoC
/// Put this variable to false if you want to create your own [InheritedWidget], or you do not want to create it at all.
/// 
/// Where it works:
/// 
/// The Alakazam annotation should be set only for an enum type, and the elements of that enum should follow a specific syntax
/// The syntax is:
/// ```
/// enum SOME_NAME {
///   element_name$type$default_value
/// }
/// ```
/// So as shown above, each element should have three sections separated by __$__
/// __element_name__ is just the name of the element. __type__ should be one of [_bool_], [_num_], or [_String_]. And the __default_value__ is the default value for that element depending on the specified type.
/// Only the first section (__element_name__) is mandatory. 
/// The other two sections, and if they do not exist or they could not be infered, are attributed default values. 
/// The __type__ in case it is missing is defaulted to [_String_]
/// For the __default_value__ section, if it is not specified, its value depends on the type:
/// - if the type is [_String_], the __default_value__ is an empty string
/// - if the type is [_num_], the __default_value__ is 0
/// - if the type is [_bool_], the __default_value__ is false
/// 
/// Example:
/// ```
/// @Alakazam()
/// enum VerificationScreenSettings {
///   mobileNumberTextField$String
///   enableMobileNumberTextField$bool$true
///   enableSendSMSBtn$bool$true
/// }
/// ```
class Alakazam {
  final bool withProvider;

  const Alakazam({this.withProvider=true});


}