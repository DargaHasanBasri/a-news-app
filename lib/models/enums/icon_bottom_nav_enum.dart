// ignore_for_file: constant_identifier_names, unreachable_switch_case

class IconBottomNavEnum {
  String getBottomNavIconAddress(IconTypeEnum iconTypeEnum) {
    return switch(iconTypeEnum) {
      IconTypeEnum.IC_ACTIVE_HOME => "ic_active_home.png",
      IconTypeEnum.IC_INACTIVE_HOME => "ic_inactive_home.png",
      IconTypeEnum.IC_ACTIVE_DISCOVER => "ic_active_discover.png",
      IconTypeEnum.IC_INACTIVE_DISCOVER => "ic_inactive_discover.png",
      IconTypeEnum.IC_ACTIVE_SEARCH => "ic_active_search.png",
      IconTypeEnum.IC_INACTIVE_SEARCH => "ic_inactive_search.png",
      IconTypeEnum.IC_ACTIVE_NOTIFICATIONS => "ic_active_notifications.png",
      IconTypeEnum.IC_INACTIVE_NOTIFICATIONS => "ic_inactive_notifications.png",
      _ =>"ic_active_home.png"
    };
  }

}

enum IconTypeEnum {
  IC_ACTIVE_HOME,
  IC_INACTIVE_HOME,
  IC_ACTIVE_DISCOVER,
  IC_INACTIVE_DISCOVER,
  IC_ACTIVE_SEARCH,
  IC_INACTIVE_SEARCH,
  IC_ACTIVE_NOTIFICATIONS,
  IC_INACTIVE_NOTIFICATIONS,
}