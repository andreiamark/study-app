import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/widgets/app_icon_text.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../models/question_paper_model.dart';
import 'package:get/get.dart';
import '../../configs/themes/app_icons.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  final QuestionPaperModel model;
  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor
      ),
      child: InkWell(
        onTap: () {
          print('${model.title}');
        },
        child: Padding(
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
                    style: cartTitles(context),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(model.description),
                    ),
                    Row(
                      children: [
                          AppIconText(
                              color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor.withOpacity(0.3),
                              icon: Icon(Icons.help_outline_sharp),
                              text: Text('${model.timeInMinits()} min',
                              style: detailText.copyWith(
                                color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor.withOpacity(0.3),

                              ),)),
                        SizedBox(width: 15,),
                        AppIconText(
                            color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor.withOpacity(0.3),
                            icon: Icon(Icons.help_outline_sharp),
                            text: Text('${model.questions_count} questions',
                              style: detailText.copyWith(
                                color: Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor.withOpacity(0.3),

                              ),))
                      ],
                    ),
                    Positioned(
                      bottom: _padding,
                        right:_padding,
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20 ),
                             child: Icon(AppIcons.trophyOutLine,),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(cardBorderRadius),
                                topLeft: Radius.circular(cardBorderRadius)
                              ),
                              color: Theme.of(context).primaryColor
                            ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          )
        ],)
    ),
      ));
  }
}
