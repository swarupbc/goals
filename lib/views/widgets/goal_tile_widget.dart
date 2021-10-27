import 'package:flutter/material.dart';
import 'package:goals/models/goal_model.dart';
import 'package:goals/views/utils/app_styles.dart';

class GoalTileWidget extends StatelessWidget {
  final GoalModel goal;

  final double _progress = 0.5;

  const GoalTileWidget({Key? key, required this.goal}) : super(key: key);

  void choiceAction(String choice) {
    if (choice == Choice.complete) {
      debugPrint('Complete');
    } else if (choice == Choice.delete) {
      debugPrint('Delete');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: () {},
        title: Text(
          goal.title,
          style: AppStyles.whiteTitleStyle,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(goal.desc ?? ""),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      right: 20.0,
                    ),
                    child: LinearProgressIndicator(
                      value: _progress,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                      minHeight: 5.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text("${(_progress * 100).toInt()}% Done"),
                ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: choiceAction,
          itemBuilder: (BuildContext context) {
            return Choice.choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
        tileColor: AppStyles.goalBackgroundColor,
        horizontalTitleGap: 10.0,
        minVerticalPadding: 20.0,
      ),
    );
  }
}

class Choice {
  static const String complete = 'Complete';
  static const String delete = 'Delete';

  static const List<String> choices = <String>[complete, delete];
}
