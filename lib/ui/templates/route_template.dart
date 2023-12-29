import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../data/models/models.dart';
import '../../helpers/helpers.dart';
import '../components/components.dart';
import '../theme/theme.dart';

class RouteTemplate extends StatefulWidget {
  const RouteTemplate({
    super.key,
    required this.controller,
  });

  final RouteController controller;

  @override
  State<RouteTemplate> createState() => _RouteTemplateState();
}

class _RouteTemplateState extends State<RouteTemplate> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    widget.controller.getInitialType();
    _configTabController();
  }

  @override
  void dispose() {
    super.dispose();
    _removeTabController();
  }

  void _configTabController() {
    _tabController = TabController(
      length: widget.controller.routes.labels.length,
      vsync: this,
    );
  }

  void _removeTabController() {
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppSimpleAppBar(
        title: 'Intercampi',
        elevation: 2,
        backgroundColor: widget.controller.typeSelected.color,
        bottom: AppTabBar(
          isScrollable: widget.controller.routes.labels.length > 3,
          tabController: _tabController,
          backgroundColor: widget.controller.typeSelected.color,
          tabs: widget.controller.routes.labels.map((label) => Tab(text: label)).toList(),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: List.generate(widget.controller.routes.labels.length, (index) {
            final times = widget.controller.getTimesList(index);
            final listLenght = widget.controller.listLenght(index);
            final fromTimesRange = widget.controller.getFromTimesRange(indexTab: index);
            final returnTimesRange = widget.controller.getReturnTimesRange(indexTab: index);
            return _RouteBody(
              controller: widget.controller,
              tabController: _tabController,
              timeList: (listLenght: listLenght, times: times),
              fromTimesRange: fromTimesRange,
              returnTimesRange: returnTimesRange,
            );
          })),
    );
  }
}

class _RouteBody extends StatefulWidget {
  const _RouteBody({
    required this.controller,
    required this.tabController,
    required this.timeList,
    required this.fromTimesRange,
    required this.returnTimesRange,
  });

  final RouteController controller;
  final TabController tabController;
  final ({int listLenght, ({List<TimeModel> from, List<TimeModel> to}) times}) timeList;
  final ({TimeModel after, TimeModel before, TimeModel next}) fromTimesRange;
  final ({TimeModel after, TimeModel before, TimeModel next}) returnTimesRange;

  @override
  State<_RouteBody> createState() => _RouteBodyState();
}

class _RouteBodyState extends State<_RouteBody> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.controller.routes.labels.isEmpty
        ? Center(
            child: Text(
              'no_data_found'.tr,
              style: AppStyle.body,
            ),
          )
        : ListView.builder(
            itemCount: widget.timeList.listLenght,
            padding: const EdgeInsets.only(top: 14, bottom: 60),
            itemBuilder: (context, index) {
              final timeFrom = widget.timeList.times.from[index];
              final timeTo = widget.timeList.times.to[index];
              return Column(
                children: [
                  if (index == 0)
                    Column(
                      children: [
                        StreamBuilder<void>(
                            stream: Stream.periodic(const Duration(seconds: 1)),
                            builder: (_, __) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8, bottom: 16),
                                child: AppTimeDashboard(
                                  leftName: widget.controller.typeSelected.fromName,
                                  rightName: widget.controller.typeSelected.toName,
                                  times: (
                                    before: widget.fromTimesRange.before,
                                    next: widget.fromTimesRange.next,
                                    after: widget.fromTimesRange.after,
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(height: 8),
                        StreamBuilder<void>(
                            stream: Stream.periodic(const Duration(seconds: 1)),
                            builder: (_, __) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: AppTimeDashboard(
                                  leftName: widget.controller.typeSelected.toName,
                                  rightName: widget.controller.typeSelected.fromName,
                                  times: (
                                    before: widget.returnTimesRange.before,
                                    next: widget.returnTimesRange.next,
                                    after: widget.returnTimesRange.after,
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(height: 16),
                        _TitleList(
                          type: widget.controller.typeSelected,
                        ),
                      ],
                    ),
                  _ItemTimeListTile(time: (from: timeFrom, to: timeTo), index: index),
                ],
              );
            },
          );
  }
}

class _ItemTimeListTile extends StatelessWidget {
  const _ItemTimeListTile({
    required this.time,
    required this.index,
  });

  final ({TimeModel from, TimeModel to}) time;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: index % 2 != 0 ? const Color(0xFFEDEDED) : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text((index + 1).toString()),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${time.from.hour}:${time.from.minute}",
                  style: AppStyle.body.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "|",
                  style: AppStyle.body.copyWith(
                    fontSize: 18,
                    color: AppColors.fontSecondary,
                  ),
                ),
                Text(
                  "${time.to.hour}:${time.to.minute}",
                  style: AppStyle.body.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleList extends StatelessWidget {
  const _TitleList({required this.type});

  final BusLines type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "check_the_departure_times".tr,
              style: AppStyle.body.copyWith(fontSize: 14),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      Text(
                        "${type.fromName}     ",
                        textAlign: TextAlign.center,
                        style: AppStyle.body.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "    ${type.toName}",
                        textAlign: TextAlign.center,
                        style: AppStyle.body.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
