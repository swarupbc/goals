class GoalModel {
  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final String? desc;

  GoalModel(
      {required this.startDate,
      required this.endDate,
      required this.title,
      this.desc});
}
