import 'package:byb/config/app_theme.dart';
import 'package:byb/screens/home/tabs/questions_tab/tabs/all_questions.dart';
import 'package:byb/screens/home/tabs/questions_tab/tabs/messages.dart';
import 'package:byb/screens/profile/profile.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/heading_text.dart';

class QuestionsTab extends StatefulWidget {
  const QuestionsTab({super.key});

  @override
  State<QuestionsTab> createState() => _QuestionsTabState();
}

class _QuestionsTabState extends State<QuestionsTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 84.h,
        title: const HeadingText(
          text: 'Questions',
          fontSize: 16,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              push(context, const Profile());
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/dummy/dp.png'),
              radius: 23,
            ),
          ),
          const SizedBox(
            width: 17,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 40,
            child: TabBar(
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.fromLTRB(30, 37, 30, 0),
                indicator: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    color: primaryColor),
                controller: tabController,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: HeadingText(
                      text: 'All Questions',
                      fontSize: 14,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: HeadingText(
                      text: 'Messages',
                      fontSize: 14,
                      weight: FontWeight.w500,
                    ),
                  )
                ]),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: const [AllQuestions(), Messages()])),
        ],
      ),
    );
  }
}
