import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

enum MainTabEnum {
  home,
  manage,
}

extension MainTabEnumExt on MainTabEnum {
  String get title {
    switch (this) {
      case MainTabEnum.home:
        return '宿舍';
      case MainTabEnum.manage:
        return '管理';
    }
  }

  Widget get icon {
    switch (this) {
      case MainTabEnum.home:
        return Assets.images.bottomBar.home.image(width: 32, height: 32);
      case MainTabEnum.manage:
        return Assets.images.bottomBar.category.image(width: 32, height: 32);
    }
  }

  Widget get activeIcon {
    switch (this) {
      case MainTabEnum.home:
        return Assets.images.bottomBar.homeSelected
            .image(width: 32, height: 32);
      case MainTabEnum.manage:
        return Assets.images.bottomBar.categorySelected
            .image(width: 32, height: 32);
    }
  }
}
