class CityLocation {
  final String name;
  final double latitude;
  final double longitude;

  CityLocation(this.name, this.latitude, this.longitude);
}

final List<CityLocation> cityLocations = [
  CityLocation('Madrid', 40.4168, -3.7038),
  CityLocation('Barcelona', 41.3851, 2.1734),
  CityLocation('Valencia', 39.4699, -0.3763),
  CityLocation('Sevilla', 37.3886, -5.9823),
  CityLocation('Zaragoza', 41.6488, -0.8891),
  CityLocation('Bilbao', 43.2630, -2.9350),
];
