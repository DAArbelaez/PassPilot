import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:passpilot/common/error_page.dart';
import 'package:passpilot/common/loading_page.dart';
import 'package:passpilot/features/check/controller/check_controller.dart';
import 'package:passpilot/features/check/widgets/log_card.dart';
import 'package:passpilot/theme/pallette.dart';

class LogsList extends ConsumerStatefulWidget {
  const LogsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogsListState();
}

class _LogsListState extends ConsumerState<LogsList> {
  void refreshData() {
    ref.refresh(getLogsProvider);
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getLogsProvider).when(
          data: (datas) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: refreshData,
                child: const Icon(
                  Icons.add,
                  color: Pallete.whiteColor,
                  size: 28,
                ),
              ),
              body: ListView.builder(
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int index) {
                  final document = datas[index];
                  final Map<String, dynamic> data = document.data();
                  final DateTime checkInDate = data['checkInDate'].toDate();
                  final DateTime checkOutDate = data['checkOutDate'].toDate();
                  String formattedDateTimeCheckIn =
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(checkInDate);
                  String formattedDateTimeCheckOut =
                      DateFormat('yyyy-MM-dd HH:mm:ss').format(checkOutDate);
                  return LogCard(
                    uid: data['uid'],
                    checkInDate: formattedDateTimeCheckIn,
                    checkOutDate: formattedDateTimeCheckOut,
                  );
                },
              ),
            );
          },
          error: (error, st) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
