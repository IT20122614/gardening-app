//
//  PlantShopPage.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-16.
//

import SwiftUI

struct PlantShopPage: View {
    @State var selectedPath = topTabs[0]
    @Namespace var animation
    var allShoppingPlants: [shoppingModel] = shoppingList.allshoppingPlants
    
    fileprivate func TopComponent() -> some View {
        return HStack{
            Text("My Garden")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            Image("img_profile")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(30)
        }
        .padding()
    }
    
    fileprivate func FilterListComponent() -> some View {
        return HStack{
            ForEach(topTabs, id: \.self){ topTabs in
                FilterBtn(text: topTabs, selected: $selectedPath)
                
            }
        }
        .padding(.vertical, 24)
    }
    var body: some View {
        NavigationView{
            ZStack {
                Color.white
                    .ignoresSafeArea()
                Spacer()
                VStack{
                    TopComponent()
                    
                    
                    ScrollView(.vertical){

                            ScrollView(.horizontal, showsIndicators: false){
                                VStack(spacing: 16){
                                    ForEach(allShoppingPlants, id: \.id) { allShoppingPlants in
                                        NavigationLink(destination: SingleShoppingComponent(plant: allShoppingPlants), label: {
                                            SingleShopPlantComponent(title: allShoppingPlants.title, star: "4.9", image: allShoppingPlants.image, category: allShoppingPlants.category, price: allShoppingPlants.price)
                                        }
                                    )
                                        
                                    }
                                    
                                    
                                }
                                .padding(40)
                            }

                    }
                }
                
            }
        }
    }
}

struct PlantShopPage_Previews: PreviewProvider {
    static var previews: some View {
        PlantShopPage()
    }
}

struct SingleShopPlantComponent: View{
    var title:String
    var star:String
    var image:String
    var category:String
    var price:String

    
    var body: some View {

            VStack{
                HStack{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack{
                        Text(title)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color.green)
                            .padding()
                        
                        Text("Price: \(price) LKR")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            
                        
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(star)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.green)
                        }
                        .padding()
                        Text("Category: \(category)")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                    }
                }

            }
            .frame(width: 320, height: 240)
            .background(Color.white)
            .cornerRadius(20.0)
            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 16, y:16)

    }
}
