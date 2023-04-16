//
//  SingleShoppingComponent.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-17.
//

import SwiftUI

struct SingleShoppingComponent: View {
    var plant: shoppingModel
    var body: some View {
        VStack{
            Image(plant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack{
                HStack{
                    Text(plant.title)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Text("\(plant.price) LKR")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                HStack{
                    Text(plant.category)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                Text(plant.description)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Button("Buy Now"){
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                
                Spacer()
            }
            .background()
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 16, y:16)
            .padding()
        }
    }
}

struct SingleShoppingComponent_Previews: PreviewProvider {
    static var previews: some View {
        SingleShoppingComponent(plant: shoppingList.allshoppingPlants.first!)
    }
}
