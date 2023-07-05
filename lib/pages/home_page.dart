import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/Feature/success_body.dart';
 import 'package:weather_app/weather_cubit/weather_cubit.dart';
import 'package:weather_app/weather_cubit/weather_state.dart';

import '../Feature/default_body.dart';
import '../Feature/failure_body.dart';


class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                 );
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (BuildContext context, state) {
          if(state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          }
          else if (state is WeatherSuccess){
             return SuccessBody(weatherData: state.weatherModel);
          }
          else if (state is WeatherFailure){
            return FailureBody();
          }
          else {
            return DefaultBody();
          }
        },
          ),

    );
  }
}



