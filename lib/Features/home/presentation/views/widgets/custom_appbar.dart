import 'package:bookly/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,bottom: 20),
      child: Row(
        children: [
            Image.asset(AssetsData.logo,height: 20,),
            const Spacer(),
            IconButton(onPressed: (){
               GoRouter.of(context).push(AppRouter.kSearchView);
            }, icon: Icon(FontAwesomeIcons.magnifyingGlass,size: 28,))
        ],
      ),
    );
  }
}
