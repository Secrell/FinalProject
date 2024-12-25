import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wmp_final_app/profile_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())); // Profile page
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          openDrawer(context);
        },
      ),
    );
  }

  void openDrawer(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "BlurredDialog",
      transitionDuration: Duration(milliseconds: 190),
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            // Static blur background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.white.withOpacity(0.58),
                ),
              ),
            ),

            // The Page
            Align(
              alignment: Alignment.centerLeft,

              // Page as Animation
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0), // left
                  end: const Offset(0, 0), // end in center
                ).animate(CurvedAnimation(
                  parent: anim1,
                  curve: Curves.easeOut, // Smooth animation curve
                )),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.82,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
