import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';

Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  FuAppThemeNotifier().init();
  runApp(const MaterialApp(
    home: MyApp(),
  )
      //   MultiProvider(providers: [
      //   ChangeNotifierProvider<FuAppThemeNotifier>(
      //     create: (_) => FuAppThemeNotifier(),
      //   ),
      // ], child: const MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // themeData = Theme.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //can you get found context  Extensions [mediaQueryPadding -mediaQuery - textTheme - mediaQueryViewPadding - orientation - textScaleFactor - mediaQueryShortestSide]
        children: [
          const Text('withHeight').withHeight(20),
          const Text('widthAndHeight').widthAndHeight(height: 12, width: 11),
          const Text('visible').visible(false),
          const Text('onTap').onTap(() {
            print('print');
          }),
          Text('withTooltip').withTooltip(msg: 'Text'),
          Text('paddingAll').paddingAll(12),
          Text('paddingBottom').paddingBottom(12),
          Text('paddingLeft').paddingLeft(12),
          Text('paddingRight').paddingRight(12),
          Text('paddingOnly').paddingOnly(bottom: 30, top: 50, left: 0, right: 12),
          Text('expand').expand(),
          Text('center').center(),
          Text('fit').fit(),
          Text('flexible').flexible(),
          Text('paddingSymmetric').paddingSymmetric(),
          WidgetExtension.empty(),
        

        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FuAppThemeNotifier>(builder:
//         (BuildContext context, FuAppThemeNotifier value, Widget? child) {
//       return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: "Flutter Utils Project",
//           theme: FuAppTheme.getThemeFromThemeMode(),
//           home: const MyCustomWidget() //navigator to your HomeScreen
//           );
//     });
//   }
// }

// class MyCustomWidget extends StatefulWidget {
//   const MyCustomWidget({Key? key}) : super(key: key);

//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }

// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   bool isExpanded = false;
//   bool isExpanded1 = false;

//   void _handleRadioValueChange(FuAppThemeType? value) {
//     Provider.of<FuAppThemeNotifier>(context, listen: false)
//         .changeAppThemeMode(value);
//   }

//   final TextEditingController _text = TextEditingController();

//   final _formkey = GlobalKey<FormState>();
//   late ThemeData themeData;
//   @override
//   Widget build(BuildContext context) {
//     log('aslan');

//     themeData = Theme.of(context);
//     return Scaffold(
//       backgroundColor:
//         FuAppTheme.theme.scaffoldBackgroundColor, //this  is Example FuAppTheme
//       appBar: AppBar(
//         actions: [
//           Row(
//             children: <Widget>[
//               FuText(FuAppTheme.isDarkMode ? "Dark Theme" : "Light Theme",
//                   textStyle:   FuAppTheme.theme.textTheme.subtitle2),
//               IconButton(
//                   onPressed: () {
//                     //Example Change App ThmeMode
//                     FuAppTheme.isDarkMode
//                         ? _handleRadioValueChange(FuAppThemeType.light)
//                         : _handleRadioValueChange(FuAppThemeType.dark);
//                   },
//                   icon: Icon(
//                     FuAppTheme.isDarkMode ? Icons.dark_mode : Icons.light_mode,
//                     color: FuAppTheme.theme.primaryColor,
//                   )),
//             ],
//           ).paddingOnly(left: 16, right: 16),
//         ],
//         backgroundColor:   FuAppTheme.theme.appBarTheme.backgroundColor,
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,

//         /* Example Spacing any Widget, and There are also many features
//             same[  FuSpacing.only ,all , zero,bottom ,fromLTRB ,horizontal,left , .....and a lot] */

//         children: [
//           Row(
//             children: [
//               FuText(
//                 'Example TextField',
//               )
//             ],
//           ).paddingBottom(12),

//           FuContainer.none(
//             borderRadius: radius(),

//             ///There are mainly 2 styles of TextField.
//             ///[FuTextFieldStyle.underlined] -  It gives underline to the textField.
//             ///[FuTextFieldStyle.outlined] -  It gives outline to the textField.

//             child: FuTextField(
//               // textFieldType: FuTextFieldType.email,
//               decoration: InputDecoration(
//                 hintText: 'Email Adderss',
//                 labelStyle: FuTextStyle.b1(color: Colors.grey[700]),
//                 labelText: 'Email Adderss',
//                 contentPadding: FuSpacing.all(16.0),
//               ),

//               alignLabelWithHint: true,
//             ),
//             color:   FuAppTheme.theme.backgroundColor,
//           ),
//           // widgetTextField(
//           //     context.width,
//           //     FuAppTheme.isDarkMode
//           //         ? themeData.appBarTheme.backgroundColor!
//           //         : FuAppTheme.customTheme.blue),
//           15.height,

//           ///[FuSharedPreferences]  There are mainly 8 types of FuSharedPreferences, [getString,setString,setInt,getInt,setBool,getBool,deleteString,clereAllData]
//           FuDashedDivider(
//             color: FuAppTheme.getThemeFromThemeMode().colorScheme.onBackground,
//           ),
//           15.height,

//           Row(
//             children: [
//               FuText(
//                 'Example SharedPreferences',
//                 color: FuAppTheme.customTheme.colorInfo,
//               )
//             ],
//           ).paddingBottom(12),

//           FuContainer.none(
//             borderRadius: radius(),
//             child: Form(
//               key: _formkey,
//               child: TextFormField(
//                 controller: _text,
//                 decoration: InputDecoration(
//                   contentPadding: FuSpacing.all(16.0),
//                   labelText: "Example Text",
//                   focusedBorder:   FuAppTheme.theme.inputDecorationTheme.focusedBorder,
//                   prefixIcon: const Icon(
//                     Icons.text_fields,
//                     size: 24,
//                   ),
//                 ),
//               ),
//             ),
//             color:   FuAppTheme.theme.backgroundColor,
//           ),
//           15.height,

//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 FuButton.rounded(
//                     backgroundColor: FuAppTheme.isDarkMode
//                         ?   FuAppTheme.theme.backgroundColor.withOpacity(1)
//                         :   FuAppTheme.theme.primaryColor,
//                     onPressed: () {
//                       FuSharedPreferences.setString('You Key', _text.text);
//                     },
//                     child: FuText(
//                       'setString',
//                       color:   FuAppTheme.theme.textTheme.overline?.color,
//                     )).paddingAll(3),
//                 FuButton.rounded(
//                     backgroundColor: FuAppTheme.isDarkMode
//                         ?   FuAppTheme.theme.backgroundColor.withOpacity(1)
//                         :   FuAppTheme.theme.primaryColor,
//                     onPressed: () async {
//                       var getString = await FuSharedPreferences.getString(
//                         'You Key',
//                       );
//                       FuLog(getString.toString());
//                     },
//                     child: FuText(
//                       'getString',
//                       color:   FuAppTheme.theme.textTheme.overline?.color,
//                     )).paddingOnly(left: 3),
//                 FuButton.rounded(
//                     backgroundColor: FuAppTheme.isDarkMode
//                         ?   FuAppTheme.theme.backgroundColor.withOpacity(1)
//                         :   FuAppTheme.theme.primaryColor,
//                     onPressed: () async {
//                       await FuSharedPreferences.deleteString(
//                         'You Key',
//                       );
//                     },
//                     child: FuText(
//                       'delete key',
//                       color:   FuAppTheme.theme.textTheme.overline?.color,
//                     )).paddingOnly(left: 3),
//                 FuButton.rounded(
//                     backgroundColor: FuAppTheme.isDarkMode
//                         ?   FuAppTheme.theme.backgroundColor.withOpacity(1)
//                         :   FuAppTheme.theme.primaryColor,
//                     onPressed: () async {
//                       await FuSharedPreferences.clereAllData(
//                         'You Key',
//                       );
//                     },
//                     child: FuText(
//                       'clere',
//                       color:   FuAppTheme.theme.textTheme.overline?.color,
//                     )).paddingOnly(left: 3),
//               ],
//             ),
//           ),
//           15.height,
//           FuDashedDivider(
//             color: FuAppTheme.theme.colorScheme.onBackground,
//           ),
//           15.height,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               /// Three types of button implemented from Material Button.
//               /// [FuButtonType.elevated] - gives elevation to the button along with some height and shadow.
//               /// [FuButtonType.outlined] - gives outline to the button
//               /// [FuButtonType.text] - able to build text button
//               FuButton.rounded(
//                   backgroundColor:
//                         FuAppTheme.theme.buttonTheme.colorScheme?.background,
//                   onPressed: () => FuLog('print Example Button'),
//                   child: FuText(
//                     'Example Button',
//                     color: FuAppTheme.customTheme.withe,
//                   )),
//               // Example FuContainer it have a lote
//               //properties [ FuContainer.bordered , FuContainer.none , FuContainer.roundBordered ,FuContainer.rounded]
//               FuContainer.bordered(
//                   color:   FuAppTheme.theme.buttonTheme.colorScheme?.background,
//                   child: FuText(
//                     'Example Container',
//                     color: FuAppTheme.customTheme.withe,
//                   )),
//             ],
//           ),

//           ///Example  [FuCreditCard] - customisable credit card with all the necessary details in it.
//           SizedBox(
//               height: 300,
//               child: FuCreditCard(
//                 onCreditCardCVVChanged: (creditCardCVV) {
//                   'Example creditCardCVV';
//                 },
//                 onCreditCardDateChanged: (creditCardDate) {
//                   'Example creditCardDate';
//                 },
//                 onCreditCardNameChanged: (creditCardName) {
//                   'Example creditCardName';
//                 },
//                 onCreditCardNumberChanged: (creditCardNumber) {
//                   ' Example creditCardNumber';
//                 },
//               ))
//         ],
//       )),
//     );
//   }

//   Widget widgetTextField(
//     double _w,
//     Color color,
//   ) {
//     return InkWell(
//       highlightColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       onTap: () {
//         setState(() {
//           isExpanded = !isExpanded;
//         });
//       },
//       child: AnimatedContainer(
//         margin: FuSpacing.symmetric(
//           horizontal: isExpanded ? 25 : 5,
//           vertical: 5,
//         ),
//         padding: FuSpacing.all(6),
//         curve: Curves.fastLinearToSlowEaseIn,
//         duration: const Duration(milliseconds: 1200),
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: FuAppTheme.isDarkMode
//                   ? FuAppTheme.theme.textTheme.bodyText1!.color!
//                   : color.withOpacity(0.5),
//               blurRadius: 1,
//               offset: const Offset(0.1, 0.1),
//             ),
//           ],
//           color: color,
//           borderRadius: BorderRadius.all(
//             Radius.circular(isExpanded ? 20 : 0),
//           ),
//         ),
//         child: Wrap(
//           runAlignment: WrapAlignment.spaceBetween,
//           alignment: WrapAlignment.spaceBetween,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 /// There are mainly 13 types of Text widgets.
//                 /// h1,h2,h3,h4,h5,h6,sh1,sh2,b1,b2,button,caption,overline - This is the order of its size.

//                 FuText.h6(
//                   'Example FuTextField',
//                   color: Colors.white,
//                 ).expand(),
//                 5.height, //this is extends  IntExtensions
//                 Icon(
//                   isExpanded
//                       ? Icons.keyboard_arrow_down
//                       : Icons.keyboard_arrow_up,
//                   color: Colors.white,
//                   size: 27,
//                 ).onTap(() {
//                   // this is extension from  WidgetExtension and found [ expand , center , flixble, fit validate , visible and ...... fount a lot]
//                   setState(() {
//                     isExpanded = !isExpanded;
//                   });
//                 }),
//               ],
//             ).paddingOnly(left: 9, right: 9, top: 9, bottom: 9),
//             5.height,

//             // isExpanded ? const SizedBox() : const SizedBox(height: 20),
//             AnimatedCrossFade(
//               firstChild: const Text(
//                 '',
//                 style: TextStyle(
//                   fontSize: 0,
//                 ),
//               ),
//               secondChild: FuContainer.none(
//                 borderRadius: radius(),

//                 ///There are mainly 2 styles of TextField.
//                 ///[FuTextFieldStyle.underlined] -  It gives underline to the textField.
//                 ///[FuTextFieldStyle.outlined] -  It gives outline to the textField.
//                 child: FuTextField(
//                   enableHint: true,
//                   hintText: 'name',
//                 ),
//                 color: themeData.backgroundColor,
//               ),
//               crossFadeState: isExpanded
//                   ? CrossFadeState.showFirst
//                   : CrossFadeState.showSecond,
//               duration: const Duration(milliseconds: 1200),
//               reverseDuration: Duration.zero,
//               sizeCurve: Curves.fastLinearToSlowEaseIn,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   ///[FuSharedPreferences]  There are mainly 8 types of FuSharedPreferences, [getString,setString,setInt,getInt,setBool,getBool,deleteString,clereAllData]

//   Widget widgetSharedPreferences(
//       double _w, Color color, Widget child, bool expand) {
//     log(expand.toString());
//     return AnimatedContainer(
//       margin: FuSpacing.symmetric(
//         horizontal: expand ? 25 : 5,
//         vertical: 5,
//       ),
//       padding: FuSpacing.all(6),
//       curve: Curves.fastLinearToSlowEaseIn,
//       duration: const Duration(milliseconds: 1200),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: FuAppTheme.isDarkMode
//                 ? FuAppTheme.theme.textTheme.bodyText1!.color!
//                 : color.withOpacity(0.5),
//             blurRadius: 1,
//             offset: const Offset(0.1, 0.1),
//           ),
//         ],
//         color: color,
//         borderRadius: BorderRadius.all(
//           Radius.circular(expand ? 20 : 0),
//         ),
//       ),
//       child: Wrap(
//         runAlignment: WrapAlignment.spaceBetween,
//         alignment: WrapAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               FuText.h6(
//                 'Example FuSharedPreferences',
//                 color: Colors.white,
//               ).expand(),
//               5.height, //this is extends  IntExtensions
//               Icon(
//                 expand ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
//                 color: Colors.white,
//                 size: 27,
//               ).onTap(() {
//                 // this is extension from  WidgetExtension and found [ expand , center , flixble, fit validate , visible and ...... fount a lot]
//                 setState(() {
//                   expand = true;
//                 });
//               }),
//             ],
//           ).paddingOnly(left: 9, right: 9, top: 9, bottom: 9),
//           5.height,

//           // isExpanded ? const SizedBox() : const SizedBox(height: 20),
//           AnimatedCrossFade(
//             firstChild: const Text(
//               '',
//               style: TextStyle(
//                 fontSize: 0,
//               ),
//             ),
//             secondChild: child,
//             crossFadeState:
//                 expand ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//             duration: const Duration(milliseconds: 1200),
//             reverseDuration: Duration.zero,
//             sizeCurve: Curves.fastLinearToSlowEaseIn,
//           ),
//         ],
//       ),
//     ).onTap(
//       () {
//         expand = !expand;
//         setState(() {
//           expand = !expand;
//         });
//       },
//     );
//   }
// }
