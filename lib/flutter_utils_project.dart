library flutter_utils_project;
/*File : flutter_utils_project
Version : 1.2.0
*/

///core
export 'src/core/logs/log.dart';
export 'src/core/network/snap_helper_widget.dart';

///styles
export 'src/styles/shadow.dart';

///theme
export 'src/themes/app_theme.dart';
export 'src/themes/app_theme_notifier.dart';
export 'src/themes/custom_theme.dart';
export 'src/themes/text_style.dart';

///utils
export 'src/utils/extensions/context_extensions.dart';
export 'src/utils/extensions/string_extensions.dart';
export 'src/utils/extensions/int_extensions.dart';
export 'src/utils/extensions/widget_extensions.dart';
export 'src/utils/handelerrors/handel_errors.dart';
export 'src/utils/sharedpreferences/sherdperfomsnce.dart';
export 'src/utils/size/auto_size.dart';
export 'src/utils/validate/patterns.dart';
export 'src/utils/nb_utilse.dart';
export 'src/utils/spacing.dart';
export 'src/utils/text_utils.dart';
export 'src/utils/validate/input_validation.dart';

///widget
export 'src/widgets/button/button.dart';
export 'src/widgets/button/circle_button.dart';
export 'src/widgets/card/card.dart';
export 'src/widgets/container/container.dart';
export 'src/widgets/dashed_divider/dashed_divider.dart';
export 'src/widgets/decoration/decoration.dart';
export 'src/widgets/dotted_line/dotted_line.dart';
export 'src/widgets/text/text.dart';
export 'src/widgets/text_field/text_field.dart';
export 'src/widgets/flutter_error/flutter_error_details.dart';

import 'src/core/logs/log.dart';
import 'src/themes/app_theme_notifier.dart';

class FlutterUtilsProject {
  // entry point of the package
  static init() {
    FuAppThemeNotifier().init();
  }

  static enableLog() {
    FuLog.enable();
  }

  static disableLog() {
    FuLog.disable();
  }
}
