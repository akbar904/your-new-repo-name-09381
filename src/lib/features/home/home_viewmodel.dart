
import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [];
	
	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		await Future.delayed(Duration(seconds: 1)); // Simulate network delay
		_sp500Metrics = [
			{'symbol': 'AAPL', 'price': 150.00, 'change': 1.5},
			{'symbol': 'GOOGL', 'price': 2800.00, 'change': 2.0},
			{'symbol': 'AMZN', 'price': 3400.00, 'change': -1.0},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'Steve Rocks!',
			description: 'Check out S&P 500 metrics!',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'title',
			description: 'desc',
		);
	}
}
