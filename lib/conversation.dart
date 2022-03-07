import 'package:chat_app/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Conversations extends StatelessWidget {
//   @override
//   _ConversationsState createState() => _ConversationsState();
// }

// class _ConversationsState extends State<Conversations> {
  TextEditingController _searchController = new TextEditingController();
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://randomuser.me/api/portraits/men/1.jpg"),
                          fit: BoxFit.cover)),
                ),
                Text(
                  "Chats",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(Icons.edit)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _stories(context),
            SizedBox(
              height: 20,
            ),
            _conversations(context),
          ],
        ),
      )),
    );
  }

  _stories(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          // add story
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                //circular box of your story
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFe9eaec)),
                  child: Center(
                    child: Icon(
                      Icons.video_call,
                      size: 26,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //text of your story
                SizedBox(
                  child: Text(
                    'Your Story',
                    style: TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          //story
          Row(
              children: List.generate(
                  context.watch<ConversationModel>().storyList.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Column(
                children: <Widget>[
                  //story pic, baize and circle
                  Container(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        context.watch<ConversationModel>().storyList[index]
                                ['hasStory']
                            // if has story is true
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.cyanAccent, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(context
                                                .watch<ConversationModel>()
                                                .storyList[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            // if has story is false
                            : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(context
                                            .watch<ConversationModel>()
                                            .storyList[index]['imageUrl']),
                                        fit: BoxFit.cover)),
                              ),
                        context.watch<ConversationModel>().storyList[index]
                                ['isOnline']
                            //baize if user is online
                            ? Positioned(
                                top: 35,
                                left: 35,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF66BB6A),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Color(0xFFFFFFFF), width: 3)),
                                ),
                              )
                            //baize if user is offline
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //story name
                  SizedBox(
                    child: Text(
                      context.watch<ConversationModel>().storyList[index]
                          ['name'],
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          }))
        ],
      ),
    );
  }

  _conversations(BuildContext context) {
    return Column(
      children: List.generate(
          context.watch<ConversationModel>().conversationList.length, (index) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                //conversation pic, baize and circle
                Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: <Widget>[
                      context.watch<ConversationModel>().conversationList[index]
                              ['hasStory']
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.cyanAccent, width: 3)),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(context
                                                  .watch<ConversationModel>()
                                                  .conversationList[index]
                                              ['imageUrl']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            )
                          : Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(context
                                          .watch<ConversationModel>()
                                          .conversationList[index]['imageUrl']),
                                      fit: BoxFit.cover)),
                            ),
                      context.watch<ConversationModel>().conversationList[index]
                              ['isOnline']
                          ? Positioned(
                              top: 38,
                              left: 42,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 3)),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                //name and message column
                InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //name
                      Text(
                        context
                            .watch<ConversationModel>()
                            .conversationList[index]['name'],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // message
                      Row(
                        children: [
                          Text(
                            context
                                .watch<ConversationModel>()
                                .conversationList[index]['message'],
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            context
                                .watch<ConversationModel>()
                                .conversationList[index]['time'],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
