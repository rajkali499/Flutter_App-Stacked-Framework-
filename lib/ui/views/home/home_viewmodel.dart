import 'package:flutter/cupertino.dart';
import 'package:my_test_stacked/app/app.bottomsheets.dart';
import 'package:my_test_stacked/app/app.dialogs.dart';
import 'package:my_test_stacked/app/app.locator.dart';
import 'package:my_test_stacked/app/app.logger.dart';
import 'package:my_test_stacked/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _logger = getLogger("HomeViewModel");

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    _logger.i("msg");
    _logger.e("msg");
    _logger.w("msg");
    _logger.wtf("msg");
    _logger.d("msg");
    rebuildUi();
  }

  Future<void> showDialog() async {
  var res = await _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  debugPrint(res?.confirmed.toString());
  debugPrint(res?.data.toString());
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
