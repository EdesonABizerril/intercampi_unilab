import 'package:share_extend/share_extend.dart';

Future<void> sharedTextData({required String title, required String content}) async {
  await ShareExtend.share(
    sharePanelTitle: title,
    content,
    "text",
  );
}
