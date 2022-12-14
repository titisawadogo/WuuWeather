//
//  WeatherView.swift
//  WuuWeather
//
//  Created by Tindwende Thierry Sawadogo on 8/27/22.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(weather.name)
                            .bold().font(.title)
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: ContentView()
                                .navigationBarHidden(true),
                            label: {
                                Image(systemName: "arrow.clockwise")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                                
                            }
                            
                        )
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                //Image(systemName: "sun.max")
                                //.font(.system(size: 40))
                                Text("Weather status : \(Text(weather.weather[0].main))")
                                
                                //Text(weather.weather[0].main)
                                
                            }
                            .frame(maxWidth: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble() + "??")
                                .font(.system(size: 70))
                                .fontWeight(.bold)
                                .padding()
                            
                            
                        }
                        
                        Spacer()
                            .frame(height: 80)
                        
                        Image("city")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        
                        Spacer()
                    }
                    
                    .frame(maxWidth: .infinity)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .bold().padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "??"))
                            
                            Spacer()
                            
                            WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "??"))
                        } //...........
                        
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                            
                            Spacer()
                            
                            WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.582, brightness: 1.0))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 1.0, saturation: 0.582, brightness: 1.0))
        .preferredColorScheme(.dark)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
