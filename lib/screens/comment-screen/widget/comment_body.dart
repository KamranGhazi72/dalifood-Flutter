import 'package:dali_food/screens/comment-screen/widget/rateBar.dart';
import 'package:flutter/material.dart';

class CommentBody extends StatefulWidget {
  const CommentBody({Key? key}) : super(key: key);

  @override
  _CommentBodyState createState() => _CommentBodyState();
}

class _CommentBodyState extends State<CommentBody> {
  @override
  Widget build(BuildContext context) {
    String? _val;
    double rate = 0.0;

    onRatingUpdate(rating) {
      rate = rating;
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              height: MediaQuery.of(context).size.width * 0.45,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage('assets/images/kabab2.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'کترینگ ترنج',
              style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'خوراک جوجه کباب ممتاز',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35),
            RateBar(onRatingUpdate: onRatingUpdate),
            SizedBox(height: 35),
            Column(
              children: [
                Text('نظر خود را در اینجا ثبت کنید:'),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Color(0xFF999999)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      maxLines: null,
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'ثبت نظر',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                        print(_val);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFe91e63),
                    ),
                    onPressed: () {
                      print('Comment::: $rate   &&&   $_val');
                    },
                    child: Text('ثبت نظر'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
