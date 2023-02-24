import 'package:flutter/material.dart';
import "package:biblioklept/detailsofsavedqrcodes.dart";

class SavedQRCodesPage extends StatelessWidget {
  const SavedQRCodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          leading: const BackButton(
            color: Color.fromARGB(255, 112, 4, 80),
          ),
          centerTitle: true,
          title: const Text(
            "Saved QR Codes",
            style: TextStyle(
                color: Color.fromARGB(255, 112, 4, 80),
                fontSize: 32,
                fontFamily: 'Langar-Regular'),
            textAlign: TextAlign.center,
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QRCodeDetailsPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'UsernameX requested TitleX',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 112, 4, 80)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
