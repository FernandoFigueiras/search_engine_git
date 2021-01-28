import 'package:flutter/material.dart';
import 'package:search_engine_git/components/detail_page.dart';
import 'package:search_engine_git/services/api_service.dart';

import '../models/git_request.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  GitRequest futureGitRequest;
  bool isSearched = false;
  List<GitRequest> listRequests = [];

  _searchOnSubmit(bool newIsSearch) async {
    final name = _controller.text;

    GitRequest gitRequest =
        await ApiService.getGitInfo(name).whenComplete(() => futureGitRequest);
    listRequests.add(gitRequest);

    setState(() {
      isSearched = newIsSearch;
    });
  }

  _goToDetailPage(GitRequest gitRequest) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => DetailPage(gitRequest)));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Search Page"),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: Column(
                children: [
                  // SizedBox(
                  //   height: constraints.maxHeight * 0.10,
                  //   width: double.infinity,
                  // ),
                  Container(
                    // margin: EdgeInsets.all(constraints.maxHeight * 0.03),
                    child: Card(
                      elevation: 5,
                      // color: Colors.blue[400],
                      child: Container(
                        padding: EdgeInsets.all(constraints.maxHeight * 0.05),
                        // height: constraints.maxHeight * 0.30,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[800],
                    ),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () => _searchOnSubmit(true),
                  ),
                  if (isSearched)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      margin: EdgeInsets.only(bottom: 20),
                      child: ListView.builder(
                        itemCount: listRequests.length,
                        itemBuilder: (ctx, index) {
                          final item = listRequests[index];
                          return Card(
                            child: ListTile(
                                leading: Container(
                                  child: Image.network(item.avatarUrl),
                                ),
                                title: Text(item.login),
                                trailing: ElevatedButton(
                                  onPressed: () => _goToDetailPage(item),
                                  child: Icon(Icons.add),
                                )),
                          );
                        },
                      ),
                    )
                ],
              ),
            );
          },
        ));
  }
}
