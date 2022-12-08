import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

import '../../models/question_paper_model.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;
  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
            child: ColoredBox(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            child: SizedBox(
              height: Get.width * 0.15,
              width: Get.width * 0.15,
              child:CachedNetworkImage(
                imageUrl: model.imageUrl!,
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ), errorWidget: (context, url, error) => Image.asset('assets/images/app_splash_logo.png'),
              ),),
             ),),
            SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title,
                  style: TextStyle(color: UIParameters.isDarkMode(context)?Theme.of(context).textTheme.bodyText1!.color
                  : Theme.of(context).primaryColorLight),),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(model.description),
                  )
                ],
              ),
            )
          ],
        )
      ],)
    );
  }
}
