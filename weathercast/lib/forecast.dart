/*
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjIwNThmNmQ4OGJlNjY5ZDQ2MDlkNmI2NjM3ZTUyYjYzMDk5YjJmNGY0OTY2NDMyNGI4M2Q0MmRhNGUwNzc0OTU3ZTlhMjJiNTZjODZkZjNiIn0.eyJhdWQiOiIyIiwianRpIjoiMjA1OGY2ZDg4YmU2NjlkNDYwOWQ2YjY2MzdlNTJiNjMwOTliMmY0ZjQ5NjY0MzI0YjgzZDQyZGE0ZTA3NzQ5NTdlOWEyMmI1NmM4NmRmM2IiLCJpYXQiOjE2Njg5MzM1MTUsIm5iZiI6MTY2ODkzMzUxNSwiZXhwIjoxNzAwNDY5NTE1LCJzdWIiOiIyMjgyIiwic2NvcGVzIjpbXX0.w9490oKBOUGTK7ccC-EltZwSVrwyDlizzj0ry2QYIp5z_1A3Iqz2NwAQ2mVzcZv124mo8-mEJ4CXgZ-XCSzvNYhfb6DHexJrq3ytsIOVgry9HUS6FkQpEEzjvM_QIJm_gYLLljr6Rkb8YE9niB5r1VU0yo2kRmDfLnRS7KTCtFLYnR6F2WWTv24C77mDv9i-XZsU8tsL0eU3bwV_AXg3R_ZG9Y-VkG5z7wEHEQtLihF5jUCR3Ph3Y7pzzRv7M4ZGlNaOXnhGh5qiMalkJSUQV937JelLB3jdfYnXPdXVnaTxKiHZNrl5hUQsq3yK4n6pPTF3JVuaoVi4VhkSh0xy1MMviyVdviPminj7D8nJr0qbHxHWzvd-kt3vVMtlIDlXLFOytYg9Uh_rdxvORaP0OSdbEmDkUJcNUINrdBN_LbeFTwbSpBjhGW6b9cw_G51AsAsX0nrD6a9VgsxuVc1N4C9mJ2vrPivkpkdSk2UdUBfE7ZEkJUr1N7kQrKbX2omQGvJXIP_GUnde1IcrE0G9DmD652yU83nByAJURLo7sA5Tp96SXfyQOO1R3LcNUe827IuyP9aE_Af1H6ZsRgdKX6i6V0Gi9DTkGmJqvuzh7S_guhdPXZucOONEcp44d91tb1FrJJxO09fVfsvaCSGkZo_etk7UspkN6OGhXTlU8jM
*/
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {

const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjIwNThmNmQ4OGJlNjY5ZDQ2MDlkNmI2NjM3ZTUyYjYzMDk5YjJmNGY0OTY2NDMyNGI4M2Q0MmRhNGUwNzc0OTU3ZTlhMjJiNTZjODZkZjNiIn0.eyJhdWQiOiIyIiwianRpIjoiMjA1OGY2ZDg4YmU2NjlkNDYwOWQ2YjY2MzdlNTJiNjMwOTliMmY0ZjQ5NjY0MzI0YjgzZDQyZGE0ZTA3NzQ5NTdlOWEyMmI1NmM4NmRmM2IiLCJpYXQiOjE2Njg5MzM1MTUsIm5iZiI6MTY2ODkzMzUxNSwiZXhwIjoxNzAwNDY5NTE1LCJzdWIiOiIyMjgyIiwic2NvcGVzIjpbXX0.w9490oKBOUGTK7ccC-EltZwSVrwyDlizzj0ry2QYIp5z_1A3Iqz2NwAQ2mVzcZv124mo8-mEJ4CXgZ-XCSzvNYhfb6DHexJrq3ytsIOVgry9HUS6FkQpEEzjvM_QIJm_gYLLljr6Rkb8YE9niB5r1VU0yo2kRmDfLnRS7KTCtFLYnR6F2WWTv24C77mDv9i-XZsU8tsL0eU3bwV_AXg3R_ZG9Y-VkG5z7wEHEQtLihF5jUCR3Ph3Y7pzzRv7M4ZGlNaOXnhGh5qiMalkJSUQV937JelLB3jdfYnXPdXVnaTxKiHZNrl5hUQsq3yK4n6pPTF3JVuaoVi4VhkSh0xy1MMviyVdviPminj7D8nJr0qbHxHWzvd-kt3vVMtlIDlXLFOytYg9Uh_rdxvORaP0OSdbEmDkUJcNUINrdBN_LbeFTwbSpBjhGW6b9cw_G51AsAsX0nrD6a9VgsxuVc1N4C9mJ2vrPivkpkdSk2UdUBfE7ZEkJUr1N7kQrKbX2omQGvJXIP_GUnde1IcrE0G9DmD652yU83nByAJURLo7sA5Tp96SXfyQOO1R3LcNUe827IuyP9aE_Af1H6ZsRgdKX6i6V0Gi9DTkGmJqvuzh7S_guhdPXZucOONEcp44d91tb1FrJJxO09fVfsvaCSGkZo_etk7UspkN6OGhXTlU8jM';

try {
  Position location = await getCurrentLocation();
  http.Response response = await http.get(
  Uri.parse('$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'), 
  headers: {
    'accept': 'application/json',
    'authorization': 'Bearer $token',
    }
  );
  if(response.statusCode == 200) {
    var result = jsonDecode(response.body)['WeatherForecasts'][0]['forecasts'][0]['data'];
  Placemark address = (await placemarkFromCoordinates(location.latitude, location.longitude)).first;
  return Weather(
    address: '${address.subLocality}\n${address.administrativeArea}',
    temperature: result['tc'],
    cond: result['cond'],
);
    } else {
    return Future.error(response.statusCode);
  }
} catch (e) {
    return Future.error(e);
}

}
