// ignore_for_file: constant_identifier_names, unreachable_switch_case

class IconBottomNavEnum {
  String getBottomNavIconAddress(IconTypeEnum iconTypeEnum) {
    return switch(iconTypeEnum) {
      IconTypeEnum.IC_ACTIVE_HOME => "images/ic_active_home.png",
      IconTypeEnum.IC_INACTIVE_HOME => "images/ic_inactive_home.png",
      IconTypeEnum.IC_ACTIVE_DISCOVER => "images/ic_active_discover.png",
      IconTypeEnum.IC_INACTIVE_DISCOVER => "images/ic_inactive_discover.png",
      IconTypeEnum.IC_ACTIVE_SEARCH => "images/ic_active_search.png",
      IconTypeEnum.IC_INACTIVE_SEARCH => "images/ic_inactive_search.png",
      IconTypeEnum.IC_ACTIVE_NOTIFICATIONS => "images/ic_active_notifications.png",
      IconTypeEnum.IC_INACTIVE_NOTIFICATIONS => "images/ic_inactive_notifications.png",
      _ => "images/ic_active_home.png"
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