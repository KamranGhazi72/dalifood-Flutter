import 'package:dali_food/models/comments.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentDesc extends StatefulWidget {
  const CommentDesc({Key? key}) : super(key: key);

  @override
  _CommentDescState createState() => _CommentDescState();
}

class _CommentDescState extends State<CommentDesc> {
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllResturantComments();
  }

  var commentApi = <Comments>[];
  Future<Map> getAllResturantComments() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
        Uri.parse(
            'https://api.dalifood.app/api/User/MyComments?ItemPerPage=7&PageNum=1'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print('response.body Comment:::     ${response.body}');
      var responseBody = json.decode(response.body);

      responseBody['\u0024values'].forEach((item) {
        commentApi.add(Comments.fromJson(item));
      });

      setState(() {
        isLoading = false;
      });
      return {'comments': commentApi};
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load address');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            'نظرات مشتریان',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          isLoading
              ? SizedBox(
                height: MediaQuery.of(context).size.width,
                child: Center(
                    child: CircularProgressIndicator(),
                  ),
              )
              : commentApi.isEmpty
                  ? SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text('کامنت ثبت نشده است'),
                      ),
                  )
                  : Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: commentApi.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: 5, right: 0, bottom: 7, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/personIcon.png'),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 8),
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFEEEEEE),
                                        blurRadius: 3,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        commentApi[index].name! +
                                            ' ' +
                                            commentApi[index].family!,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        commentApi[index].text!,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
