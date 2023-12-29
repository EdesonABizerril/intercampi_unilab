import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../../data/models/models.dart';
import '../../theme/theme.dart';

class AppTimeDashboard extends StatelessWidget {
  const AppTimeDashboard({
    super.key,
    required this.leftName,
    required this.rightName,
    required this.times,
  });

  final String leftName;
  final String rightName;
  final ({TimeModel before, TimeModel next, TimeModel after}) times;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.backgroundColorCard,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Saída: ",
                  children: [
                    TextSpan(
                      text: leftName,
                      style: AppStyle.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Destino: ",
                  children: [
                    TextSpan(
                      text: rightName,
                      style: AppStyle.body.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 14),
            child: Divider(height: 1, color: Colors.grey),
          ),
          SizedBox(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Anterior",
                      style: AppStyle.body.copyWith(
                        fontSize: 12.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${times.before.hour}:${times.before.minute}",
                      style: AppStyle.body.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Próximo",
                      style: AppStyle.body.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "${times.next.hour}:${times.next.minute}",
                      style: AppStyle.body.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 13,
                          color: AppColors.fontPrimary,
                        ),
                        Text(
                          " ${times.next.toAgoString()}",
                          style: AppStyle.body.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Seguinte",
                      style: AppStyle.body.copyWith(
                        fontSize: 12.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${times.after.hour}:${times.after.minute}",
                      style: AppStyle.body.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
