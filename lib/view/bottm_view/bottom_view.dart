import 'package:ebook/view/bottm_view/ebook_account.dart';
import 'package:ebook/view/bottm_view/ebook_favorite.dart';
import 'package:ebook/view/bottm_view/ebook_library.dart';
import 'package:ebook/view/bottm_view/home.dart';
import 'package:flutter/material.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);


  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {

  int currentIndex = 0;
  List<Widget> items = [
    Home(),
    EbookLibrary(),
    EbookFavorite(),
    EbookAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapPage,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books_rounded),
                label: "library"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                label: "favorite"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "profile"
            ),
          ],
        ),
        body: items[currentIndex],
      ),
    );
  }

  void onTapPage(int index){
    setState(() {
      currentIndex = index;
    });
  }
}
