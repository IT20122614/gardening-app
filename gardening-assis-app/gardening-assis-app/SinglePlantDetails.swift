//
//  SinglePlantDetails.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-12.
//

import SwiftUI

struct SinglePlantDetails: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    
//    let weatherView = weatherViewModel.fetchTemperature()
    var countValue = 0.0
    @State private var password = ""
    
    var plant: plantModel
    var body: some View {
        NavigationView{
            VStack{
                Text(plant.title)
                Spacer()
                ScrollView(.vertical, showsIndicators: false){
                    ConditionsDisplayPart(plant: plant)
                    WhetherDisplayPart(plant: plant)
                    StagesDisplayPart()
                    
                    VStack{
                        Text("Comments")
                            .font(.system(size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.medium)
                            .foregroundColor(Color.green)
                            
                        
                    }
                    .padding()
                    VStack{
                        HStack{
                            Image("man_prof")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(30)
                            Text("Jhone")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            Spacer()
                            
                        }
                        
                        Text("this plant is very beautiful.this plant is very beautiful this plant is very beautiful this plant is very beautiful")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                            .padding()
                    }
                    .padding()
                    VStack{
                        HStack{
                            Image("8girl")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(30)
                            Text("Jhone")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            Spacer()
                            
                        }
                        
                        Text("this plant is very beautiful.this plant is very beautiful this plant is very beautiful this plant is very beautiful")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                            .padding()
                    }
                    .padding()
                    VStack{
                        HStack{
                            Image("img_profile")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(30)
                            Text("Jhone")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            Spacer()
                            
                        }
                        
                        Text("this plant is very beautiful.this plant is very beautiful this plant is very beautiful this plant is very beautiful")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18))
                            .padding()
                    }
                    .padding()
                    
                }
                
                
                
                
            }
            
            
        }
        
        
    }
}
struct WeatherData: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
}
class WeatherViewModel: ObservableObject {
    @Published var temperature: Double = 0.0

    func fetchTemperature() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=6.064086&lon=80.273997&appid=8ee41903d2e27dec8f6c2e31e5b01f61") else { return }
        

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedResponse = try? JSONDecoder().decode(WeatherData.self, from: data) {
                DispatchQueue.main.async {
                    self.temperature = decodedResponse.main.temp
                    
                }
            }
        }.resume()
    }
}

struct SinglePlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlantDetails(plant: plantList.allPlants.first!)
    }
}

struct ConditionsDisplayPart: View{
    var plant:plantModel
    @State private var speedWater = 10.0
    @State private var speedFertilizer = 50.0
    @State private var speedWaterLimit = 35.0
    @State private var speedWaters = 80.0
    
    var body: some View{
        HStack{
            
            VStack{
                HStack{
                    Image("watericon")
                        .resizable()
                        .frame(width: 25, height: 30)
                    Text("Water (\(plant.waterLimit)ml)")
                    
                    Image("refreshicon")
                        .resizable()
                        .frame(width: 25, height: 30)
                }
                VStack {
                        Slider(
                            value: $speedWater,
                            in: 0...100
                        )
                        
                    }
                .padding()
                HStack{
                    Image("fertilizer")
                        .resizable()
                        .frame(width: 25, height: 30)
                    Text("Fertilize (\(plant.fertilizerCount) scoops)")
                    Image("okpng")
                        .resizable()
                        .frame(width: 25, height: 30)
                }
                VStack {
                        Slider(
                            value: $speedFertilizer,
                            in: 0...100
                        )
                        
                        
                    }
                .padding()
                HStack{
                    Image("cut")
                        .resizable()
                        .frame(width: 25, height: 30)
                    Text("Pruning (dead leaves)")
                    Image("okpng")
                        .resizable()
                        .frame(width: 25, height: 30)
                }
                VStack {
                        Slider(
                            value: $speedWaterLimit,
                            in: 0...100
                        )
                        
                    }
                .padding()
                HStack{
                    Image("plant")
                        .resizable()
                        .frame(width: 25, height: 30)
                    Text("Repotting (\(plant.reportingDays) days old)")
                    Image("okpng")
                        .resizable()
                        .frame(width: 25, height: 30)
                }
                VStack {
                        Slider(
                            value: $speedWaters,
                            in: 0...100
                        )
                        
                    }
                .padding()
            }
            VStack{
                Image(plant.image)
                    .resizable()
                    .frame(width: 160, height: 300)
            }
        }
    }
}
struct WhetherDisplayPart: View{
    var plant:plantModel
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View{
        HStack{
            Spacer(minLength: 2)
            HStack{
                Image("watericon")
                    .resizable()
                    .frame(width: 25, height: 30)
                
            }
            VStack{
                Text("Water")
                Text("2 days")
            }
            .padding()
            HStack{
                Image("sun")
                    .resizable()
                    .frame(width: 25, height: 30)
                
            }
            VStack{
                Text("Light")
                Text("Full")
            }
            
            HStack{
                Image("temperature")
                    .resizable()
                    .frame(width: 25, height: 30)
                
            }
            VStack{
                
                Button("Temperature") {
                                weatherViewModel.fetchTemperature()
                    
                            }
                            
                Text("\(String(format: "%.2f", weatherViewModel.temperature))°C")
            }
            Spacer(minLength: 2)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.25), radius: 16, x: 1, y:16)
        .padding()
        
        
    }
}
struct StagesDisplayPart: View{
    @State private var speedWaters = 80.0
    
    var body: some View{
        
        
        VStack{
            Text("Stage of life")
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.medium)
                .foregroundColor(Color.green)
                
            Text("42 days old")
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        VStack {
                Slider(
                    value: $speedWaters,
                    in: 0...100
                )
            HStack{
                ZStack{
                    Text("Planting")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.green)
                }
                ZStack{
                    Text("Seedling")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.green)
                }
                ZStack{
                    Text("Maturity")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.green)
                }
                ZStack{
                    Text("Harvest")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.green)
                }
                
                
                
            }
                
            }
        .padding()
    }
}
