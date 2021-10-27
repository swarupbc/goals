import 'package:flutter/material.dart';

class GoalModel {
  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final String? desc;
  final TimeOfDay? notifyTime;
  final GoalDayModel? goalDayModel;

  GoalModel({
    required this.startDate,
    required this.endDate,
    required this.title,
    this.desc,
    this.goalDayModel,
    this.notifyTime,
  });
}

class GoalDayModel {
  final DateTime day;
  final bool checked;

  GoalDayModel({required this.day, this.checked = false});
}
