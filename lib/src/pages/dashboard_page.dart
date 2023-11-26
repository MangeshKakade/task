import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController dashboardController = Get.put(DashboardController());
  final User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              dashboardController.signOut();
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: buildDashboardContent(),
        ),
      ),
    );
  }

  Widget buildDashboardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildUserAvatar(),
        SizedBox(height: 20),
        Text(
          'Welcome,',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          user?.displayName ?? 'Guest',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          user?.email ?? 'N/A',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 30),
        buildUrlTextField(),
        SizedBox(height: 20),
        buildDownloadImageButton(),
        SizedBox(height: 10),
        buildPasteUrlButton(),
        SizedBox(height: 20),
        buildSeparator(),
        SizedBox(height: 20),
        buildImageListView(),
      ],
    );
  }

  Widget buildUserAvatar() {
    return CircleAvatar(
      radius: 60,
      backgroundImage: NetworkImage(user?.photoURL ?? ''),
    );
  }

  Widget buildUrlTextField() {
    return TextField(
      controller: dashboardController.urlController,
      decoration: InputDecoration(
        hintText: 'Paste URL here...',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  Widget buildDownloadImageButton() {
    return ElevatedButton(
      onPressed: dashboardController.downloadImage,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text('Download Image'),
    );
  }

  Widget buildPasteUrlButton() {
    return ElevatedButton(
      onPressed: dashboardController.pasteFromClipboard,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text('Paste URL from Clipboard'),
    );
  }

  Widget buildSeparator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: 100,
          color: Colors.black,
          margin: EdgeInsets.only(right: 10),
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 16.0,
          ),
        ),
        Container(
          height: 2,
          width: 100,
          color: Colors.black,
          margin: EdgeInsets.only(left: 10),
        ),
      ],
    );
  }

  Widget buildImageListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  imageUrl: 'https://www.thewowstyle.com/wp-content/uploads/2015/01/nature-images..jpg',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
