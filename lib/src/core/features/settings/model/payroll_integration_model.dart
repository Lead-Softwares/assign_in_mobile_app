class PayrollIntegrationModel {
  final String title;
  final String subTitle;
  final String timeLimit;
  final bool? selectedValue;

  PayrollIntegrationModel({
    required this.title,
    required this.subTitle,
    required this.timeLimit,
    this.selectedValue,
  });
  static List<PayrollIntegrationModel> payrollvalues = [
    PayrollIntegrationModel(
      title: 'Monthly',
      subTitle: 'Once per month',
      timeLimit: '12 time/year',
      selectedValue: false,
    ),
    PayrollIntegrationModel(
      title: 'Bi-weekly',
      subTitle: 'Twice per month',
      timeLimit: '26 time/year',
      selectedValue: true,
    ),
    PayrollIntegrationModel(
      title: 'Weekly',
      subTitle: 'Per weekly',
      timeLimit: '56 time/year',
      selectedValue: false,
    ),
  ];
}

class CutOffDateModel {
  final String title;
  final String subTitle;
  final String timeLimit;
  final bool? selectedValue;
  CutOffDateModel({
    required this.title,
    required this.subTitle,
    required this.timeLimit,
    this.selectedValue,
  });
  static List<CutOffDateModel> cutoffDateValues = [
    CutOffDateModel(
      title: 'Input',
      subTitle: 'Manual Date Entry',
      timeLimit: 'Custom',
      selectedValue: false,
    ),
    CutOffDateModel(
      title: 'Date Picker',
      subTitle: 'choose specific dates',
      timeLimit: 'Flexible',
      selectedValue: true,
    ),
    CutOffDateModel(
      title: 'Out of each month',
      subTitle: 'Last day of month',
      timeLimit: 'Automatic',
      selectedValue: false,
    ),
  ];
}
