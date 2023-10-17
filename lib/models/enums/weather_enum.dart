// ignore_for_file: constant_identifier_names

class WeatherType {
  WeatherTypeEnum getEnumType(String? weatherType) {
    return switch (weatherType) {
      "Sunny" => WeatherTypeEnum.SUNNY_MORNING,
      "Clear" => WeatherTypeEnum.CLEAR_NIGHT,
      "Partly cloudy" => WeatherTypeEnum.PARTLY_CLOUDY,
      "Cloudy" => WeatherTypeEnum.CLOUDY,
      "Overcast" => WeatherTypeEnum.OVERCAST,
      "Mist" => WeatherTypeEnum.MIST,
      "Patchy rain possible" => WeatherTypeEnum.PATCHY_RAIN_POSSIBLE,
      "Patchy snow possible" => WeatherTypeEnum.PATCHY_SNOW_POSSIBLE,
      "Patchy sleet possible" => WeatherTypeEnum.PATCHY_SLEET_POSSIBLE,
      "Patchy freezing drizzle possible" => WeatherTypeEnum.PATCHY_FREEZING_DRIZZLE_POSSIBLE,
      "Thundery outbreaks possible" => WeatherTypeEnum.THUNDERY_OUTBREAKS_POSSIBLE,
      "Blowing snow" => WeatherTypeEnum.BLOWING_SNOW,
      "Blizzard" => WeatherTypeEnum.BLIZZARD,
      "Fog" => WeatherTypeEnum.FOG,
      "Freezing fog" => WeatherTypeEnum.FREEZING_FOG,
      "Patchy light drizzle" => WeatherTypeEnum.PATCHY_LIGHT_DRIZZLE,
      "Light drizzle" => WeatherTypeEnum.LIGHT_DRIZZLE,
      "Freezing drizzle" => WeatherTypeEnum.FREEZING_DRIZZLE,
      "Heavy freezing drizzle" => WeatherTypeEnum.HEAVY_FREEZING_DRIZZLE,
      "Patchy light rain" => WeatherTypeEnum.PATCHY_LIGHT_RAIN,
      "Light rain" => WeatherTypeEnum.LIGHT_RAIN,
      "Moderate rain at times" => WeatherTypeEnum.MODERATE_RAIN_AT_TIMES,
      "Moderate rain" => WeatherTypeEnum.MODERATE_RAIN,
      "Heavy rain at times" => WeatherTypeEnum.HEAVY_RAIN_AT_TIMES,
      "Heavy rain" => WeatherTypeEnum.HEAVY_RAIN,
      "Light freezing rain" => WeatherTypeEnum.LIGHT_FREEZING_RAIN,
      "Moderate or heavy freezing rain" => WeatherTypeEnum.MODERATE_OR_HEAVY_FREEZING_RAIN,
      "Light sleet" => WeatherTypeEnum.LIGHT_SLEET,
      "Moderate or heavy sleet" => WeatherTypeEnum.MODERATE_OR_HEAVY_SLEET,
      "Patchy light snow" => WeatherTypeEnum.PATCHY_LIGHT_SNOW,
      "Light snow" => WeatherTypeEnum.LIGHT_SNOW,
      "Patchy moderate snow" => WeatherTypeEnum.PATCHY_MODERATE_SNOW,
      "Moderate snow" => WeatherTypeEnum.MODERATE_SNOW,
      "Patchy heavy snow" => WeatherTypeEnum.PATCHY_HEAVY_SNOW,
      "Heavy snow" => WeatherTypeEnum.HEAVY_SNOW,
      "Ice pellets" => WeatherTypeEnum.ICE_PELLETS,
      "Light rain shower" => WeatherTypeEnum.LIGHT_RAIN_SHOWER,
      "Moderate or heavy rain shower" => WeatherTypeEnum.MODERATE_OR_HEAVY_RAIN_SHOWER,
      "Torrential rain shower" => WeatherTypeEnum.TORRENTIAL_RAIN_SHOWER,
      "Light sleet showers" => WeatherTypeEnum.LIGHT_SLEET_SHOWER,
      "Moderate or heavy sleet showers" => WeatherTypeEnum.MODERATE_OR_HEAVY_SLEET_SHOWERS,
      "Light snow showers" => WeatherTypeEnum.LIGHT_SNOW_SHOWERS,
      "Moderate or heavy snow showers" => WeatherTypeEnum.MODERATE_OR_HEAVY_SNOW_SHOWERS,
      "Light showers of ice pellets" => WeatherTypeEnum.LIGHT_SHOWERS_OF_ICE_PELLETS,
      "Moderate or heavy showers of ice pellets" => WeatherTypeEnum.MODERATE_OR_HEAVY_SHOWERS_OF_ICE_PELLETS,
      "Patchy light rain with thunder" => WeatherTypeEnum.PATCH_LIGHT_RAIN_WITH_THUNDER,
      "Moderate or heavy rain with thunder" => WeatherTypeEnum.MODERATE_OR_HEAVY_RAIN_WITH_THUNDER,
      "Patchy light snow with thunder" => WeatherTypeEnum.PATCH_LIGHT_SNOW_WITH_THUNDER,
      "Moderate or heavy snow with thunder" => WeatherTypeEnum.MODERATE_OR_HEAVY_SNOW_WITH_THUNDER,
      _ => WeatherTypeEnum.PARTLY_CLOUDY
    };
  }

  String getIconAddress(WeatherTypeEnum? weatherEnum) {
    return switch (weatherEnum) {
      WeatherTypeEnum.SUNNY_MORNING => "images/M113.png",
      WeatherTypeEnum.CLEAR_NIGHT => "images/M113.png",
      WeatherTypeEnum.PARTLY_CLOUDY => "images/M116.png",
      WeatherTypeEnum.CLOUDY => "images/M119.png",
      WeatherTypeEnum.OVERCAST => "images/M122.png",
      WeatherTypeEnum.MIST => "images/M143.png",
      WeatherTypeEnum.PATCHY_RAIN_POSSIBLE => "images/M176.png",
      WeatherTypeEnum.PATCHY_SNOW_POSSIBLE => "images/M179.png",
      WeatherTypeEnum.PATCHY_SLEET_POSSIBLE => "images/M182.png",
      WeatherTypeEnum.PATCHY_FREEZING_DRIZZLE_POSSIBLE => "images/M185.png",
      WeatherTypeEnum.THUNDERY_OUTBREAKS_POSSIBLE => "images/M200.png",
      WeatherTypeEnum.BLOWING_SNOW => "images/M227.png",
      WeatherTypeEnum.BLIZZARD => "images/M230.png",
      WeatherTypeEnum.FOG => "images/M248.png",
      WeatherTypeEnum.FREEZING_FOG => "images/M260.png",
      WeatherTypeEnum.PATCHY_LIGHT_DRIZZLE => "images/M263.png",
      WeatherTypeEnum.LIGHT_DRIZZLE => "images/M266.png",
      WeatherTypeEnum.FREEZING_DRIZZLE => "images/M281.png",
      WeatherTypeEnum.HEAVY_FREEZING_DRIZZLE => "images/M284.png",
      WeatherTypeEnum.PATCHY_LIGHT_RAIN => "images/M293.png",
      WeatherTypeEnum.LIGHT_RAIN => "images/M296.png",
      WeatherTypeEnum.MODERATE_RAIN_AT_TIMES => "images/M299.png",
      WeatherTypeEnum.MODERATE_RAIN => "images/M302.png",
      WeatherTypeEnum.HEAVY_RAIN_AT_TIMES => "images/M305.png",
      WeatherTypeEnum.HEAVY_RAIN => "images/M308.png",
      WeatherTypeEnum.LIGHT_FREEZING_RAIN => "images/M311.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_FREEZING_RAIN => "images/M314.png",
      WeatherTypeEnum.LIGHT_SLEET => "images/M317.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_SLEET => "images/M320.png",
      WeatherTypeEnum.PATCHY_LIGHT_SNOW => "images/M323.png",
      WeatherTypeEnum.LIGHT_SNOW => "images/M326.png",
      WeatherTypeEnum.PATCHY_MODERATE_SNOW => "images/M329.png",
      WeatherTypeEnum.MODERATE_SNOW => "images/M332.png",
      WeatherTypeEnum.PATCHY_HEAVY_SNOW => "images/M335.png",
      WeatherTypeEnum.HEAVY_SNOW => "images/M338.png",
      WeatherTypeEnum.ICE_PELLETS => "images/M350.png",
      WeatherTypeEnum.LIGHT_RAIN_SHOWER => "images/M353.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_RAIN_SHOWER => "images/M113.png",
      WeatherTypeEnum.TORRENTIAL_RAIN_SHOWER => "images/M356.png",
      WeatherTypeEnum.LIGHT_SLEET_SHOWER => "images/M362.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_SLEET_SHOWERS => "images/M365.png",
      WeatherTypeEnum.LIGHT_SNOW_SHOWERS => "images/M368.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_SNOW_SHOWERS => "images/M371.png",
      WeatherTypeEnum.LIGHT_SHOWERS_OF_ICE_PELLETS => "images/M374.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_SHOWERS_OF_ICE_PELLETS => "images/M377.png",
      WeatherTypeEnum.PATCH_LIGHT_RAIN_WITH_THUNDER => "images/M386.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_RAIN_WITH_THUNDER => "images/M389.png",
      WeatherTypeEnum.PATCH_LIGHT_SNOW_WITH_THUNDER => "images/M392.png",
      WeatherTypeEnum.MODERATE_OR_HEAVY_SNOW_WITH_THUNDER => "images/M395.png",
      _ => "images/M113.png"
    };
  }
}

enum WeatherTypeEnum {
  SUNNY_MORNING, //GÜNEŞLİ SABAH
  CLEAR_NIGHT, //GECE TEMİZ
  PARTLY_CLOUDY, //PARÇALI BULUTLU
  CLOUDY, //BULUTLU
  OVERCAST, //Çok bulutlu
  MIST, //SİSLİ
  PATCHY_RAIN_POSSIBLE, // Bölgesel düzensiz yağmur yağışlı
  PATCHY_SNOW_POSSIBLE, // Bölgesel düzensiz kar yağışlı
  PATCHY_SLEET_POSSIBLE, // Bölgesel düzensiz karla karışık yağmurlu
  PATCHY_FREEZING_DRIZZLE_POSSIBLE, // Bölgesel düzensiz donmuş çisenti
  THUNDERY_OUTBREAKS_POSSIBLE, //Bölgesel düzensiz gök gürültülü yağmurlu
  BLOWING_SNOW, // Tipi
  BLIZZARD, // Kar fırtınası
  FOG, // Puslu
  FREEZING_FOG, // Dondurucu sis
  PATCHY_LIGHT_DRIZZLE, //Bölgesel düzensiz hafif çisenti
  LIGHT_DRIZZLE, // Hafif çisenti
  FREEZING_DRIZZLE, // Dondurucu çisenti
  HEAVY_FREEZING_DRIZZLE, // Yoğun dondurucu çisenti
  PATCHY_LIGHT_RAIN, // Düzensiz hafif yağmurlu
  LIGHT_RAIN, // Hafif yağmurlu
  MODERATE_RAIN_AT_TIMES, // Ara ara orta kuvvetli yağmurlu
  MODERATE_RAIN, // Orta kuvvetli yağmurlu
  HEAVY_RAIN_AT_TIMES, // Ara ara şiddetli yağmurlu
  HEAVY_RAIN, // Şiddetli yağmurlu
  LIGHT_FREEZING_RAIN, // Hafif dondurucu yağmurlu
  MODERATE_OR_HEAVY_FREEZING_RAIN, // Orta kuvvetli veya Şiddetli dondurucu yağmurlu
  LIGHT_SLEET, //  Hafif karla karışık yağmur
  MODERATE_OR_HEAVY_SLEET, // Orta kuvvetli veya şiddetli karla karışık yağmur
  PATCHY_LIGHT_SNOW, // Düzensiz hafif karlı
  LIGHT_SNOW, // Hafif karlı
  PATCHY_MODERATE_SNOW, // Düzensiz orta kuvvetli karlı
  MODERATE_SNOW, // Orta kuvvetli karlı
  PATCHY_HEAVY_SNOW, // Düzensiz yoğun kar yağışlı
  HEAVY_SNOW, // Yoğun kar yağışlı
  ICE_PELLETS, // Buz taneleri
  LIGHT_RAIN_SHOWER, // Hafif sağnak yağışlı
  MODERATE_OR_HEAVY_RAIN_SHOWER, // Orta kuvvetli veya yoğun sağnak yağışlı
  TORRENTIAL_RAIN_SHOWER, // Şiddetli sağnak yağmur
  LIGHT_SLEET_SHOWER, // Hafif karla karışık sağnak yağış
  MODERATE_OR_HEAVY_SLEET_SHOWERS, // Orta kuvvetli veya yoğun karla karışık sağnak yağış
  LIGHT_SNOW_SHOWERS, //  Hafif sağnak şeklinde kar
  MODERATE_OR_HEAVY_SNOW_SHOWERS, // Orta kuvvetli veya yoğun ve sağnak şeklinde kar
  LIGHT_SHOWERS_OF_ICE_PELLETS, // Hafif buz taneleri şeklinde sağnak yağış
  MODERATE_OR_HEAVY_SHOWERS_OF_ICE_PELLETS, // Orta kuvvetli veya yoğun buz taneleri sağnak yağışlı
  PATCH_LIGHT_RAIN_WITH_THUNDER, // Bölgesel gök gürültülü düzensiz hafif yağmur
  MODERATE_OR_HEAVY_RAIN_WITH_THUNDER, // Bölgesel gök gürültülü orta kuvvetli veya şiddetli yağış
  PATCH_LIGHT_SNOW_WITH_THUNDER, // Bölgesel gök gürültülü düzensiz hafif kar yağışlı
  MODERATE_OR_HEAVY_SNOW_WITH_THUNDER, // Bölgesel gök gürültülü orta kuvvetli veya yoğun kar yağışlı
}
