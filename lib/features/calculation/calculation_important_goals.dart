import 'package:flutter/material.dart';
import 'package:platy/features/calculation/calculation_global.dart';
import 'package:platy/features/calculation/calculation_mental_health.dart';
import 'package:platy/features/calculation/calculation_skin_beauty.dart';
import 'package:platy/features/calculation/calculation_weight_loss.dart';
import 'package:platy/features/calculation/multi_list_tile.dart';
import 'package:platy/features/calculation/theme.dart';

class CalculateImportantGoalsWidget extends StatefulWidget {
  const CalculateImportantGoalsWidget({Key? key}) : super(key: key);

  @override
  _CalculateImportantGoalsWidgetState createState() =>
      _CalculateImportantGoalsWidgetState();
}

class _CalculateImportantGoalsWidgetState
    extends State<CalculateImportantGoalsWidget> {
  List<String> titles = [
    "Adapt to Changes",
    "Weight Management",
    'Mood Stability',
    'Hot Flash Management',
    "Cognitive Function",
    'Muscle Mass Preservation',
    'Skin and Hair Health',
  ];
  Map<String, List<String>> _selectedOptions = {};
  List<bool> _isCheckedList = [];
  List<String?> subtitles = [null, null, null];
  List<String> choosedTitles = [];

  @override
  void initState() {
    super.initState();
    _isCheckedList = List.generate(titles.length, (index) => false);
  }

  void pushToSecondaryPages() async {
    if (_isCheckedList[1] == true &&
        CalculateGlobalWidget.of(context).userModelBuilder.weight_loss_goal ==
            null) {
      CalculateGlobalWidget.of(context).userModelBuilder.weight_loss_goal =
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CalculateWeightLossWidget()));
      setState(() {
        if (CalculateGlobalWidget.of(context)
                .userModelBuilder
                .weight_loss_goal !=
            null) {
          subtitles[0] = CalculateGlobalWidget.of(context)
              .userModelBuilder
              .weight_loss_goal
              .toString();
        }
      });
    }
    if (mounted &&
        _isCheckedList[4] &&
        CalculateGlobalWidget.of(context)
                .userModelBuilder
                .mental_health_goals ==
            null) {
      CalculateGlobalWidget.of(context).userModelBuilder.mental_health_goals =
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CalculateMentalHealthWidget()));
      setState(() {
        if (CalculateGlobalWidget.of(context)
                .userModelBuilder
                .mental_health_goals !=
            null) {
          subtitles[1] = CalculateGlobalWidget.of(context)
              .userModelBuilder
              .mental_health_goals![0]
              .toString();
        }
      });
    }
    if (mounted &&
        _isCheckedList[6] &&
        CalculateGlobalWidget.of(context).userModelBuilder.beauty_goals ==
            null) {
      CalculateGlobalWidget.of(context).userModelBuilder.beauty_goals =
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CalculateSkinAndBeautyWidget()));
      setState(() {
        if (CalculateGlobalWidget.of(context).userModelBuilder.beauty_goals !=
            null) {
          subtitles[2] = CalculateGlobalWidget.of(context)
              .userModelBuilder
              .beauty_goals![0]
              .toString();
        }
      });
    }
  }

  void isActive() {
    if (_selectedOptions['current_goals']!.isNotEmpty) {
      CalculateGlobalWidget.of(context).setButtonActivity(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What is the most \nimportant goal for you now',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 15),
          Text(
            'You can choose more than one',
            textAlign: TextAlign.center,
            style: whiteTheme.textTheme.bodySmall,
          ),
          const SizedBox(height: 25),
          MultiListTile(
            title: titles[0],
            isChecked: _isCheckedList[0],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[0]);
                _isCheckedList[0] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          MultiListTile(
            title: titles[1],
            isChecked: _isCheckedList[1],
            subTitle: _isCheckedList[1] ? subtitles[0] : null,
            buttonActive: subtitles[0]?.isNotEmpty,
            onPressed: () async {
              int? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculateWeightLossWidget()));
              if (result != null) {
                CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .weight_loss_goal = result;
              }
              setState(() {
                subtitles[0] = CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .weight_loss_goal
                    .toString();
              });
            },
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[1]);
                _isCheckedList[1] = isChecked;
                if (_isCheckedList[1]) {
                  pushToSecondaryPages();
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(true));
                } else {
                  subtitles[0] = null;
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .weight_loss_goal = null;
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(false));
                }
              });
            },
          ),
          MultiListTile(
            title: titles[2],
            isChecked: _isCheckedList[2],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[2]);
                _isCheckedList[2] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          MultiListTile(
            title: titles[3],
            isChecked: _isCheckedList[3],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[3]);
                _isCheckedList[3] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          //4
          MultiListTile(
            title: titles[4],
            isChecked: _isCheckedList[4],
            subTitle: _isCheckedList[4] ? subtitles[1] : null,
            buttonActive: subtitles[1]?.isNotEmpty,
            onPressed: () async {
              List<String>? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CalculateMentalHealthWidget()));
              if (result != null) {
                CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .mental_health_goals = result;
              }
              setState(() {
                subtitles[1] = CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .mental_health_goals?[0]
                    .toString();
              });
            },
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[4]);
                _isCheckedList[4] = isChecked;
                if (_isCheckedList[4]) {
                  pushToSecondaryPages();
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(true));
                } else {
                  subtitles[1] = null;
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .weight_loss_goal = null;
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(false));
                }
              });
            },
          ),
          MultiListTile(
            title: titles[5],
            isChecked: _isCheckedList[5],
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[5]);
                _isCheckedList[5] = isChecked;
                CalculateGlobalWidget.of(context)
                    .setButtonActivity(_isCheckedList.contains(true));
              });
            },
          ),
          MultiListTile(
            title: titles[6],
            isChecked: _isCheckedList[6],
            subTitle: _isCheckedList[6] ? subtitles[2] : null,
            buttonActive: subtitles[2]?.isNotEmpty,
            onPressed: () async {
              List<String>? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CalculateSkinAndBeautyWidget()));
              if (result != null) {
                CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .beauty_goals = result;
              }
              setState(() {
                subtitles[2] = CalculateGlobalWidget.of(context)
                    .userModelBuilder
                    .beauty_goals?[0]
                    .toString();
              });
            },
            onTilePressed: (isChecked) {
              setState(() {
                choosedTitles.add(titles[6]);
                _isCheckedList[6] = isChecked;
                if (_isCheckedList[6]) {
                  pushToSecondaryPages();
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(true));
                } else {
                  subtitles[2] = null;
                  CalculateGlobalWidget.of(context)
                      .userModelBuilder
                      .weight_loss_goal = null;
                  CalculateGlobalWidget.of(context)
                      .setButtonActivity(_isCheckedList.contains(false));
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
