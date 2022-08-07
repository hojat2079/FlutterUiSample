class OperationModel {
  String name;
  String selectedIcon;
  String unselectedIcon;

  OperationModel(this.name, this.selectedIcon, this.unselectedIcon);
}

List<OperationModel> datas = operationsData
    .map((item) => OperationModel(
        item['name'], item['selectedIcon'], item['unselectedIcon']))
    .toList();

List<Map> operationsData = [
  {
    "name": "Money\nTransfer",
    "selectedIcon": "assets/icon/money_transfer_white.svg",
    "unselectedIcon": "assets/icon/money_transfer_blue.svg"
  },
  {
    "name": "Bank\nWithdraw",
    "selectedIcon": "assets/icon/bank_withdraw_white.svg",
    "unselectedIcon": "assets/icon/bank_withdraw_blue.svg"
  },
  {
    "name": "Insight\nTracking",
    "selectedIcon": "assets/icon/insight_tracking_white.svg",
    "unselectedIcon": "assets/icon/insight_tracking_blue.svg"
  },
];
