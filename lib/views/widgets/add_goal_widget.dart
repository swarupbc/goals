import 'package:flutter/material.dart';
import 'package:goals/controllers/app_controllers.dart';
import 'package:goals/views/utils/app_styles.dart';
import 'package:goals/views/widgets/decorated_text_field.dart';

class AddGoalWidget extends StatefulWidget {
  const AddGoalWidget({Key? key}) : super(key: key);

  @override
  State<AddGoalWidget> createState() => _AddGoalWidgetState();
}

class _AddGoalWidgetState extends State<AddGoalWidget> {
  DateTime? _startDate;

  DateTime? _endDate;

  TimeOfDay? _notifyTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  'Add a new goal',
                  style: AppStyles.whiteTitleStyle,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.cancel, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            const DecoratedTextField(
              title: 'Goal title',
              autoFocus: true,
            ),
            const DecoratedTextField(
              title: 'Description',
              maxLine: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      DateTime? _date = await showDatePicker(
                          context: context,
                          initialDate:
                              _startDate != null ? _startDate! : DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 9125)));

                      if (_date != null) {
                        setState(() {
                          _startDate = _date;
                        });
                      }
                    },
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.green.shade700,
                    child: Row(
                      children: [
                        const Icon(Icons.today),
                        const SizedBox(width: 5.0),
                        _startDate != null
                            ? Text(AppControllers.getDateText(_startDate!))
                            : const Text('Start Date'),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      DateTime? _date = await showDatePicker(
                          context: context,
                          initialDate: _endDate != null
                              ? _endDate!
                              : DateTime.now().add(const Duration(days: 7)),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 9125)));
                      if (_date != null) {
                        setState(() {
                          _endDate = _date;
                        });
                      }
                    },
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.green.shade700,
                    child: Row(
                      children: [
                        const Icon(Icons.insert_invitation),
                        const SizedBox(width: 5.0),
                        _endDate != null
                            ? Text(AppControllers.getDateText(_endDate!))
                            : const Text('End Date'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Notify everyday?'),
                const SizedBox(width: 50.0),
                MaterialButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    TimeOfDay? _time = await showTimePicker(
                      context: context,
                      initialTime: _notifyTime != null
                          ? _notifyTime!
                          : const TimeOfDay(
                              hour: 12,
                              minute: 00,
                            ),
                      builder: (context, child) {
                        return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: false),
                            child: child!);
                      },
                    );
                    if (_time != null) {
                      setState(() {
                        _notifyTime = _time;
                      });
                    }
                  },
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.green.shade700,
                  child: Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5.0),
                      _notifyTime != null
                          ? Text(AppControllers.getTimeText(_notifyTime!))
                          : const Text('Time'),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
              child: Text(
                'Make a promise to complete your goal anyhow',
                textAlign: TextAlign.center,
                style: AppStyles.greySmallTextStyle,
              ),
            ),
            FittedBox(
              child: MaterialButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 30.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.purple,
                child: const Text(
                  'Save',
                  style: AppStyles.whiteSubHeadingStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
