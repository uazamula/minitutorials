import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:minitutorials/add_packages/add_packages.dart';
import 'package:minitutorials/animated_circular_FAB_menu/animated_circular_FAB_menu.dart';
import 'package:minitutorials/appbar_transparent/appbar_transparent.dart';
import 'package:minitutorials/bottom_sheet/bottom_sheet.dart';
import 'package:minitutorials/button_with_image_and_text/button_with_image_and_text.dart';
import 'package:minitutorials/call_setstate_in_popup_alert_dialog/call_setstate_in_popup_alert_dialog.dart';
import 'package:minitutorials/checkbox_listtile/checkbox_listtile.dart';
import 'package:minitutorials/create_popup_dialog_with_textfield/create_popup_dialog_with_textfield.dart';
import 'package:minitutorials/date_picker/date_picker.dart';
import 'package:minitutorials/date_range_picker/date_range_picker.dart';
import 'package:minitutorials/drag_and_drop/drag_and_drop.dart';
import 'package:minitutorials/dropdown_menu_item_list/dropdown_menu_item_list.dart';
import 'package:minitutorials/enable_disable_button/enable_disable_button.dart';
import 'package:minitutorials/expand_collapse_widget/expand_collapse_widget.dart';
import 'package:minitutorials/expansion_panel/expansion_panel.dart';
import 'package:minitutorials/expansion_tile_and_listtile/expansion_tile_and_listtile.dart';
import 'package:minitutorials/fix_row_overflow_wrap_scroll/fix_row_overflow_wrap_scroll.dart';
import 'package:minitutorials/format_date_time_time_ago_locales/format_date_time_time_ago_locales.dart';
import 'package:minitutorials/gesture_detector_and_inkwell/gesture_detector_and_inkwell.dart';
import 'package:minitutorials/hero_widget/hero_widget.dart';
import 'package:minitutorials/how_auto_complete_textfield/how_auto_complete_textfield.dart';
import 'package:minitutorials/how_to_add_favicon/how_to_add_favicon.dart';
import 'package:minitutorials/how_to_fix_bottom_overflowed/how_to_fix_bottom_overflowed.dart';
import 'package:minitutorials/how_to_use_flow_widget/how_to_use_flow_widget.dart';
import 'package:minitutorials/intrinsic_height_and_width_widgets/intrinsic_hww.dart';
import 'package:minitutorials/listview_VC_gridview/listview_VC_gridview.dart';
import 'package:minitutorials/markdown_widget/markdown_widget.dart';
import 'package:minitutorials/mask_any_image/mask_any_image.dart';
import 'package:minitutorials/mask_text_with_image/mask_text_with_image.dart';
import 'package:minitutorials/multi_language_app/multi_language_app.dart';
import 'package:minitutorials/my_preserve_scroll_position/my_preserve_scroll_position.dart';
import 'package:minitutorials/native_splash_screen/native_splash_screen.dart';
import 'package:minitutorials/navigation_bar/navigation_bar.dart';
import 'package:minitutorials/navigation_drawer/navigation_drawer.dart';
import 'package:minitutorials/nested_listviews_and_columns/nested_listviews_and_columns.dart';
import 'package:minitutorials/new_material_3color_scheme/new_material_3color_scheme.dart';
import 'package:minitutorials/null_safety/null_safety.dart';
import 'package:minitutorials/onboarding_screen_UI/HomePage.dart';
import 'package:minitutorials/onboarding_screen_UI/onboarding_screen_UI.dart';
import 'package:minitutorials/page_route_transition/page_route_transition.dart';
import 'package:minitutorials/screen_mirror_phone/screen_mirror_phone.dart';
import 'package:minitutorials/search_and_filter_listview/search_and_filter_listview.dart';
import 'package:minitutorials/search_bar_field_in_appbar/search_bar_field_in_appbar.dart';
import 'package:minitutorials/simple_photo_gallery_app/simple_photo_gallery_app.dart';
import 'package:minitutorials/sort_listview_alphabetically/sort_listview_alphabetically.dart';
import 'package:minitutorials/spacer_widget/spacer_widget.dart';
import 'package:minitutorials/stepper_widget/stepper_widget.dart';
import 'package:minitutorials/validate_forms/validate_forms.dart';
import 'package:minitutorials/wrap_widget/wrap_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WillPopScopeMy/will_pop_scope_page1.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'expanded_widget/expanded_widget.dart';
import 'fittedbox_widget/fittedbox_widget.dart';
import 'flexible_widget/flexible_widget.dart';
import 'loading_spinners/loading_spinners.dart';
import 'page_view/page_view.dart';
import 'pass_data_back_to_previous_screen/pass_data_back_to_previous_screen.dart';
import 'pick_date_and_time/pick_date_and_time.dart';
import 'popup_dialog_widget/popup_dialog_widget.dart';
import 'tabbed_appbar/tabbed_appbar.dart';
import 'tablet_widget/tablet_widget.dart';
import 'time_picker/time_picker.dart';
import 'unique_identifier_generator/unique_identifier_generator.dart';
// https://stackoverflow.com/questions/68972127/fix-all-const-warning-flutter
Future<void> main() async {
  int myCase = 36;

  Widget? myWidget;
  switch (myCase) {
    case -24:
      myWidget = const MaterialApp(
        home: NewMaterial3ColorScheme(),
      );
      break;

    case -23:
      myWidget = const MaterialApp(
        home: MyNavigationDrawer(),
      );
      break;

    case -22:
      myWidget = const MaterialApp(
        home: MyStepperWidget(),
      );
      break;

    case -21:
      myWidget = const MaterialApp(
        home: FixRowOverflowWrapScroll(),
      );
      break;

    case -20:
      myWidget = const MaterialApp(
        home: MyWrapWidget(),
      );
      break;

    case -19:
      myWidget = const MaterialApp(
        home: MyDragAndDrop(),
      );
      break;

    case -18:
      myWidget = const MaterialApp(
        home: NestedListViewsAndColumns(),
      );
      break;

    case -17:
      myWidget = const MaterialApp(
        home: MyMarkDownWidget(),
      );
      break;

    case -16:
      myWidget = const MaterialApp(
        home: MyUniqueIdentifierGenerator(),
      );
      break;

    case -15:
      myWidget = const MaterialApp(
        home: MyFittedBoxWidget(),
      );
      break;

    case -14:
      myWidget = const MaterialApp(
        home: MyFlexibleWidget(),
      );
      break;

    case -13:
      myWidget = const MaterialApp(
        home: MySpacerWidget(),
      );
      break;

    case -12:
      myWidget = const MaterialApp(
        home: MyExpandedWidget(),
      );
      break;

    case -11:
      myWidget = const MaterialApp(
        home: MyLoadingSpinners(),
      );
      break;

    case -10:
      //https://stackoverflow.com/questions/67798798/unhandled-exception-null-check-operator-used-on-a-null-value-shared-preference
      WidgetsFlutterBinding.ensureInitialized();
      final prefs = await SharedPreferences.getInstance();
      final bool showHome = prefs.getBool('showHome') ?? false;
       myWidget =  MaterialApp(
        home: showHome ? HomePage() : MyOnBoardingScreenUI(),
      );
      break;

    case -9:
      myWidget = const MaterialApp(
        home: MyPageView(),
      );
      break;

    case -8:
      myWidget = const MaterialApp(
        home: MyExpansionPanel(),
      );
      break;

    case -7:
      //Ukrainian
      timeago.setLocaleMessages('uk', timeago.UkMessages());
      timeago.setLocaleMessages('uk_short', timeago.UkShortMessages());

      //Deutsch
      timeago.setLocaleMessages('de', timeago.DeMessages());
      timeago.setLocaleMessages('de_short', timeago.DeShortMessages());
      myWidget = const MaterialApp(
        home: MyFormatDateTimeTimeAgoLocales(),
      );
      break;

    case -6:
      myWidget = const MaterialApp(
        home: MySearchAndFilterListView(),
      );
      break;

    case -5:
      //see pubspec.yaml and MyNativeSplashScreen for comments
      WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.removeAfter((context) async {
        await Future.delayed(const Duration(seconds: 5));
      });
      myWidget = const MaterialApp(
        home: MyNativeSplashScreen(),
      );
      break;

    case -4:
      myWidget = const MaterialApp(
        home: IntrinsicHeightAndWidthWidgets(),
      );
      break;

    case -3:
      myWidget = const MaterialApp(
        home: SearchBarFieldInAppBar(),
      );
      break;

    case -2:
      myWidget = const MaterialApp(
        home: ValidateForms(),
      );
      break;

    case -1:
      myWidget = const MaterialApp(
        home: DropDownMenuItemList(),
      );
      break;

    case 0:
      myWidget = const MaterialApp(
        home: WillPopScopePage1(),
      );
      break;

    case 1:
      myWidget = const MaterialApp(
        home: GestureDetectorAndIncWell(),
      );
      break;

    case 2:
      myWidget = const MaterialApp(
        home: MyCheckBoxListTile(),
      );
      break;

    case 3:
      myWidget = const MaterialApp(
        home: MyTabbedAppBar(),
      );
      break;

    case 4:
      myWidget = const MaterialApp(
        home: MyBottomSheet(),
      );
      break;

    case 5:
      myWidget = const MaterialApp(
        home: MyNavigationBar(),
      );
      break;

    case 6:
      myWidget = const MaterialApp(
        home: MyExpansionTileAndListTile(),
      );
      break;

    case 7:
      myWidget = const MaterialApp(
        home: MyPopUpDialogWidget(),
      );
      break;

    case 8:
      myWidget = const MaterialApp(
        home: MyTableWidget(),
      );
      break;

    case 9:
      myWidget = const MaterialApp(
        home: MyHeroWidget(),
      );
      break;

    case 10:
      myWidget = const MaterialApp(
        home: MyDateRangePicker(),
      );
      break;

    case 11:
      myWidget = const MaterialApp(
        home: MyPickDateAndTime(),
      );
      break;

    case 12:
      myWidget = const MaterialApp(
        home: MyTimePicker(),
      );
      break;

    case 13:
      myWidget = const MaterialApp(
        home: MyDatePicker(),
      );
      break;

    case 14:
      myWidget = const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyAppBarTransparent(),
      );
      break;

    case 15:
      myWidget = const MaterialApp(
        home: MyAddPackages(),
      );
      break;

    case 16:
      myWidget = const MaterialApp(
        home: PassDataFirstScreen(),
      );
      break;

    case 17:
      myWidget = const MaterialApp(
        home: MyPreserveScrollPosition(),
      );
      break;

    case 18:
      myWidget = const MaterialApp(
        home: HowToAddFavicon(),
      );
      break;

    case 19:
      myWidget = const MaterialApp(
        home: HowToFixBottomOverflowed(),
      );
      break;

    case 20:
      myWidget = const MaterialApp(
        home: HowAutocompleteTextField(),
      );
      break;

    case 21:
      myWidget = const MaterialApp(
        home: MultiLanguageApp(),
      );
      break;

    case 22:
      myWidget = const MaterialApp(
        home: MyNullSafety(),
      );
      break;

    case 23:
      myWidget = const MaterialApp(
        home: HowToScreenMirrorPhone(),
      );
      break;

    case 24:
      myWidget = const MaterialApp(
        home: HowToCallSetStateInPopUpAlertDialog(),
      );
      break;

    case 25:
      myWidget = const MaterialApp(
        home: CreatePopUpDialogWithTextField(),
      );
      break;

    case 26:
      myWidget = const MaterialApp(
        home: HowToSortListViewAlphabetically(),
      );
      break;

    case 27:
      myWidget = const MaterialApp(
        home: ListViewVCGridView(),
      );
      break;

    case 28:
      myWidget = const MaterialApp(
        home: AnimatedCircularFABMenu(),
      );
      break;

    case 29:
      myWidget = const MaterialApp(
        home: HowToUseFlowWidget(),
      );
      break;

    case 30:
      myWidget = const MaterialApp(
        home: SimplePhotoGalleryApp(),
      );
      break;

    case 31:
      myWidget = const MaterialApp(
        home: MyPageRouteTransition(),
      );
      break;

    case 32:
      myWidget = const MaterialApp(
        home: ButtonWithImageAndText(),
      );
      break;

    case 33:
      myWidget = const MaterialApp(
        home: ExpandCollapseWidget(),
      );
      break;

    case 34:
      myWidget = const MaterialApp(
        home: MaskAnyImage(),
      );
      break;

    case 35:
      myWidget = const MaterialApp(
        home: MaskTextWithImage(),
      );
      break;

    case 36:
      myWidget = const MaterialApp(
        home: EnableDisableButton(),
      );
      break;
  }
  runApp(myWidget!);
}

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App)')),
      body: Container(),
    );
  }
}