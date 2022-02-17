
      import 'package:provider/provider.dart';
      import 'package:flutter/material.dart';
      import 'package:flutter_utils_project/flutter_utils_project.dart';

      Future<void> main() async {
      //You will need to initialize AppThemeNotifier class for theme changes.
      WidgetsFlutterBinding.ensureInitialized();
      FuAppThemeNotifier().init();
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
      bool isExpanded = false;
      bool isExpanded1 = false;

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
      backgroundColor: FuAppTheme.theme.scaffoldBackgroundColor, //this  is Example FuAppTheme
      appBar: AppBar(
      actions: [
      Row(
      children: <Widget>[
      FuText(FuAppTheme.isDarkMode ? "Dark Theme" : "Light Theme",
      textStyle: FuAppTheme.theme.textTheme.subtitle2),
      IconButton(
      onPressed: () {
      //Example Change App ThemeMode
      FuAppTheme.isDarkMode
      ? _handleRadioValueChange(FuAppThemeType.light)
      : _handleRadioValueChange(FuAppThemeType.dark);
      },
      icon: Icon(
      FuAppTheme.isDarkMode ? Icons.dark_mode : Icons.light_mode,
      color: FuAppTheme.theme.primaryColor,
      )),
      ],
      ).paddingOnly(left: 16, right: 16),
      ],
      backgroundColor: FuAppTheme.theme.appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      /* 
      Example Spacing any Widget, and There are also many features
      same[  FuSpacing.only ,all , zero,bottom ,fromLTRB ,horizontal,left , .....and a lot]
      */

      children: [
      Row(children: const[  FuText('Example TextField', )], ).paddingBottom(12),
      FxDottedLine(child: const Text('FxDottedLine'),
      color: context.theme.primaryColor,
      dottedLength: 12,strokeWidth: 6,
      width: 100,
      height: 100,
      space: 1,
      ),
      FuContainer.none(
      borderRadius: radius(),

      /* 
      There are mainly 2 styles of TextField.
      [FuTextFieldStyle.underlined] -  It gives underline to the textField.
      [FuTextFieldStyle.outlined] -  It gives outline to the textField.
      */

      child: FuTextField(
      // textFieldType: FuTextFieldType.email,
      decoration: InputDecoration(
      hintText: 'Email Address',
      labelStyle: FuTextStyle.b1(color: Colors.grey[700]),
      labelText: 'Email Address',
      contentPadding: FuSpacing.all(16.0),),
      alignLabelWithHint: true,),
      color: FuAppTheme.theme.backgroundColor,
      ),

      15.height,//(height)=>int_extensions.

      /* 
      [FuSharedPreferences]  There are mainly 8 types of FuSharedPreferences,
      [getString,setString,setInt,getInt,setBool,getBool,deleteString,clearAllData]
      */
      FuDashedDivider( color:FuAppTheme.getThemeFromThemeMode().colorScheme.onBackground, ),

      15.height,

      Row( children:const [  FuText( 'Example SharedPreferences', ) ],).paddingBottom(12),

      FuContainer.none(
      borderRadius: radius(),
      child: Form(
      key: _formKey,
      child: TextFormField(
      controller: _textController,
      decoration: InputDecoration(
      contentPadding: FuSpacing.all(16.0),
      labelText: "Example Text",
      focusedBorder: FuAppTheme.theme.inputDecorationTheme.focusedBorder,
      prefixIcon: const Icon( Icons.text_fields, size: 24,),
      ),), ),
      color: FuAppTheme.theme.backgroundColor,
      ),

      15.height,

      SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
      children: [
      FuButton.rounded(
      backgroundColor: FuAppTheme.isDarkMode
      ? FuAppTheme.theme.backgroundColor.withOpacity(1)
      : FuAppTheme.theme.primaryColor,
      onPressed:() =>FuSharedPreferences.setString('Your Key', _textController.text),

      child: FuText('setString', color: FuAppTheme.theme.textTheme.overline?.color,)
      ).paddingAll(3),//(paddingAll)=>widget_extensions

      FuButton.rounded(
      backgroundColor: FuAppTheme.isDarkMode
      ? FuAppTheme.theme.backgroundColor.withOpacity(1)
      : FuAppTheme.theme.primaryColor,
      onPressed: () async {
      var getString = await FuSharedPreferences.getString( 'Your Key',);
      FuLog(getString.toString());
      },
      child: FuText( 'getString',
      color: FuAppTheme.theme.textTheme.overline?.color,
      )).paddingOnly(left: 3),

      FuButton.rounded(
      backgroundColor: FuAppTheme.isDarkMode
      ? FuAppTheme.theme.backgroundColor.withOpacity(1)
      : FuAppTheme.theme.primaryColor,
      onPressed: () async =>await FuSharedPreferences.deleteString( 'Your Key',),
      child: FuText( 'delete key',
      color: FuAppTheme.theme.textTheme.overline?.color,
      )).paddingOnly(left: 3),

      FuButton.rounded(
      backgroundColor: FuAppTheme.isDarkMode
      ? FuAppTheme.theme.backgroundColor.withOpacity(1)
      : FuAppTheme.theme.primaryColor,
      onPressed: () async => await FuSharedPreferences.clearAllData('Your Key'),
      child: FuText('clear',
      color: FuAppTheme.theme.textTheme.overline?.color,
      )).paddingOnly(left: 3),

      ],
      ),
      ),
      15.height,

      FuDashedDivider(
      color: FuAppTheme.theme.colorScheme.onBackground,
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
      FuAppTheme.theme.buttonTheme.colorScheme?.background,
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
      color: FuAppTheme.theme.buttonTheme.colorScheme?.background,
      child: FuText(
      'Example Container',
      color: FuAppTheme.customTheme.withe,
      )),
      ],
      ),

      /*
      Example  [FuCreditCard] - customizable credit card with all the necessary details in it.
      */
      SizedBox(
      height: 300,
      child: FuCreditCard(
      onCreditCardCVVChanged: (creditCardCVV) {
      'Example creditCardCVV';
      },
      onCreditCardDateChanged: (creditCardDate) {
      'Example creditCardDate';
      },
      onCreditCardNameChanged: (creditCardName) {
      'Example creditCardName';
      },
      onCreditCardNumberChanged: (creditCardNumber) {
      ' Example creditCardNumber';
      },
      )),
  
      ],
      
      )).paddingAll(12),
      );
      }
      }
