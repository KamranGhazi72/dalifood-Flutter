import 'package:dali_food/screens/comment-screen/widget/comment_body.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF535353),
        title: Text(
          'ثبت نظر',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: CommentBody(),
    );
  }
}
