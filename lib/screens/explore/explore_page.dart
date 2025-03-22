import 'package:apidash_design_system/apidash_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apidash/widgets/widgets.dart';
import 'package:apidash/providers/providers.dart';
import 'package:apidash/utils/utils.dart';
import 'package:apidash/consts.dart';
import '../home_page/collection_pane.dart';
import 'explore_pane.dart';

class ExplorePage extends ConsumerWidget {
  const ExplorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Expanded(
          child: DashboardSplitView(
            sidebarWidget: CollectionPane(),
            mainWidget: ExplorePane(),
          ),
        ),
      ],
    );
  }
}
