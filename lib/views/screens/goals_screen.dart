import 'package:flutter/material.dart';
import 'package:goals/controllers/app_controllers.dart';
import 'package:goals/models/goal_model.dart';
import 'package:goals/views/utils/app_styles.dart';
import 'package:goals/views/widgets/goal_tile_widget.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<GoalModel> goals = [];

  _addGoals() {
    GoalModel goal = GoalModel(
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)),
        title: 'Daily Running',
        desc: 'lets go for a run');

    for (var i = 0; i < 30; i++) {
      goals.add(goal);
    }
  }

  @override
  void initState() {
    _addGoals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: AppStyles.backgroundColor,
            padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
            child: Text(
              AppControllers.dateFormat.format(DateTime.now()),
              style: AppStyles.whiteSubHeadingStyle,
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ListView.builder(
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      return GoalTileWidget(
                        goal: goals[index],
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
