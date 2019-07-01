/*
 * Defines the data object for Country data
 * Data retrieved from:
 * https://restcountries.eu/#api-endpoints-allt
 */

class Country {
  final String name;
  final String capital;
  final String tld;
  final String alpha3;
  final List<String> borders;
  final String region;
  final String subregion;
  final String flag;
  final double area;
  final int population;
  final String demonym;
  final List<double> latlong;
  final List<String> languages;
  final String currency;

  const Country(
      {this.name,
      this.capital,
      this.tld,
      this.alpha3,
      this.borders,
      this.region,
      this.subregion,
      this.flag,
      this.area,
      this.population,
      this.demonym,
      this.latlong,
      this.languages,
      this.currency});
}

final countries = [
  // https://restcountries.eu/rest/v2/alpha/AFG
  new Country(
      name: "Afghanistan",
      capital: "Kabul",
      tld: ".af",
      alpha3: "AFG",
      borders: ["IRN", "PAK", "TKM", "UZB", "TJK", "CHN"],
      region: "Asia",
      subregion: "Southern Asia",
      flag: "https://restcountries.eu/data/afg.svg",
      area: 652230.0,
      population: 27657145,
      demonym: "Afghan",
      latlong: [33.0, 65.0],
      languages: ["Pashto", "Uzbek", "Turkmen"],
      currency: "Afghan afghani"),

  // https://restcountries.eu/rest/v2/alpha/ALB
  new Country(
      name: "Albania",
      capital: "Tirana",
      tld: ".al",
      alpha3: "ALB",
      borders: ["MNE", "GRC", "MKD", "KOS"],
      region: "Europe",
      subregion: "Southern Europe",
      flag: "https://restcountries.eu/data/alb.svg",
      area: 652230.0,
      population: 2886026,
      demonym: "Albanian",
      latlong: [41.0, 20.0],
      languages: ["Albanian"],
      currency: "Albanian lek"),

  // https://restcountries.eu/rest/v2/alpha/USA
  new Country(
      name: "United States of America",
      capital: "Washington, D.C.",
      tld: ".us",
      alpha3: "USA",
      borders: ["CAN", "MEX"],
      region: "Americas",
      subregion: "Northern America",
      flag: "https://restcountries.eu/data/usa.svg",
      area: 9629091.0,
      population: 323947000,
      demonym: "American",
      latlong: [38.0, -97.0],
      languages: ["English"],
      currency: "United States dollar"),

  // https://restcountries.eu/rest/v2/alpha/IND
  new Country(
      name: "India",
      capital: "New Delhi",
      tld: ".in",
      alpha3: "IND",
      borders: ["AFG", "BGD", "BTN", "MMR", "CHN", "NPL", "PAK", "LKA"],
      region: "Asia",
      subregion: "Southern Asia",
      flag: "https://restcountries.eu/data/ind.svg",
      area: 3287590.0,
      population: 1295210000,
      demonym: "Indian",
      latlong: [20.0, 77.0],
      languages: ["Hindi", "English"],
      currency: "Indian rupee"),

  // https://restcountries.eu/rest/v2/alpha/ZMB
  new Country(
      name: "Zambia",
      capital: "Lusaka",
      tld: ".zm",
      alpha3: "ZMB",
      borders: ["AGO", "BWA", "COD", "MWI", "MOZ", "NAM", "TZA", "ZWE"],
      region: "Africa",
      subregion: "Eastern Africa",
      flag: "https://restcountries.eu/data/zmb.svg",
      area: 752612.0,
      population: 15933883,
      demonym: "Zambian",
      latlong: [-15.0, 30.0],
      languages: ["English"],
      currency: "Zambian kwacha"),

  // https://restcountries.eu/rest/v2/alpha/CAN
  new Country(
      name: "Canada",
      capital: "Ottawa",
      tld: ".ca",
      alpha3: "CAN",
      borders: ["USA"],
      region: "Americas",
      subregion: "Northern America",
      flag: "https://restcountries.eu/data/can.svg",
      area: 9984670.0,
      population: 36155487,
      demonym: "Canadian",
      latlong: [60.0, -95.0],
      languages: ["English", "French"],
      currency: "Canadian dollar"),

  // https://restcountries.eu/rest/v2/alpha/GBR
  new Country(
      name: "United Kingdom of Great Britain and Northern Ireland",
      capital: "London",
      tld: ".uk",
      alpha3: "GBR",
      borders: ["IRL"],
      region: "Europe",
      subregion: "Northern Europe",
      flag: "https://restcountries.eu/data/gbr.svg",
      area: 242900.0,
      population: 65110000,
      demonym: "British",
      latlong: [54.0, -2.0],
      languages: ["English"],
      currency: "British pound"),

  // https://restcountries.eu/rest/v2/alpha/FRA
  new Country(
      name: "France",
      capital: "Paris",
      tld: ".fr",
      alpha3: "FRA",
      borders: ["AND", "BEL", "DEU", "ITA", "LUX", "MCO", "ESP", "CHE"],
      region: "Europe",
      subregion: "Western Europe",
      flag: "https://restcountries.eu/data/fra.svg",
      area: 640679.0,
      population: 66710000,
      demonym: "French",
      latlong: [46.0, 2.0],
      languages: ["English"],
      currency: "Euro"),

  // https://restcountries.eu/rest/v2/alpha/BEL
  new Country(
      name: "Belgium",
      capital: "Brussels",
      tld: ".be",
      alpha3: "BEL",
      borders: ["FRA", "DEU", "LUX", "NLD"],
      region: "Europe",
      subregion: "Western Europe",
      flag: "https://restcountries.eu/data/",
      area: 30528.0,
      population: 11319511,
      demonym: "Belgian",
      latlong: [50.83333333, 4.0],
      languages: ["English"],
      currency: "Euro"),

  // https://restcountries.eu/rest/v2/alpha/JPN
  new Country(
      name: "Japan",
      capital: "Tokyo",
      tld: ".jp",
      alpha3: "JPN",
      borders: [],
      region: "Asia",
      subregion: "Eastern Asia",
      flag: "https://restcountries.eu/data/",
      area: 377930.0,
      population: 126960000,
      demonym: "Japanese",
      latlong: [36.0, 138.0],
      languages: ["Japanese"],
      currency: "Japanese yen"),
];
