//
//  Model.swift
//  WeatherForecast
//
//  Created by Fatih Kilit on 29.07.2022.
//



/*
 {
   "lat": 39.9208,
   "lon": 32.854,
   "timezone": "Europe/Istanbul",
   "timezone_offset": 10800,
   "current": {
     "dt": 1659104984,
     "sunrise": 1659062642,
     "sunset": 1659114352,
     "temp": 34.02,
     "feels_like": 31.63,
     "pressure": 1009,
     "humidity": 15,
     "dew_point": 3.75,
     "uvi": 2.54,
     "clouds": 0,
     "visibility": 10000,
     "wind_speed": 2.24,
     "wind_deg": 54,
     "wind_gust": 2.24,
     "weather": [
       {
         "id": 800,
         "main": "Clear",
         "description": "clear sky",
         "icon": "01d"
       }
     ]
   },
   "hourly": [
     {
       "dt": 1659103200,
       "temp": 34.02,
       "feels_like": 31.63,
       "pressure": 1009,
       "humidity": 15,
       "dew_point": 3.75,
       "uvi": 2.54,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.2,
       "wind_deg": 55,
       "wind_gust": 2.78,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659106800,
       "temp": 33.91,
       "feels_like": 31.58,
       "pressure": 1009,
       "humidity": 16,
       "dew_point": 4.59,
       "uvi": 1.01,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.57,
       "wind_deg": 62,
       "wind_gust": 2.79,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659110400,
       "temp": 33.31,
       "feels_like": 31.01,
       "pressure": 1009,
       "humidity": 16,
       "dew_point": 4.11,
       "uvi": 0.24,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 4.07,
       "wind_deg": 82,
       "wind_gust": 4.58,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659114000,
       "temp": 30.87,
       "feels_like": 28.9,
       "pressure": 1009,
       "humidity": 18,
       "dew_point": 3.82,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.59,
       "wind_deg": 90,
       "wind_gust": 5.18,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659117600,
       "temp": 28.22,
       "feels_like": 26.9,
       "pressure": 1009,
       "humidity": 20,
       "dew_point": 3.15,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.52,
       "wind_deg": 54,
       "wind_gust": 2.92,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659121200,
       "temp": 25.7,
       "feels_like": 24.87,
       "pressure": 1010,
       "humidity": 21,
       "dew_point": 1.04,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.45,
       "wind_deg": 32,
       "wind_gust": 4.97,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659124800,
       "temp": 24.61,
       "feels_like": 23.81,
       "pressure": 1011,
       "humidity": 26,
       "dew_point": 3.11,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 4.05,
       "wind_deg": 46,
       "wind_gust": 5.74,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659128400,
       "temp": 23.74,
       "feels_like": 22.95,
       "pressure": 1011,
       "humidity": 30,
       "dew_point": 4.49,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.16,
       "wind_deg": 52,
       "wind_gust": 3.91,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659132000,
       "temp": 22.81,
       "feels_like": 22.01,
       "pressure": 1011,
       "humidity": 33,
       "dew_point": 4.99,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.94,
       "wind_deg": 50,
       "wind_gust": 3.12,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659135600,
       "temp": 21.86,
       "feels_like": 21.04,
       "pressure": 1011,
       "humidity": 36,
       "dew_point": 5.4,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.35,
       "wind_deg": 52,
       "wind_gust": 2.41,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659139200,
       "temp": 21.35,
       "feels_like": 20.53,
       "pressure": 1010,
       "humidity": 38,
       "dew_point": 5.79,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.39,
       "wind_deg": 59,
       "wind_gust": 2.43,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659142800,
       "temp": 20.82,
       "feels_like": 20,
       "pressure": 1010,
       "humidity": 40,
       "dew_point": 6.05,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.29,
       "wind_deg": 61,
       "wind_gust": 2.31,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659146400,
       "temp": 20,
       "feels_like": 19.18,
       "pressure": 1010,
       "humidity": 43,
       "dew_point": 6.27,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.94,
       "wind_deg": 54,
       "wind_gust": 2.03,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659150000,
       "temp": 19.64,
       "feels_like": 18.83,
       "pressure": 1011,
       "humidity": 45,
       "dew_point": 6.58,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.99,
       "wind_deg": 46,
       "wind_gust": 2,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659153600,
       "temp": 21.62,
       "feels_like": 20.91,
       "pressure": 1011,
       "humidity": 41,
       "dew_point": 7.09,
       "uvi": 0.42,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.01,
       "wind_deg": 43,
       "wind_gust": 2.35,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659157200,
       "temp": 24,
       "feels_like": 23.37,
       "pressure": 1010,
       "humidity": 35,
       "dew_point": 7,
       "uvi": 1.39,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.98,
       "wind_deg": 39,
       "wind_gust": 2.42,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659160800,
       "temp": 26.12,
       "feels_like": 26.12,
       "pressure": 1010,
       "humidity": 31,
       "dew_point": 6.88,
       "uvi": 3.14,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.83,
       "wind_deg": 35,
       "wind_gust": 2.35,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659164400,
       "temp": 28.19,
       "feels_like": 27.06,
       "pressure": 1010,
       "humidity": 26,
       "dew_point": 6.47,
       "uvi": 5.46,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.85,
       "wind_deg": 30,
       "wind_gust": 2.24,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659168000,
       "temp": 30.01,
       "feels_like": 28.36,
       "pressure": 1009,
       "humidity": 23,
       "dew_point": 6.08,
       "uvi": 7.73,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.13,
       "wind_deg": 11,
       "wind_gust": 2.37,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659171600,
       "temp": 31.51,
       "feels_like": 29.53,
       "pressure": 1008,
       "humidity": 20,
       "dew_point": 5.4,
       "uvi": 9.35,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.3,
       "wind_deg": 359,
       "wind_gust": 2.72,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659175200,
       "temp": 32.67,
       "feels_like": 30.46,
       "pressure": 1008,
       "humidity": 17,
       "dew_point": 3.98,
       "uvi": 9.74,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.3,
       "wind_deg": 337,
       "wind_gust": 3.3,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659178800,
       "temp": 33.57,
       "feels_like": 31.2,
       "pressure": 1007,
       "humidity": 15,
       "dew_point": 3.01,
       "uvi": 8.88,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.49,
       "wind_deg": 316,
       "wind_gust": 3.15,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659182400,
       "temp": 34.2,
       "feels_like": 31.75,
       "pressure": 1007,
       "humidity": 14,
       "dew_point": 2.43,
       "uvi": 6.99,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.77,
       "wind_deg": 302,
       "wind_gust": 3.37,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659186000,
       "temp": 34.5,
       "feels_like": 31.98,
       "pressure": 1006,
       "humidity": 13,
       "dew_point": 2.05,
       "uvi": 4.71,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.02,
       "wind_deg": 291,
       "wind_gust": 3.48,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659189600,
       "temp": 34.45,
       "feels_like": 31.94,
       "pressure": 1006,
       "humidity": 13,
       "dew_point": 2.09,
       "uvi": 2.52,
       "clouds": 1,
       "visibility": 10000,
       "wind_speed": 3.18,
       "wind_deg": 289,
       "wind_gust": 3.66,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659193200,
       "temp": 33.88,
       "feels_like": 31.49,
       "pressure": 1005,
       "humidity": 15,
       "dew_point": 3,
       "uvi": 1,
       "clouds": 2,
       "visibility": 10000,
       "wind_speed": 2.97,
       "wind_deg": 341,
       "wind_gust": 3.87,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659196800,
       "temp": 31.76,
       "feels_like": 29.67,
       "pressure": 1006,
       "humidity": 18,
       "dew_point": 4.19,
       "uvi": 0.24,
       "clouds": 5,
       "visibility": 10000,
       "wind_speed": 4.86,
       "wind_deg": 9,
       "wind_gust": 6.51,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659200400,
       "temp": 28.7,
       "feels_like": 27.26,
       "pressure": 1007,
       "humidity": 21,
       "dew_point": 3.33,
       "uvi": 0,
       "clouds": 5,
       "visibility": 10000,
       "wind_speed": 5.28,
       "wind_deg": 19,
       "wind_gust": 9.21,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659204000,
       "temp": 26.62,
       "feels_like": 26.62,
       "pressure": 1008,
       "humidity": 22,
       "dew_point": 2.74,
       "uvi": 0,
       "clouds": 4,
       "visibility": 10000,
       "wind_speed": 3.63,
       "wind_deg": 32,
       "wind_gust": 4.58,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659207600,
       "temp": 25.55,
       "feels_like": 24.79,
       "pressure": 1009,
       "humidity": 24,
       "dew_point": 2.61,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.11,
       "wind_deg": 38,
       "wind_gust": 3.42,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659211200,
       "temp": 24.79,
       "feels_like": 23.98,
       "pressure": 1009,
       "humidity": 25,
       "dew_point": 2.97,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.45,
       "wind_deg": 43,
       "wind_gust": 3.65,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659214800,
       "temp": 23.75,
       "feels_like": 22.99,
       "pressure": 1009,
       "humidity": 31,
       "dew_point": 4.63,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.12,
       "wind_deg": 53,
       "wind_gust": 3.7,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659218400,
       "temp": 22.58,
       "feels_like": 21.86,
       "pressure": 1009,
       "humidity": 37,
       "dew_point": 6.39,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.34,
       "wind_deg": 49,
       "wind_gust": 2.63,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659222000,
       "temp": 21.87,
       "feels_like": 21.18,
       "pressure": 1009,
       "humidity": 41,
       "dew_point": 7.2,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.18,
       "wind_deg": 48,
       "wind_gust": 2.18,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659225600,
       "temp": 21.26,
       "feels_like": 20.59,
       "pressure": 1009,
       "humidity": 44,
       "dew_point": 7.77,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.1,
       "wind_deg": 46,
       "wind_gust": 2.13,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659229200,
       "temp": 20.83,
       "feels_like": 20.17,
       "pressure": 1009,
       "humidity": 46,
       "dew_point": 8.11,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.17,
       "wind_deg": 52,
       "wind_gust": 2.15,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659232800,
       "temp": 20.3,
       "feels_like": 19.67,
       "pressure": 1008,
       "humidity": 49,
       "dew_point": 8.43,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.98,
       "wind_deg": 56,
       "wind_gust": 1.99,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01n"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659236400,
       "temp": 19.91,
       "feels_like": 19.29,
       "pressure": 1009,
       "humidity": 51,
       "dew_point": 8.83,
       "uvi": 0,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.79,
       "wind_deg": 50,
       "wind_gust": 1.79,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659240000,
       "temp": 22.01,
       "feels_like": 21.47,
       "pressure": 1009,
       "humidity": 46,
       "dew_point": 9.28,
       "uvi": 0.42,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.57,
       "wind_deg": 55,
       "wind_gust": 1.77,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659243600,
       "temp": 24.13,
       "feels_like": 23.67,
       "pressure": 1009,
       "humidity": 41,
       "dew_point": 9.31,
       "uvi": 1.39,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.2,
       "wind_deg": 67,
       "wind_gust": 1.4,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659247200,
       "temp": 26.17,
       "feels_like": 26.17,
       "pressure": 1009,
       "humidity": 36,
       "dew_point": 9.26,
       "uvi": 3.16,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 0.93,
       "wind_deg": 75,
       "wind_gust": 1.09,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659250800,
       "temp": 28.09,
       "feels_like": 27.21,
       "pressure": 1008,
       "humidity": 31,
       "dew_point": 8.89,
       "uvi": 5.43,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 0.8,
       "wind_deg": 74,
       "wind_gust": 0.81,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659254400,
       "temp": 29.87,
       "feels_like": 28.38,
       "pressure": 1007,
       "humidity": 26,
       "dew_point": 7.86,
       "uvi": 7.71,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 0.34,
       "wind_deg": 81,
       "wind_gust": 0.95,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659258000,
       "temp": 31.32,
       "feels_like": 29.46,
       "pressure": 1007,
       "humidity": 22,
       "dew_point": 6.64,
       "uvi": 9.32,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 0.71,
       "wind_deg": 291,
       "wind_gust": 2.11,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659261600,
       "temp": 32.32,
       "feels_like": 30.28,
       "pressure": 1006,
       "humidity": 20,
       "dew_point": 5.73,
       "uvi": 9.74,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 1.67,
       "wind_deg": 295,
       "wind_gust": 2.97,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659265200,
       "temp": 33.3,
       "feels_like": 31.05,
       "pressure": 1005,
       "humidity": 17,
       "dew_point": 4.62,
       "uvi": 8.88,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 2.46,
       "wind_deg": 296,
       "wind_gust": 3.09,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659268800,
       "temp": 33.99,
       "feels_like": 31.6,
       "pressure": 1005,
       "humidity": 15,
       "dew_point": 3.75,
       "uvi": 6.98,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.18,
       "wind_deg": 293,
       "wind_gust": 3.5,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     },
     {
       "dt": 1659272400,
       "temp": 34.36,
       "feels_like": 31.95,
       "pressure": 1004,
       "humidity": 15,
       "dew_point": 3.24,
       "uvi": 4.59,
       "clouds": 0,
       "visibility": 10000,
       "wind_speed": 3.88,
       "wind_deg": 291,
       "wind_gust": 3.78,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "pop": 0
     }
   ],
   "daily": [
     {
       "dt": 1659085200,
       "sunrise": 1659062642,
       "sunset": 1659114352,
       "moonrise": 1659063480,
       "moonset": 1659117420,
       "moon_phase": 0.02,
       "temp": {
         "day": 30.9,
         "min": 19.51,
         "max": 34.04,
         "night": 24.61,
         "eve": 33.91,
         "morn": 19.51
       },
       "feels_like": {
         "day": 29.08,
         "night": 23.81,
         "eve": 31.58,
         "morn": 18.8
       },
       "pressure": 1011,
       "humidity": 22,
       "dew_point": 6.07,
       "wind_speed": 4.07,
       "wind_deg": 82,
       "wind_gust": 5.74,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 9.89
     },
     {
       "dt": 1659171600,
       "sunrise": 1659149097,
       "sunset": 1659200695,
       "moonrise": 1659153600,
       "moonset": 1659205560,
       "moon_phase": 0.05,
       "temp": {
         "day": 31.51,
         "min": 19.64,
         "max": 34.5,
         "night": 24.79,
         "eve": 33.88,
         "morn": 19.64
       },
       "feels_like": {
         "day": 29.53,
         "night": 23.98,
         "eve": 31.49,
         "morn": 18.83
       },
       "pressure": 1008,
       "humidity": 20,
       "dew_point": 5.4,
       "wind_speed": 5.28,
       "wind_deg": 19,
       "wind_gust": 9.21,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 9.74
     },
     {
       "dt": 1659258000,
       "sunrise": 1659235552,
       "sunset": 1659287035,
       "moonrise": 1659243780,
       "moonset": 1659293460,
       "moon_phase": 0.08,
       "temp": {
         "day": 31.32,
         "min": 19.91,
         "max": 34.36,
         "night": 24.45,
         "eve": 33.69,
         "morn": 19.91
       },
       "feels_like": {
         "day": 29.46,
         "night": 23.92,
         "eve": 31.32,
         "morn": 19.29
       },
       "pressure": 1007,
       "humidity": 22,
       "dew_point": 6.64,
       "wind_speed": 5.4,
       "wind_deg": 10,
       "wind_gust": 9.22,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 9.74
     },
     {
       "dt": 1659344400,
       "sunrise": 1659322008,
       "sunset": 1659373375,
       "moonrise": 1659333960,
       "moonset": 1659381240,
       "moon_phase": 0.11,
       "temp": {
         "day": 31.4,
         "min": 20.56,
         "max": 33.86,
         "night": 27.56,
         "eve": 33.86,
         "morn": 20.56
       },
       "feels_like": {
         "day": 29.65,
         "night": 26.97,
         "eve": 31.65,
         "morn": 20.21
       },
       "pressure": 1007,
       "humidity": 24,
       "dew_point": 8.15,
       "wind_speed": 5.02,
       "wind_deg": 300,
       "wind_gust": 6.95,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 9.78
     },
     {
       "dt": 1659430800,
       "sunrise": 1659408464,
       "sunset": 1659459712,
       "moonrise": 1659424080,
       "moonset": 1659469020,
       "moon_phase": 0.15,
       "temp": {
         "day": 31.2,
         "min": 20.68,
         "max": 33.97,
         "night": 25.96,
         "eve": 32.5,
         "morn": 20.68
       },
       "feels_like": {
         "day": 29.76,
         "night": 25.96,
         "eve": 30.84,
         "morn": 20.47
       },
       "pressure": 1008,
       "humidity": 28,
       "dew_point": 9.78,
       "wind_speed": 5.52,
       "wind_deg": 357,
       "wind_gust": 7.72,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 9.8
     },
     {
       "dt": 1659517200,
       "sunrise": 1659494921,
       "sunset": 1659546049,
       "moonrise": 1659514320,
       "moonset": 1659556800,
       "moon_phase": 0.18,
       "temp": {
         "day": 29.44,
         "min": 19.4,
         "max": 32.38,
         "night": 23.53,
         "eve": 31.09,
         "morn": 19.4
       },
       "feels_like": {
         "day": 28.78,
         "night": 23.04,
         "eve": 29.25,
         "morn": 19.41
       },
       "pressure": 1010,
       "humidity": 37,
       "dew_point": 12.76,
       "wind_speed": 6.47,
       "wind_deg": 354,
       "wind_gust": 8.94,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 10
     },
     {
       "dt": 1659603600,
       "sunrise": 1659581377,
       "sunset": 1659632384,
       "moonrise": 1659604680,
       "moonset": 1659644700,
       "moon_phase": 0.21,
       "temp": {
         "day": 27.27,
         "min": 16.02,
         "max": 30.48,
         "night": 22.38,
         "eve": 28.96,
         "morn": 16.02
       },
       "feels_like": {
         "day": 26.21,
         "night": 21.9,
         "eve": 27.6,
         "morn": 15.4
       },
       "pressure": 1011,
       "humidity": 18,
       "dew_point": 0.41,
       "wind_speed": 6.72,
       "wind_deg": 344,
       "wind_gust": 6.91,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 10
     },
     {
       "dt": 1659690000,
       "sunrise": 1659667834,
       "sunset": 1659718717,
       "moonrise": 1659695280,
       "moonset": 1659732840,
       "moon_phase": 0.25,
       "temp": {
         "day": 26.71,
         "min": 15.28,
         "max": 29.98,
         "night": 23.29,
         "eve": 29.61,
         "morn": 15.28
       },
       "feels_like": {
         "day": 26.1,
         "night": 22.75,
         "eve": 28.07,
         "morn": 14.87
       },
       "pressure": 1011,
       "humidity": 26,
       "dew_point": 5.11,
       "wind_speed": 5.44,
       "wind_deg": 338,
       "wind_gust": 6.59,
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": 0,
       "pop": 0,
       "uvi": 10
     }
   ]
 }
 */

import Foundation

struct WeatherData: Codable {
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    let hourly: [Current]?
    let daily: [Daily]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}

// MARK: - Current
struct Current: Codable, Hashable {
    static func == (lhs: Current, rhs: Current) -> Bool {
        lhs.dt == rhs.dt
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dt)
    }
    
    let dt, sunrise, sunset: Int?
    let temp, feelsLike: Double?
    let pressure, humidity: Int?
    let uvi: Double?
    let clouds, visibility: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: Main?
    let weatherDescription: Description?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
    
    var systemName: String {
        switch self {
        case .brokenClouds:
            return "smoke"
        case .clearSky:
            return "sun.max"
        case .fewClouds:
            return "smoke.fill"
        case .lightRain:
            return "cloud.drizzle"
        case .moderateRain:
            return "cloud.rain"
        case .overcastClouds:
            return "cloud.fill"
        case .scatteredClouds:
            return "smoke.fill"
        }
    }
}

// MARK: - Daily
struct Daily: Codable, Hashable, Equatable {
    static func == (lhs: Daily, rhs: Daily) -> Bool {
        lhs.dt == rhs.dt
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dt)
    }
    
    let dt, sunrise, sunset: Int?
    let temp: Temp?
    let pressure, humidity: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [Weather]?
    let clouds: Int?
    let rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset
        case temp
        case pressure, humidity
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
}

// MARK: Extensions

extension WeatherData {
    var currentTemp: Int {
        self.current?.temp?.asInt ?? 0
    }
    
    var maxTemp: Int {
        self.daily?.first?.temp?.max?.asInt ?? 0
    }
    
    var minTemp: Int {
        self.daily?.first?.temp?.min?.asInt ?? 0
    }
    
    var currentWeatherDescription: String {
        self.current?.weather?.first?.weatherDescription?.rawValue ?? ""
    }
    
    var hourFeelsLike: Int {
        self.hourly?.first?.feelsLike?.asInt ?? 0
    }
    
    var sunrise: Int {
        self.current?.sunrise ?? 0
    }
    
    var sunset: Int {
        self.current?.sunset ?? 0
    }
    
    var precipitation: Int {
        self.daily?.first?.rain?.asInt ?? 0
    }
    
    var humidity: Int {
        self.current?.humidity ?? 0
    }
    
    var wind: Int {
        self.current?.windSpeed?.asInt ?? 0
    }
    
    var windDegree: Double {
        Double(self.current?.windDeg ?? 0)
    }
}

extension Daily {
    var maxTemp: Int {
        self.temp?.max?.asInt ?? 0
    }
    
    var minTemp: Int {
        self.temp?.min?.asInt ?? 0
    }
}
