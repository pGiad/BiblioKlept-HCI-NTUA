import 'package:flutter/material.dart';

class WriteReviewPage extends StatelessWidget {
  final String username;
  final String bookTitle;

  WriteReviewPage({Key? key, required this.username, required this.bookTitle})
      : super(key: key);

  final _focusScopeNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _focusScopeNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            centerTitle: true,
            title: Text(
              'Review for $username\nand $bookTitle',
              style: const TextStyle(
                  color: Color.fromARGB(255, 112, 4, 80),
                  fontSize: 30,
                  fontFamily: 'Langar-Regular'),
              textAlign: TextAlign.center,
            ),
            automaticallyImplyLeading: false,
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: FocusScope(
                  node: _focusScopeNode,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            'How was your experince with $username trading $bookTitle with you?',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            maxLines: 7,
                            decoration: InputDecoration(
                              hintText: 'Write your review here...',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 112, 4, 80))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                            cursorColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ))),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Submit the review
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 112, 4, 80),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: const Size(160, 60)),
                    child: const Text(
                      'Submit Review',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 112, 4, 80),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: const Size(90, 60)),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
