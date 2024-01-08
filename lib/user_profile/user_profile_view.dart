import 'package:flutter/material.dart';
import 'package:nakama_shoes/data/dummy_data.dart';
import 'package:nakama_shoes/models/models.dart';
import 'package:nakama_shoes/theme/custom_app_theme.dart';
import 'package:nakama_shoes/user_profile/components/app_bar.dart';
import 'package:nakama_shoes/user_profile/components/rounded_list_tile.dart';
import 'package:nakama_shoes/utils/constants.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  int statusCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const UserViewAppBar(),
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: Column(
              children: [
                _topUserInfo(width),
                SizedBox(
                  height: height * 0.01,
                ),
                _userStatusListView(width, height),
                SizedBox(
                  height: height * 0.01,
                ),
                _roundedLists(width, height),
                _bottomSideTexts(width, height)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomSideTexts(double width, double height) {
    return SizedBox(
      width: width,
      height: height / 6.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Account",
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 18),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            "Switch to Other Account",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blue[600],
                fontSize: 20),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Text(
            "Log Out",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.red[500],
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _roundedLists(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dashboard",
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 19),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          RoundedListTile(
            icon: Icons.wallet_travel_outlined,
            tittle: "Payments",
            leadingBackColor: Colors.green[600],
            trailing: Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "5 New",
                    style: TextStyle(
                        color: AppConstantsColor.lightTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppConstantsColor.lightTextColor,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
          RoundedListTile(
            icon: Icons.archive,
            tittle: "Achievement's",
            leadingBackColor: Colors.yellow[600],
            trailing: Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppConstantsColor.darkTextColor,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
          RoundedListTile(
            icon: Icons.shield,
            tittle: "Privacy",
            leadingBackColor: Colors.grey[600],
            trailing: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red[500],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Action needs",
                    style: TextStyle(
                        color: AppConstantsColor.lightTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppConstantsColor.darkTextColor,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userStatusListView(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Status",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          SizedBox(
            width: width,
            height: height * 0.08,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: userStatus.length,
              itemBuilder: (context, index) {
                UserStatus status = userStatus[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      statusCurrentIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 120,
                    decoration: BoxDecoration(
                      color: statusCurrentIndex == index
                          ? status.selectColor
                          : status.unSelectColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          status.emoji,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          status.txt,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppConstantsColor.lightTextColor,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _topUserInfo(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
              "https://i.pinimg.com/originals/46/58/21/465821f745c536b3537228ff9f73d121.jpg"),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Angga Afriliansyah", style: AppTheme.profileDevName),
            SizedBox(height: 2),
            Text(
              "Mahasiswa  UMDP",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            )
          ],
        ),
        SizedBox(
          width: width * 0.01,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit_outlined,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
