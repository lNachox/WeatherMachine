String getWeatherIcon({
  required int weatherCode,
}) {
  String weatherCondition = '01d';

  if (weatherCode == 801) {
    weatherCondition = 'assets/icons/02d.png';
  } else if (weatherCode == 802) {
    weatherCondition = 'assets/icons/03d.png';
  } else if (weatherCode == 803) {
    weatherCondition = 'assets/icons/04d.png';
  } else if (weatherCode == 804) {
    weatherCondition = 'assets/icons/04d.png';
  } else if (weatherCode == 800) {
    weatherCondition = 'assets/icons/01d.png';
  } else if (weatherCode > 700) {
    weatherCondition = 'assets/icons/50d.png';
  } else if (weatherCode >= 600) {
    weatherCondition = 'assets/icons/13d.png';
  } else if (weatherCode >= 500) {
    weatherCondition = 'assets/icons/10d.png';
  } else if (weatherCode >= 300) {
    weatherCondition = 'assets/icons/09d.png';
  } else if (weatherCode >= 200) {
    weatherCondition = 'assets/icons/11d.png';
  }

  return weatherCondition;
}