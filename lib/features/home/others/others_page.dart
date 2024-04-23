import 'package:flutter/material.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';
import 'package:sidequest/features/home/others/view/adventurer_badge.dart';
import 'package:sidequest/features/home/others/view/app_settings.dart';
import 'package:sidequest/features/home/others/view/footer.dart';
import 'package:sidequest/features/home/others/view/other_links.dart';
import 'package:sidequest/features/home/others/widgets/others_appbar.dart';

class OthersPage extends StatelessWidget {
  const OthersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BrandScaffold(
      appBar: OthersPageAppBar(),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            AdventurerBadge(),
            SizedBox(height: 25),
            AppSettingsCard(),
            SizedBox(height: 25),
            OtherLinks(),
            SizedBox(height: 25),
            OthersPageFooter(),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
