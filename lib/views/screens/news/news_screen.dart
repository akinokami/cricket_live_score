import 'package:flutter/material.dart';
import 'package:live_score/utils/app_theme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Most Recent News'),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.6,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.redAccent,
                        ),
                        child: Image.network(
                          'https://picsum.photos/250?image=9',
                          // width: MediaQuery.of(context).size.width * 0.5,
                          // height: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Most Recent News'),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int iRndex) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: AppTheme.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [Text('sdfddsfdfffdfsdfds')],
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
