import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gnews/AppLocalizations.dart';
import 'package:gnews/main.dart';
import 'package:gnews/network/RestApis.dart';
import 'package:gnews/utils/Colors.dart';
import 'package:gnews/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

class PostCommentDialog extends StatefulWidget {
  final int id;

  PostCommentDialog(this.id);

  @override
  PostCommentDialogState createState() => PostCommentDialogState();
}

class PostCommentDialogState extends State<PostCommentDialog> {
  var commentCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    Future<void> submit() async {
      if (commentCont.text.isEmpty)
        return toast(appLocalization.translate('write_comment'));

      var request = {
        'comment_content': commentCont.text,
        'comment_post_ID': widget.id,
      };

      appStore.setLoading(true);

      await postComment(request).then((value) {
        appStore.setLoading(false);

        finish(context, true);
      }).catchError((e) {
        appStore.setLoading(false);

        toast(e.toString());
      });
    }

    return Observer(
      builder: (_) => Container(
        width: context.width(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appLocalization.translate('post_comment'),
                    style: boldTextStyle()),
                CloseButton(),
              ],
            ),
            AppTextField(
              controller: commentCont,
              textFieldType: TextFieldType.ADDRESS,
              textCapitalization: TextCapitalization.sentences,
              decoration: inputDecoration(context,
                  hint: appLocalization.translate('write_here')),
              maxLines: 4,
              minLines: 4,
              textStyle: primaryTextStyle(),
              autoFocus: true,
            ),
            30.height,
            AppButton(
              width: context.width(),
              onTap: () {
                submit();
              },
              text: appLocalization.translate('post'),
              color: appStore.isDarkMode ? scaffoldSecondaryDark : colorPrimary,
              textStyle: boldTextStyle(color: white),
            ).visible(!appStore.isLoading,
                defaultWidget: Loader().center().visible(appStore.isLoading))
          ],
        ),
      ),
    );
  }
}
