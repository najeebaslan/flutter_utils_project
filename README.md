# flutter_utils_project

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

This library works to provide the tools and parts needed to build your project faster.

### As of now this package supports  Android iOs macOs Linux Windows Web

## In this library you can find:

- `SharedPreferences`.
- `AppTheme` Dark-light.
- `AutoSizeText`.
- `ContextExtensions`.
- `ErrorHandler`.
- `IntExtensions`.
- `TextStyle`.
- `StringExtension`.
- `Spacing`.
- `WidgetExtension`.
- `Button` (Type) => rounded - small - medium - text - block - outlined - large.
- `Container` (Type) => none - bordered - roundBordered - rounded.
- `TextFormField` (Type) => none - bordered - roundBordered - rounded.
- `Text` => There are mainly 13 types of Text widgets.
- `Patterns` for url - phone - image - audio - text - document - excel - ppt - apk - pdf - html.
- `CustomLog` 
- `countryCode`
- `ErrorResponse`
- `Decoration`

## 1- How to use the SharedPreferences

#### set String

```dart
 await MySharedPreferences.setString('Enter Your Key', ' Enter Username');

```

#### get String

```dart
 await MySharedPreferences.getString('Enter Your Key', ' Enter Username');

```

#### get delete

```dart

await MySharedPreferences.deleteString('Enter Your Key');

```

You can also do a lot of operations with SharedPreferences

## 2- Use the AppTheme

```dart
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
Future<void> main() async {
runApp(
  MultiProvider(
      providers: [
     ChangeNotifierProvider<FuAppThemeNotifier>( 
     create: (_) => FuAppThemeNotifier(),), ],
     child: const MyApp()
 ) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FuAppThemeNotifier>(
        builder: (BuildContext context, FuAppThemeNotifier value, Widget? child) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Utils Project",
      theme: FuAppTheme.getThemeFromThemeMode(),
      home: const HomeScreen()//navigator to your HomeScreen
      );
    });
  }
}
```

## 3- Use AutoSizeText

`AutoSizeText` behaves exactly like a `Text`. The only difference is that it resizes text to fit within its bounds.

```dart
AutoSizeText(
  'A really long String',
  style: TextStyle(fontSize: 30),
  maxLines: 2,
)

```

#### maxLines

The `maxLines` parameter works like you are used to with the `Text` widget. If there is no `maxLines` parameter specified, the AutoSizeText only fits the text according to the available width and height.

```dart

AutoSizeText(
  'A really long String',
  style: TextStyle(fontSize: 30),
  maxLines: 2,
)

```

## 4- Use the ContextExtensions

bool get isSmallTablet => (mediaQueryShortestSide >= 600);
can you get found context Extensions [`mediaQueryPadding` - `mediaQuery` - `textTheme` - `mediaQueryViewPadding` - `orientation` - `textScaleFactor` - `mediaQueryShortestSide`] and `Responsive` ui [`isPhone` - `isSmallTablet` - `isLargeTablet` - `isTablet`]
and the a lot Extensions

```dart
 Container(
  color: context.textTheme.bodyText2!.color,//can yuo get found Context Extensions theme
  height: context.height / 2,//can yuo get found Context Extensions height (mediaQuerySize height)
  width: context.width / 1.5,
  child: const Center( child: Text( 'wellCome', style: TextStyle(color: Colors.white), ),
  ),
),

```

## 5- ErrorHandler

can you handler error `Exception`.
Handling for Error Exception Example  (No Internet Connection 😑
  or Bad response format 👎
  or Couldn't find the post 😱 )
  And if nothing happens, he'll return the default mistake.

```dart

 Future<List<YOURMODEL>?> getProfile(BuildContext context) async {
    try {
       static const Map<String, String> HEADER = {
    "Content-type": "application/json",
      "Accept": "application/json" "Access-Control-Allow-Origin: *",
      HttpHeaders.authorizationHeader: 'YOUR TOKEN'
  };
      List<YOURMODEL> profile = [];//your model class
      http.Response response = await http.get(
        Uri.parse('YOUR URI'),
        headers: HEADER
      );
      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        profile = list.map((model) => YOURMODEL.fromJson(model)).toList();
        return profile;
      } else {
        var massages = jsonDecode(response.body);
        String error = massages['Error'];
       // return showSnackBar(); //can you return anything
       print(error)
      }
    } catch (err) {
     /*
        Handling for Error Exception Example  (No Internet Connection 😑
       or Bad response format 👎
       or Couldn't find the post 😱 )
       And if nothing happens, he'll return the default mistake.
       */
      ApiErrorHandler.parseError(err, context,);
      print("$err Error");
    }
    return null;
  }


```

## 6- IntExtensions

### `height` => Leaves given height of space

```dart

Container(child:Text('Example1')),
5.height,
Container(child:Text('Example2')),
```

### `width` => Leaves given width of space

### `isSuccessful` =>HTTP status code

```dart
if(response.statusCode=isSuccessful){
  print(' statusCode Successful')
}

```

### `borderRadius`



### `microseconds`

Returns microseconds duration

```dart
 5.microseconds
```



### `milliseconds`
Returns milliseconds duration

```dart
5.milliseconds
```

### `seconds`

Returns minutes duration

```dart
5.seconds
```


### `minutes`

Returns hours duration

```dart
5.minutes
```

### `hours`

Returns hours duration

```dart
 5.hours
```

### `days`
Returns days duration

```dart
 5.days
```
## 7- TextStyle

[FuTextStyle] - gives 13 different type of styles to the text on the basis of size

```dart

 FuText.h1(
'Example h1',
color: Colors.white,
),

 FuText.b1(
'Example b1',
color: Colors.white,
),
FuText.button(
'Example button',
color: Colors.white,
),


```

## 8- StringExtension

### isImage

```dart

ElevatedButton(
  onPressed: () {
    String image = 'image.png';
    if (image.isImage == true) {
      print('Already it image');
    }else{
    print('Its not in the form of a image.');
    }
  },
  child: const Text('isImage'))
```

### getNumericOnly

Returns only numbers from a string trim Whitespaces

```dart
ElevatedButton(
  onPressed: () {
    String text = 'image.png12';
    print(text.getNumericOnly(text));

  },
  child: const Text('getNumericOnly'))

```

### removeAllWhiteSpace

Removes white space from given String

```dart
ElevatedButton(
onPressed: () {
  String text = 'image.    png12';
  print(text.removeAllWhiteSpace());

},
child: const Text('removeAllWhiteSpace'))


```

### validateEmail

Check email validation

```dart
  ElevatedButton(
  onPressed: () {
    String email = 'testemail@gmail.com';
    print(email.validateEmail());

  },
  child: const Text('validateEmail'))
```

Returns true if given String is null or isEmpty

### isEmptyOrNull

Check email validation

```dart
  ElevatedButton(
  onPressed: () {
 String data = '';
 if(data.isEmptyOrNull){
 print(data.isEmptyOrNull);
  }else{ print('false');}},
  child: const Text('isEmptyOrNull'))

```

### capitalizeFirstLetter
Capitalize given String
```dart
ElevatedButton(
onPressed: () {
  String data = 'welcome';
  print(data.capitalizeFirstLetter());
},
child: const Text('capitalizeFirstLetter'))
```
and find a lot  `String extension`

## 9- Spacing
[FuSpacing] - provides spacing of various types.
```dart
const Text('welcome'),
FuSpacing.height(30),
const Text('FuSpacing')
```

## 10- WidgetExtension
```dart
  //Padding Widget form Height 
  Text('withHeight').withHeight(20),
  //Padding Widget form Width Height  
  Text('widthAndHeight').widthAndHeight(height: 12, width: 11),
  //hide Widget if value equal false else equal true visible widget
  Text('visible').visible(false),
  //you can onTap for any widget
  Text('onTap').onTap(() { print('print'); }),
  //you can withTooltip for any widget
  Text('withTooltip').withTooltip(msg: 'Text'),
  //Padding Widget form Width All 
  Text('paddingAll').paddingAll(12),
  //Padding Widget form Width Bottom 
  Text('paddingBottom').paddingBottom(12),
  //Padding Widget form Width Left 
  Text('paddingLeft').paddingLeft(12),
  //Padding Widget form Width Right 
  Text('paddingRight').paddingRight(12),
  //Padding Widget form Width Only 
  Text('paddingOnly').paddingOnly(bottom: 30,top: 50,left: 0,right: 12), 
  //you can expand for widget
  Text('expand').expand(),
  //you can center for any widget
  Text('center').center(),
  //you can fit for widget
  Text('fit').fit(),
  //you can flexible for widget
  Text('flexible').flexible(),
  //Padding Widget form Width Only 
  Text('paddingSymmetric').paddingSymmetric(),
  //this is same SizedBox()
  WidgetExtension.empty(),

        
```

## 11- FuLog 
```dart
 FuLog('Anything');
```


## 12- countryCode
get all name and code all country
```dart
  Column(children: List<Widget>.generate(FxTextUtils. countryCode.length, (index) {
  FxTextUtils. countryCode.toList();
  var data= FxTextUtils. countryCode[index];
  return Row(
  children: [
  Text(data['name']),
  12.width,
  Text(data['code'],style: TextStyle(color: context.theme.primaryColor),),
  ],
  );
  },)),
```

## 13- FuWidgetErrorResponse 
```dart
  FuErrorResponse.snackBarError(
  error: "Bad response format 👎",
  context: context,
  color: Colors.red,
  );

```


## 14- FuDashedDivider
this is same Divider but  has Dashed Example this shape [`- - - - - - - - - - - - `]
```dart
FuDashedDivider( color:FuAppTheme.getThemeFromThemeMode().colorScheme.onBackground, ),
```

## 15- Decoration
#### `boxDecorationDefault`

```dart
Container(child: Text('boxDecorationDefault'),decoration: boxDecorationDefault(),),
```

#### boxDecorationWithShadow
```dart
Container(child: const Text('boxDecorationWithShadow'),decoration: boxDecorationWithShadow(shadowColor: context.theme.primaryColor),),
```



#### `radius`

```dart
FuContainer.none(borderRadius: radius(),child:Text('radius'))

```
#### `radiusOnly`
```dart

FuContainer.none(borderRadius:  radiusOnly(),child:Text('radiusOnly'))
``` 
#### ShapeBorder dialogShape



