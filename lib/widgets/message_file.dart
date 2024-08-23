import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String Message;
  final String sender;
  final bool sendByme;
  const MessageTile(
      {Key? key,
      required this.Message,
      required this.sender,
      required this.sendByme})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4,bottom: 4,left: widget.sendByme ?0:24,right: widget.sendByme ?24:0),
      alignment: widget.sendByme? Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        margin: widget.sendByme ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17,bottom: 17,left: 20,right: 20),
        decoration: BoxDecoration(
            borderRadius: widget.sendByme
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))
                : BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
            color: widget.sendByme ? Colors.pink : Colors.grey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sender.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: -0.2),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.Message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16,color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
