import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_4/components/weather_item.dart';
import 'package:flutter_application_4/constants.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();
  final Constants _constants = Constants();

  static String apiKey = 'cab677cd401a4df691383702222212';

  String location = 'London'; //default location
  String weatherIcon = 'heavycloud.png';
  String temperature = '30';
  String windSpeed = '0';
  String humidity = '0';
  String cloud = '0';
  String currentDate = 'dd';

  List hourlyWeatherForecast = ['sss'];
  List datelyWeatherForecast = [
    {
      "date": "2022-12-22",
      "date_epoch": 1671667200,
      "day": {
        "maxtemp_c": 10.5,
        "maxtemp_f": 50.9,
        "mintemp_c": 5.8,
        "mintemp_f": 42.4,
        "avgtemp_c": 8.2,
        "avgtemp_f": 46.7,
        "maxwind_mph": 9.2,
        "maxwind_kph": 14.8,
        "totalprecip_mm": 0.5,
        "totalprecip_in": 0.02,
        "totalsnow_cm": 0,
        "avgvis_km": 6.5,
        "avgvis_miles": 4,
        "avghumidity": 93,
        "daily_will_it_rain": 1,
        "daily_chance_of_rain": 89,
        "daily_will_it_snow": 0,
        "daily_chance_of_snow": 0,
        "condition": {
          "text": "Patchy rain possible",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
          "code": 1063
        },
        "uv": 2
      },
      "astro": {
        "sunrise": "08:04 AM",
        "sunset": "03:54 PM",
        "moonrise": "07:16 AM",
        "moonset": "02:35 PM",
        "moon_phase": "New Moon",
        "moon_illumination": "0"
      },
      "hour": [
        {
          "time_epoch": 1671667200,
          "time": "2022-12-22 00:00",
          "temp_c": 6.8,
          "temp_f": 44.2,
          "is_day": 0,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            "code": 1009
          },
          "wind_mph": 3.6,
          "wind_kph": 5.8,
          "wind_degree": 264,
          "wind_dir": "W",
          "pressure_mb": 1003,
          "pressure_in": 29.62,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 94,
          "cloud": 99,
          "feelslike_c": 5.9,
          "feelslike_f": 42.6,
          "windchill_c": 5.9,
          "windchill_f": 42.6,
          "heatindex_c": 6.8,
          "heatindex_f": 44.2,
          "dewpoint_c": 5.9,
          "dewpoint_f": 42.6,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 6.7,
          "gust_kph": 10.8,
          "uv": 1
        },
        {
          "time_epoch": 1671670800,
          "time": "2022-12-22 01:00",
          "temp_c": 6.9,
          "temp_f": 44.4,
          "is_day": 0,
          "condition": {
            "text": "Patchy rain possible",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
            "code": 1063
          },
          "wind_mph": 4.3,
          "wind_kph": 6.8,
          "wind_degree": 253,
          "wind_dir": "WSW",
          "pressure_mb": 1003,
          "pressure_in": 29.62,
          "precip_mm": 0.1,
          "precip_in": 0,
          "humidity": 92,
          "cloud": 85,
          "feelslike_c": 5.7,
          "feelslike_f": 42.3,
          "windchill_c": 5.7,
          "windchill_f": 42.3,
          "heatindex_c": 6.9,
          "heatindex_f": 44.4,
          "dewpoint_c": 5.7,
          "dewpoint_f": 42.3,
          "will_it_rain": 1,
          "chance_of_rain": 72,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 7.4,
          "gust_kph": 11.9,
          "uv": 1
        },
        {
          "time_epoch": 1671674400,
          "time": "2022-12-22 02:00",
          "temp_c": 6.8,
          "temp_f": 44.2,
          "is_day": 0,
          "condition": {
            "text": "Patchy rain possible",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
            "code": 1063
          },
          "wind_mph": 4.3,
          "wind_kph": 6.8,
          "wind_degree": 251,
          "wind_dir": "WSW",
          "pressure_mb": 1004,
          "pressure_in": 29.64,
          "precip_mm": 0.1,
          "precip_in": 0,
          "humidity": 91,
          "cloud": 76,
          "feelslike_c": 5.5,
          "feelslike_f": 41.9,
          "windchill_c": 5.5,
          "windchill_f": 41.9,
          "heatindex_c": 6.8,
          "heatindex_f": 44.2,
          "dewpoint_c": 5.5,
          "dewpoint_f": 41.9,
          "will_it_rain": 1,
          "chance_of_rain": 89,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 7.4,
          "gust_kph": 11.9,
          "uv": 1
        },
        {
          "time_epoch": 1671678000,
          "time": "2022-12-22 03:00",
          "temp_c": 6.4,
          "temp_f": 43.5,
          "is_day": 0,
          "condition": {
            "text": "Patchy light drizzle",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/263.png",
            "code": 1150
          },
          "wind_mph": 4,
          "wind_kph": 6.5,
          "wind_degree": 248,
          "wind_dir": "WSW",
          "pressure_mb": 1004,
          "pressure_in": 29.64,
          "precip_mm": 0.2,
          "precip_in": 0.01,
          "humidity": 93,
          "cloud": 71,
          "feelslike_c": 5.2,
          "feelslike_f": 41.4,
          "windchill_c": 5.2,
          "windchill_f": 41.4,
          "heatindex_c": 6.4,
          "heatindex_f": 43.5,
          "dewpoint_c": 5.4,
          "dewpoint_f": 41.7,
          "will_it_rain": 1,
          "chance_of_rain": 73,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 5,
          "vis_miles": 3,
          "gust_mph": 7.4,
          "gust_kph": 11.9,
          "uv": 1
        },
        {
          "time_epoch": 1671681600,
          "time": "2022-12-22 04:00",
          "temp_c": 6,
          "temp_f": 42.8,
          "is_day": 0,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
            "code": 1030
          },
          "wind_mph": 4.7,
          "wind_kph": 7.6,
          "wind_degree": 241,
          "wind_dir": "WSW",
          "pressure_mb": 1004,
          "pressure_in": 29.66,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 94,
          "cloud": 25,
          "feelslike_c": 4.4,
          "feelslike_f": 39.9,
          "windchill_c": 4.4,
          "windchill_f": 39.9,
          "heatindex_c": 6,
          "heatindex_f": 42.8,
          "dewpoint_c": 5.2,
          "dewpoint_f": 41.4,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 8.9,
          "gust_kph": 14.4,
          "uv": 1
        },
        {
          "time_epoch": 1671685200,
          "time": "2022-12-22 05:00",
          "temp_c": 5.9,
          "temp_f": 42.6,
          "is_day": 0,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
            "code": 1030
          },
          "wind_mph": 4.9,
          "wind_kph": 7.9,
          "wind_degree": 236,
          "wind_dir": "WSW",
          "pressure_mb": 1005,
          "pressure_in": 29.68,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 95,
          "cloud": 45,
          "feelslike_c": 4.2,
          "feelslike_f": 39.6,
          "windchill_c": 4.2,
          "windchill_f": 39.6,
          "heatindex_c": 5.9,
          "heatindex_f": 42.6,
          "dewpoint_c": 5.2,
          "dewpoint_f": 41.4,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 9.2,
          "gust_kph": 14.8,
          "uv": 1
        },
        {
          "time_epoch": 1671688800,
          "time": "2022-12-22 06:00",
          "temp_c": 5.8,
          "temp_f": 42.4,
          "is_day": 0,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
            "code": 1030
          },
          "wind_mph": 4.9,
          "wind_kph": 7.9,
          "wind_degree": 209,
          "wind_dir": "SSW",
          "pressure_mb": 1005,
          "pressure_in": 29.68,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 96,
          "cloud": 32,
          "feelslike_c": 4.1,
          "feelslike_f": 39.4,
          "windchill_c": 4.1,
          "windchill_f": 39.4,
          "heatindex_c": 5.8,
          "heatindex_f": 42.4,
          "dewpoint_c": 5.2,
          "dewpoint_f": 41.4,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 9.4,
          "gust_kph": 15.1,
          "uv": 1
        },
        {
          "time_epoch": 1671692400,
          "time": "2022-12-22 07:00",
          "temp_c": 5.8,
          "temp_f": 42.4,
          "is_day": 0,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
            "code": 1030
          },
          "wind_mph": 4.7,
          "wind_kph": 7.6,
          "wind_degree": 207,
          "wind_dir": "SSW",
          "pressure_mb": 1005,
          "pressure_in": 29.69,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 96,
          "cloud": 33,
          "feelslike_c": 4.2,
          "feelslike_f": 39.6,
          "windchill_c": 4.2,
          "windchill_f": 39.6,
          "heatindex_c": 5.8,
          "heatindex_f": 42.4,
          "dewpoint_c": 5.2,
          "dewpoint_f": 41.4,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 9.4,
          "gust_kph": 15.1,
          "uv": 1
        },
        {
          "time_epoch": 1671696000,
          "time": "2022-12-22 08:00",
          "temp_c": 5.8,
          "temp_f": 42.4,
          "is_day": 0,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
            "code": 1030
          },
          "wind_mph": 4.9,
          "wind_kph": 7.9,
          "wind_degree": 194,
          "wind_dir": "SSW",
          "pressure_mb": 1006,
          "pressure_in": 29.7,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 95,
          "cloud": 82,
          "feelslike_c": 4.1,
          "feelslike_f": 39.4,
          "windchill_c": 4.1,
          "windchill_f": 39.4,
          "heatindex_c": 5.8,
          "heatindex_f": 42.4,
          "dewpoint_c": 5.1,
          "dewpoint_f": 41.2,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 10.1,
          "gust_kph": 16.2,
          "uv": 1
        },
        {
          "time_epoch": 1671699600,
          "time": "2022-12-22 09:00",
          "temp_c": 6.3,
          "temp_f": 43.3,
          "is_day": 1,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/143.png",
            "code": 1030
          },
          "wind_mph": 4.7,
          "wind_kph": 7.6,
          "wind_degree": 183,
          "wind_dir": "S",
          "pressure_mb": 1006,
          "pressure_in": 29.7,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 95,
          "cloud": 53,
          "feelslike_c": 4.8,
          "feelslike_f": 40.6,
          "windchill_c": 4.8,
          "windchill_f": 40.6,
          "heatindex_c": 6.3,
          "heatindex_f": 43.3,
          "dewpoint_c": 5.5,
          "dewpoint_f": 41.9,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 9.2,
          "gust_kph": 14.8,
          "uv": 2
        },
        {
          "time_epoch": 1671703200,
          "time": "2022-12-22 10:00",
          "temp_c": 7.4,
          "temp_f": 45.3,
          "is_day": 1,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png",
            "code": 1009
          },
          "wind_mph": 5.8,
          "wind_kph": 9.4,
          "wind_degree": 177,
          "wind_dir": "S",
          "pressure_mb": 1006,
          "pressure_in": 29.69,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 92,
          "cloud": 100,
          "feelslike_c": 5.7,
          "feelslike_f": 42.3,
          "windchill_c": 5.7,
          "windchill_f": 42.3,
          "heatindex_c": 7.4,
          "heatindex_f": 45.3,
          "dewpoint_c": 6.1,
          "dewpoint_f": 43,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 10.3,
          "gust_kph": 16.6,
          "uv": 2
        },
        {
          "time_epoch": 1671706800,
          "time": "2022-12-22 11:00",
          "temp_c": 8.1,
          "temp_f": 46.6,
          "is_day": 1,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/143.png",
            "code": 1030
          },
          "wind_mph": 7.6,
          "wind_kph": 12.2,
          "wind_degree": 186,
          "wind_dir": "S",
          "pressure_mb": 1005,
          "pressure_in": 29.67,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 96,
          "cloud": 100,
          "feelslike_c": 6,
          "feelslike_f": 42.8,
          "windchill_c": 6,
          "windchill_f": 42.8,
          "heatindex_c": 8.1,
          "heatindex_f": 46.6,
          "dewpoint_c": 7.5,
          "dewpoint_f": 45.5,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 12.8,
          "gust_kph": 20.5,
          "uv": 2
        },
        {
          "time_epoch": 1671710400,
          "time": "2022-12-22 12:00",
          "temp_c": 9.5,
          "temp_f": 49.1,
          "is_day": 1,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/143.png",
            "code": 1030
          },
          "wind_mph": 7.6,
          "wind_kph": 12.2,
          "wind_degree": 215,
          "wind_dir": "SW",
          "pressure_mb": 1004,
          "pressure_in": 29.65,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 95,
          "cloud": 100,
          "feelslike_c": 7.7,
          "feelslike_f": 45.9,
          "windchill_c": 7.7,
          "windchill_f": 45.9,
          "heatindex_c": 9.5,
          "heatindex_f": 49.1,
          "dewpoint_c": 8.7,
          "dewpoint_f": 47.7,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 12.3,
          "gust_kph": 19.8,
          "uv": 2
        },
        {
          "time_epoch": 1671714000,
          "time": "2022-12-22 13:00",
          "temp_c": 10.5,
          "temp_f": 50.9,
          "is_day": 1,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png",
            "code": 1009
          },
          "wind_mph": 9.2,
          "wind_kph": 14.8,
          "wind_degree": 232,
          "wind_dir": "SW",
          "pressure_mb": 1003,
          "pressure_in": 29.62,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 88,
          "cloud": 100,
          "feelslike_c": 8.6,
          "feelslike_f": 47.5,
          "windchill_c": 8.6,
          "windchill_f": 47.5,
          "heatindex_c": 10.5,
          "heatindex_f": 50.9,
          "dewpoint_c": 8.6,
          "dewpoint_f": 47.5,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 14.5,
          "gust_kph": 23.4,
          "uv": 3
        },
        {
          "time_epoch": 1671717600,
          "time": "2022-12-22 14:00",
          "temp_c": 10.5,
          "temp_f": 50.9,
          "is_day": 1,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/122.png",
            "code": 1009
          },
          "wind_mph": 8.5,
          "wind_kph": 13.7,
          "wind_degree": 224,
          "wind_dir": "SW",
          "pressure_mb": 1003,
          "pressure_in": 29.61,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 88,
          "cloud": 100,
          "feelslike_c": 8.7,
          "feelslike_f": 47.7,
          "windchill_c": 8.7,
          "windchill_f": 47.7,
          "heatindex_c": 10.5,
          "heatindex_f": 50.9,
          "dewpoint_c": 8.6,
          "dewpoint_f": 47.5,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 13.4,
          "gust_kph": 21.6,
          "uv": 3
        },
        {
          "time_epoch": 1671721200,
          "time": "2022-12-22 15:00",
          "temp_c": 10.5,
          "temp_f": 50.9,
          "is_day": 1,
          "condition": {
            "text": "Patchy rain possible",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
            "code": 1063
          },
          "wind_mph": 7.8,
          "wind_kph": 12.6,
          "wind_degree": 228,
          "wind_dir": "SW",
          "pressure_mb": 1002,
          "pressure_in": 29.6,
          "precip_mm": 0.1,
          "precip_in": 0,
          "humidity": 88,
          "cloud": 100,
          "feelslike_c": 8.8,
          "feelslike_f": 47.8,
          "windchill_c": 8.8,
          "windchill_f": 47.8,
          "heatindex_c": 10.5,
          "heatindex_f": 50.9,
          "dewpoint_c": 8.7,
          "dewpoint_f": 47.7,
          "will_it_rain": 0,
          "chance_of_rain": 67,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 12.5,
          "gust_kph": 20.2,
          "uv": 3
        },
        {
          "time_epoch": 1671724800,
          "time": "2022-12-22 16:00",
          "temp_c": 10.3,
          "temp_f": 50.5,
          "is_day": 0,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            "code": 1009
          },
          "wind_mph": 8.5,
          "wind_kph": 13.7,
          "wind_degree": 232,
          "wind_dir": "SW",
          "pressure_mb": 1002,
          "pressure_in": 29.6,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 91,
          "cloud": 100,
          "feelslike_c": 8.4,
          "feelslike_f": 47.1,
          "windchill_c": 8.4,
          "windchill_f": 47.1,
          "heatindex_c": 10.3,
          "heatindex_f": 50.5,
          "dewpoint_c": 8.9,
          "dewpoint_f": 48,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 13.9,
          "gust_kph": 22.3,
          "uv": 1
        },
        {
          "time_epoch": 1671728400,
          "time": "2022-12-22 17:00",
          "temp_c": 10.2,
          "temp_f": 50.4,
          "is_day": 0,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            "code": 1009
          },
          "wind_mph": 7.8,
          "wind_kph": 12.6,
          "wind_degree": 231,
          "wind_dir": "SW",
          "pressure_mb": 1002,
          "pressure_in": 29.59,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 92,
          "cloud": 100,
          "feelslike_c": 8.5,
          "feelslike_f": 47.3,
          "windchill_c": 8.5,
          "windchill_f": 47.3,
          "heatindex_c": 10.2,
          "heatindex_f": 50.4,
          "dewpoint_c": 8.9,
          "dewpoint_f": 48,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 12.3,
          "gust_kph": 19.8,
          "uv": 1
        },
        {
          "time_epoch": 1671732000,
          "time": "2022-12-22 18:00",
          "temp_c": 10.1,
          "temp_f": 50.2,
          "is_day": 0,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            "code": 1009
          },
          "wind_mph": 7.6,
          "wind_kph": 12.2,
          "wind_degree": 234,
          "wind_dir": "SW",
          "pressure_mb": 1002,
          "pressure_in": 29.59,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 94,
          "cloud": 93,
          "feelslike_c": 8.4,
          "feelslike_f": 47.1,
          "windchill_c": 8.4,
          "windchill_f": 47.1,
          "heatindex_c": 10.1,
          "heatindex_f": 50.2,
          "dewpoint_c": 9.1,
          "dewpoint_f": 48.4,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 11.6,
          "gust_kph": 18.7,
          "uv": 1
        },
        {
          "time_epoch": 1671735600,
          "time": "2022-12-22 19:00",
          "temp_c": 9.8,
          "temp_f": 49.6,
          "is_day": 0,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            "code": 1009
          },
          "wind_mph": 7.8,
          "wind_kph": 12.6,
          "wind_degree": 244,
          "wind_dir": "WSW",
          "pressure_mb": 1002,
          "pressure_in": 29.6,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 95,
          "cloud": 95,
          "feelslike_c": 8,
          "feelslike_f": 46.4,
          "windchill_c": 8,
          "windchill_f": 46.4,
          "heatindex_c": 9.8,
          "heatindex_f": 49.6,
          "dewpoint_c": 9,
          "dewpoint_f": 48.2,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 11.9,
          "gust_kph": 19.1,
          "uv": 1
        },
        {
          "time_epoch": 1671739200,
          "time": "2022-12-22 20:00",
          "temp_c": 9.1,
          "temp_f": 48.4,
          "is_day": 0,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            "code": 1009
          },
          "wind_mph": 8.1,
          "wind_kph": 13,
          "wind_degree": 245,
          "wind_dir": "WSW",
          "pressure_mb": 1003,
          "pressure_in": 29.62,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 96,
          "cloud": 100,
          "feelslike_c": 7.1,
          "feelslike_f": 44.8,
          "windchill_c": 7.1,
          "windchill_f": 44.8,
          "heatindex_c": 9.1,
          "heatindex_f": 48.4,
          "dewpoint_c": 8.4,
          "dewpoint_f": 47.1,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 12.8,
          "gust_kph": 20.5,
          "uv": 1
        },
        {
          "time_epoch": 1671742800,
          "time": "2022-12-22 21:00",
          "temp_c": 9.1,
          "temp_f": 48.4,
          "is_day": 0,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
            "code": 1030
          },
          "wind_mph": 7.2,
          "wind_kph": 11.5,
          "wind_degree": 245,
          "wind_dir": "WSW",
          "pressure_mb": 1003,
          "pressure_in": 29.62,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 96,
          "cloud": 73,
          "feelslike_c": 7.3,
          "feelslike_f": 45.1,
          "windchill_c": 7.3,
          "windchill_f": 45.1,
          "heatindex_c": 9.1,
          "heatindex_f": 48.4,
          "dewpoint_c": 8.4,
          "dewpoint_f": 47.1,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 11.4,
          "gust_kph": 18.4,
          "uv": 1
        },
        {
          "time_epoch": 1671746400,
          "time": "2022-12-22 22:00",
          "temp_c": 8.9,
          "temp_f": 48,
          "is_day": 0,
          "condition": {
            "text": "Mist",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png",
            "code": 1030
          },
          "wind_mph": 7.6,
          "wind_kph": 12.2,
          "wind_degree": 251,
          "wind_dir": "WSW",
          "pressure_mb": 1004,
          "pressure_in": 29.65,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 96,
          "cloud": 100,
          "feelslike_c": 6.9,
          "feelslike_f": 44.4,
          "windchill_c": 6.9,
          "windchill_f": 44.4,
          "heatindex_c": 8.9,
          "heatindex_f": 48,
          "dewpoint_c": 8.2,
          "dewpoint_f": 46.8,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 2,
          "vis_miles": 1,
          "gust_mph": 12.3,
          "gust_kph": 19.8,
          "uv": 1
        },
        {
          "time_epoch": 1671750000,
          "time": "2022-12-22 23:00",
          "temp_c": 9.5,
          "temp_f": 49.1,
          "is_day": 0,
          "condition": {
            "text": "Overcast",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
            "code": 1009
          },
          "wind_mph": 7.6,
          "wind_kph": 12.2,
          "wind_degree": 253,
          "wind_dir": "WSW",
          "pressure_mb": 1004,
          "pressure_in": 29.66,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 93,
          "cloud": 100,
          "feelslike_c": 7.7,
          "feelslike_f": 45.9,
          "windchill_c": 7.7,
          "windchill_f": 45.9,
          "heatindex_c": 9.5,
          "heatindex_f": 49.1,
          "dewpoint_c": 8.5,
          "dewpoint_f": 47.3,
          "will_it_rain": 0,
          "chance_of_rain": 0,
          "will_it_snow": 0,
          "chance_of_snow": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "gust_mph": 11.9,
          "gust_kph": 19.1,
          "uv": 1
        }
      ]
    }
  ];

  String currentWeatherStatus = 'ff';

  // API call
  String searchWeatherAPI = "http://api.weatherapi.com/v1/forecast.json?key= " +
      apiKey +
      "&days=7&q=";

  void fetchWeatherData(String searchText) async {
    try {
      var searchResult =
          await http.get(Uri.parse(searchWeatherAPI + searchText));

      final weatherData = Map<String, dynamic>.from(
          json.decode(searchResult.body) ?? 'No data');

      var locationData = weatherData["location"];

      var currentWeather = weatherData["current"];

      setState(() {
        location = getShortLocationName(locationData["name"]);

        var parseDate =
            DateTime.parse(locationData["localtime"].substring(0.10));
        var newDate = DateFormat('MMMMEEEEd').format(parseDate);
        currentDate = newDate;

        // update weather place
        currentWeatherStatus = currentWeather["condition"]["text"];
        weatherIcon =
            currentWeatherStatus.replaceAll(' ', ' ').toLowerCase() + ".png";
        temperature = currentWeather["temp_c"].toString();
        windSpeed = currentWeather["wind_kph"].toString();
        humidity = currentWeather["humidity"].toString();
        cloud = currentWeather["cloud"].toString();

        // forecast data
        datelyWeatherForecast = weatherData["forecast"]["forecastday"];
        hourlyWeatherForecast = datelyWeatherForecast[0]["hour"];
        print(datelyWeatherForecast);
      });
    } catch (e) {
      //debug print e
    }
  }

  // funtion to return the first to names of the string location
  static String getShortLocationName(String s) {
    List<String> wordList = s.split(" ");

    if (wordList.isNotEmpty) {
      if (wordList.length > 1) {
        return wordList[0] + " " + wordList[1];
      } else {
        return wordList[0];
      }
    } else {
      return " ";
    }
  }

  @override
  void initState() {
    fetchWeatherData(location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            // height: size.height,
            padding: const EdgeInsets.all(25),
            color: _constants.primaryColor.withOpacity(.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: size.height * .7,
                  decoration: BoxDecoration(
                    gradient: _constants.linearGradientBlue,
                    boxShadow: [
                      BoxShadow(
                        color: _constants.primaryColor.withOpacity(.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/menu.png",
                            width: 40,
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/pin.png",
                                width: 20,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _cityController.clear();
                                  showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context) => SingleChildScrollView(
                                      controller:
                                          ModalScrollController.of(context),
                                      child: Container(
                                        height: size.height * 2,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 70,
                                              child: Divider(
                                                thickness: 3.5,
                                                color: _constants.primaryColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextField(
                                              onChanged: (searhText) {
                                                fetchWeatherData(searhText);
                                              },
                                              controller: _cityController,
                                              autofocus: true,
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color:
                                                      _constants.primaryColor,
                                                ),
                                                suffixIcon: GestureDetector(
                                                  onTap: () =>
                                                      _cityController.clear(),
                                                  child: Icon(
                                                    Icons.close,
                                                    color:
                                                        _constants.primaryColor,
                                                  ),
                                                ),
                                                hintText:
                                                    'Searh City e.g. London',
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color:
                                                        _constants.primaryColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/profile.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 160,
                        child: Image.asset("assets/" + weatherIcon),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              temperature,
                              style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = _constants.shader,
                              ),
                            ),
                          ),
                          Text(
                            '°',
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = _constants.shader,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: const Text(
                          "Cloudy",
                          //currentWeatherStatus ??,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        child: const Text(
                          "Today",
                          //currentDate ?? ,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Divider(
                          color: Colors.white70,
                        ),
                      ),
                      Container(
                        //  padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WeatherItem(
                                value: '3',
                                unit: 'km/h',
                                imageUrl: 'assets/windspeed.png',
                              ),
                              WeatherItem(
                                value: '17',
                                unit: '%',
                                imageUrl: 'assets/humidity.png',
                              ),
                              WeatherItem(
                                value: '24',
                                unit: '%',
                                imageUrl: 'assets/cloud.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  //height: size.height * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    dailyForecastWeather: datelyWeatherForecast,
                                  ),
                                )),
                            child: Text(
                              'Forecasts',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: _constants.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          itemCount: 10, //hourlyWeatherForecast.length,
                          scrollDirection: Axis.horizontal,
                          // physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            /* String currentTime =
                                DateFormat('HH:mm:ss').format(DateTime.now());
                            String currentHour = currentTime.substring(0, 2);

                            String forecastTime = hourlyWeatherForecast[index]
                                    ["time"]
                                .substring(11, 16);
                            String forecastHour = hourlyWeatherForecast[index]
                                    ["time"]
                                .substring(11, 13);
                            String forecastWeatherName =
                                hourlyWeatherForecast[index]["condition"]
                                    ["text"];
                            String forecastWeatherIcon = forecastWeatherName
                                    .replaceAll(' ', '')
                                    .toLowerCase() +
                                ".png";
                            String forecastTemperature =
                                hourlyWeatherForecast[index]["temp_c"]
                                    .round()
                                    .toString();*/
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              margin: const EdgeInsets.only(right: 20),
                              width: 65,
                              decoration: BoxDecoration(
                                  color: Colors.white, //== forecastHour
                                  // ? Colors.white
                                  // : _constants.primaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      color: _constants.primaryColor
                                          .withOpacity(.2),
                                    )
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '18.00',
                                    //forecastTime,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: _constants.greyColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/' + 'lightrain.png',
                                    width: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '22 C',
                                        //forecastTemperature,
                                        style: TextStyle(
                                          color: _constants.greyColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '°',
                                        style: TextStyle(
                                          color: _constants.greyColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          fontFeatures: const [
                                            FontFeature.enable('sups'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
