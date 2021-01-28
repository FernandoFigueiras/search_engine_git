import 'package:flutter/material.dart';
import 'package:search_engine_git/models/git_request.dart';

class DetailPage extends StatefulWidget {
  final GitRequest request;
  DetailPage(this.request);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Detail Page"),
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
                    // margin: EdgeInsets.all(constraints.maxHeight * 0.03),
                    child: Card(
                      elevation: 5,
                      color: Colors.blue[400],
                      child: Container(
                        padding: EdgeInsets.all(constraints.maxHeight * 0.05),
                        // height: constraints.maxHeight * 0.30,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                child: Image.network(widget.request.avatarUrl),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "Name: ",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget.request.login,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "Created at: ",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget.request.createdAt,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "Followers: ",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget.request.followers.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "Following: ",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget.request.following.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
