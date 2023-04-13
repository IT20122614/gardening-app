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
    
    var plant: plantModel
    var body: some View {
        NavigationView{
            VStack{
                Text(plant.title)
                Spacer()
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
                                    value: $speed,
                                    in: 0...100
                                )
                                
                            }
                        .padding()
                        HStack{
                            Image("fertilizer")
                                .resizable()
                                .frame(width: 25, height: 30)
                            Text("Water (\(plant.waterLimit)ml)")
                            Image("ok")
                                .resizable()
                                .frame(width: 25, height: 30)
                        }
                        VStack {
                                Slider(
                                    value: $speed,
                                    in: 0...100
                                )
                                
                                
                            }
                        .padding()
                        HStack{
                            Image("cut")
                                .resizable()
                                .frame(width: 25, height: 30)
                            Text("Water (\(plant.waterLimit)ml)")
                            Image("ok")
                                .resizable()
                                .frame(width: 25, height: 30)
                        }
                        VStack {
                                Slider(
                                    value: $speed,
                                    in: 0...100
                                )
                                
                            }
                        .padding()
                        HStack{
                            Image("plant")
                                .resizable()
                                .frame(width: 25, height: 30)
                            Text("Water (\(plant.waterLimit)ml)")
                            Image("ok")
                                .resizable()
                                .frame(width: 25, height: 30)
                        }
                        VStack {
                                Slider(
                                    value: $speed,
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
                        Text("Temperature")
                        Text("13-21 C")
                    }
                    Spacer(minLength: 2)
                }
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.25), radius: 16, x: 1, y:16)
                .padding()
                
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
                            value: $speed,
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
        
        
    }
}

struct SinglePlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlantDetails(plant: plantList.allPlants.first!)
    }
}
