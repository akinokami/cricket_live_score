import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:live_score/utils/app_theme.dart';
import 'package:live_score/views/widgets/custom_text.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        title: const CustomText(
          text: 'News Detail',
          size: 16,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://picsum.photos/250?image=9',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text:
                  'Ther sdfjklsfjdsfk klsdjfklsf klsdfj kl  skljf lksdfkj  lkjsdfl akls;f jsdf jsdlfk jsdf sdf sdf sdf s sdf  sdf sfd sfd sdf sf ds sf dsffdfdfds  sdf sdfsdf df sdf ',
              maxLines: 15,
            ),
          ],
        ),
      ),
    );
  }
}
