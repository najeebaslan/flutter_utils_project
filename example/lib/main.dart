
    import 'package:provider/provider.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter_utils_project/flutter_utils_project.dart';

    Future<void>  main() async{
    ///this is page Flutter Error Details
    ///if you want test this widget enter it inside body <<Text( int.parse('text').toString()),>>
    FlutterErrorPage.flutterErrorDetails();
    //You will need to initialize AppThemeNotifier class for theme changes.
    WidgetsFlutterBinding.ensureInitialized();
    FlutterUtilsProject.init();
    runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FuAppThemeNotifier>(
    create: (_) => FuAppThemeNotifier(),
    ),
    ], child: const MyApp()));
    }

    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return Consumer<FuAppThemeNotifier>(builder:
    (BuildContext context, FuAppThemeNotifier value, Widget? child) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flutter Utils Project",
    theme: FuAppTheme.getThemeFromThemeMode(),
    home: const HomePage() //navigator to your HomeScreen
    );
    });
    }
    }

    class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);
    @override
    _MyCustomWidgetState createState() => _MyCustomWidgetState();
    }

    class _MyCustomWidgetState extends State<HomePage> {
    void _handleRadioValueChange(FuAppThemeType? value) {
    Provider.of<FuAppThemeNotifier>(context, listen: false) .changeAppThemeMode(value);
    }

    final TextEditingController _textController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    late ThemeData themeData;

    @override
    Widget build(BuildContext context) {
    themeData = Theme.of(context);//this is for initialize ThemeData
    return Scaffold(
    backgroundColor: themeData.scaffoldBackgroundColor, //this  is Example FuAppTheme
    appBar: AppBar(
    actions: [

    Row(
    children: <Widget>[
    FuText(FuAppTheme.isDarkMode ? "Dark Theme" : "Light Theme",
    textStyle: themeData.textTheme.subtitle2),
    CircleButton(
    // you can add color 
    color:FuAppTheme.isDarkMode?Colors.black.withOpacity(0.2): Colors.grey[200],
    onPressed: () {
    //Example Change App ThemeMode
    FuAppTheme.isDarkMode
    ? _handleRadioValueChange(FuAppThemeType.light)
    : _handleRadioValueChange(FuAppThemeType.dark);
    },
    icon: Icon(
    FuAppTheme.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
    color: FuAppTheme.customTheme.blueToWithe,
    ), iconSize: 30,),
    ],
    ).paddingOnly(left: 16, right: 16),
    ],
    backgroundColor: themeData.appBarTheme.backgroundColor,
    ),
    body:
     SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
     
         /* 
         Example Spacing any Widget, and There are also many features
         same[  FuSpacing.only ,all , zero,bottom ,fromLTRB ,horizontal,left , .....and a lot]
         */
     
         children: [
         //  Text( int.parse('test').toString()),//it is do FlutterErrorDetails
         Row(children: [  FuText.sh1 ('Example TextField',color:FuAppTheme.customTheme.blackToWithe , )], ).paddingBottom(12),
     
         FuContainer.none(
         borderRadius: radius(),
     
         /* 
         There are mainly 2 styles of TextField.
         [FuTextFieldStyle.underlined] -  It gives underline to the textField.
         [FuTextFieldStyle.outlined] -  It gives outline to the textField.
         */
     
         child: Row(
         children: [
     
     
         Expanded(child:  FuTextField(
         // textFieldType: FuTextFieldType.email,
         decoration: InputDecoration(
         hintText: 'Email Address',
         labelStyle: FuTextStyle.b1(color: Colors.grey[700]),
         labelText: 'Email Address',
         contentPadding: const EdgeInsets.all(16)),
         alignLabelWithHint: true,),)
     
     
         ],
         ),
         color: themeData.backgroundColor,
         ),
     
         15.height,//(height)=>int_extensions.
     
         /* 
         [FuSharedPreferences]  There are mainly 8 types of FuSharedPreferences,
         [getString,setString,setInt,getInt,setBool,getBool,deleteString,clearAllData]
         */
         FuDashedDivider( color:FuAppTheme.getThemeFromThemeMode().colorScheme.onBackground, ),
     
         15.height,
     
         Row(children:[  FuText.sh1( 'Example SharedPreferences', color:FuAppTheme.customTheme.blackToWithe ,) ],).paddingBottom(12),
     
         FuContainer.none(
         borderRadius: radius(),
         child: Form(
         key: _formKey,
         child: TextFormField(
         controller: _textController,
         /* this is FuInputValidation  */
         validator:(String ?value){
         return FuInputValidation.validationTextField(
         controller: _textController, 
         error: '(Enter Your Error)', 
         lengthMin: 'The field must be at least tow characters long.',
         lengthMax: 'The field should not be more than eight letters long.',
         main: 2,
         max: 8);
         } ,
         decoration: InputDecoration(
         contentPadding: FuSpacing.all(16.0),
         labelText: "Example Text",
         focusedBorder: themeData.inputDecorationTheme.focusedBorder,
         prefixIcon: const Icon( Icons.text_fields, size: 24,),
         ),), ),
         color:themeData.backgroundColor,
         ),
     
         15.height,
     
         SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         child: Row(
         children: [
         FuButton.rounded(
         backgroundColor: FuAppTheme.isDarkMode
         ? themeData.backgroundColor.withOpacity(1)
         :themeData.primaryColor,
         onPressed:() {
         if (_formKey.currentState!.validate()){
         FuSharedPreferences.setString('Your Key', _textController.text);
         } },
     
         child: FuText('setString', color: FuAppTheme.customTheme.withe,)
         ).paddingAll(3),//(paddingAll)=>widget_extensions
     
         FuButton.rounded(
         backgroundColor: FuAppTheme.isDarkMode
         ? themeData.backgroundColor.withOpacity(1)
         : themeData.primaryColor,
         onPressed: () async {
     
         var getString = await FuSharedPreferences.getString( 'Your Key',);
         FuLog(getString.toString());},
     
         child: FuText( 'getString',
         color:  FuAppTheme.customTheme.withe,
         )).paddingOnly(left: 3),
     
         FuButton.rounded(
         backgroundColor: FuAppTheme.isDarkMode
         ? themeData.backgroundColor.withOpacity(1)
         : themeData.primaryColor,
         onPressed: () async => await FuSharedPreferences.deleteString( 'Your Key',),
         child: FuText( 'delete key',
         color:FuAppTheme.customTheme.withe,
         )).paddingOnly(left: 3),
     
         FuButton.rounded(
         backgroundColor: FuAppTheme.isDarkMode
         ? themeData.backgroundColor.withOpacity(1)
         : themeData.primaryColor,
         onPressed: () async => await FuSharedPreferences.clear('Your Key'),
         child: FuText('clear',
         color: FuAppTheme.customTheme.withe,
         )).paddingOnly(left: 3),
     
         ],
         ),
         ),
         15.height,
         FuDashedDivider(color: themeData.colorScheme.onBackground,),
     
         15.height,
         Row(
         children: [
         const Text('Example replace From number English To Arabic'),
         5.width,
         Expanded(
         child: Text(''. replaceFarsiNumber('123',),
         style: TextStyle(color:themeData.primaryColor,fontSize: 20),
         ),
         ),
         ],
         ),
         15.height,
         FuDashedDivider(
         color: themeData.colorScheme.onBackground,
         ),
     
         15.height,
     
         Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
         /*
         Three types of button implemented from Material Button.
         [FuButtonType.elevated] - gives elevation to the button along with some height and shadow.
         [FuButtonType.outlined] - gives outline to the button
         [FuButtonType.text] - able to build text button 
         */
         FuButton.rounded(
         backgroundColor:
         themeData.buttonTheme.colorScheme?.background,
         onPressed: () => FuLog('print Example Button'),
         child: FuText(
         'Example Button',
         color: FuAppTheme.customTheme.withe,
         )),
         /*
         Example FuContainer it have a lot
         properties [ FuContainer.bordered , FuContainer.none , FuContainer.roundBordered ,FuContainer.rounded] 
         */
         FuContainer.bordered(
         color: themeData.buttonTheme.colorScheme?.background,
         child: FuText(
         'Example Container',
         color: FuAppTheme.customTheme.withe,
         )),
         ],
         ),
     
         ],
     
         ).paddingAll(12),
     ),
    
    );
    }
    }
