 import 'package:flutter/material.dart';
import 'package:news_application_mvc/controller/fetchNews.dart';
import 'package:news_application_mvc/model/newsArt.dart';
import 'package:news_application_mvc/view/widget/NewContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  bool isLoading = true;


  late NewsArt newsArt;

  GetNews() async{
    newsArt = await FetchNews.fetchNews(); // Calls Future bind method which is persent in the fetchNews.dart file
    setState(() {
      isLoading = false;
    });
  }
  
  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            isLoading = true;
          });
          GetNews();
        },
        itemBuilder: (context, index) {
          return isLoading ? Center(child: CircularProgressIndicator()) : NewsContainer(
            imgUrl: newsArt.imgUrl,
            newsCnt: newsArt.newsCnt,
            newsHead: newsArt.newsHead,
            newsDes: newsArt.newsDes,
            newsUrl: newsArt.newsUrl,

            // imgUrl: "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80", 
            // newsCnt: "5G service is now accessible in several parts of India", 
            // newsHead: "5G service is now accessible in several parts of India",
            // newsDes: "5G service is now accessible in several parts of India. 5G service is now accessible in several parts of India", 
            // newsUrl: "https://teqip.in/when-will-launch-5g-in-india.html#:~:text=5G%20Launch%20In%20India%3A%2D,by%20the%20last%20of%202023."
          );
      }),
    );
  }
}