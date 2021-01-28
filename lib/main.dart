import 'package:flutter/material.dart';
import 'package:search_engine_git/components/search_page.dart';

void main() => runApp(SearchEngineApp());

class SearchEngineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: {
        "searchPage": (context) => SearchPage(),
      },
    );
  }
}

_openSearchPage(BuildContext context) {
  return Navigator.pushNamed(context, "searchPage");
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Search Engine"),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.10,
                    width: double.infinity,
                  ),
                  Container(
                    margin: EdgeInsets.all(constraints.maxHeight * 0.05),
                    child: Card(
                      elevation: 5,
                      color: Colors.blue[400],
                      child: Container(
                        padding: EdgeInsets.all(constraints.maxHeight * 0.05),
                        height: constraints.maxHeight * 0.30,
                        child: Center(
                          child: Text(
                            "Git Search Engine",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.10,
                    width: double.infinity,
                  ),
                  ElevatedButton(
                    onPressed: () => _openSearchPage(context),
                    child: Text(
                      "Click me",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
