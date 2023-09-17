import 'package:flutter/material.dart';
import 'package:news_application_mvc/view/detail_view.dart';

class NewsContainer extends StatelessWidget {

  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsContainer({super.key, 
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
    required this.newsCnt
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage(
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: AssetImage("assets/img/breaking_news_Image.jpeg"), image: NetworkImage(imgUrl)
          ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
            SizedBox(height: 30),
            Text(
              newsHead.length > 90 ? "${newsHead.substring(0, 90)}..." : newsHead,
              style: TextStyle(fontSize: 23, fontWeight:  FontWeight.bold)),
            SizedBox(height: 30),
            Text(newsDes, 
              style: TextStyle(fontSize: 10, color: Colors.black38)),
            SizedBox(height: 30),
            Text(
              
              newsCnt.length > 250 ? newsCnt.substring(0, 250) :
              "${newsCnt.toString().substring(0, newsCnt.length - 15)}...",
              style: TextStyle(fontSize: 16)), 
          ]),
        ),

        
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailViewScreen(newsUrl: newsUrl)));
              }, 
              child: Text("Read More")),
            ),
          ],
        ),
        SizedBox(height: 20)
      ]),
    );;
}
}