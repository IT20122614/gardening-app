//
//  HomePage.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-06.
//

import SwiftUI
var selectedCategory = "All"




struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
var topTabs = ["All", "indoor", "outdoor", "garden"]


struct FilterBtn: View{
    var text: String
    
    @Binding var selected: String
    @State var refresh: Bool = false
    
    var body: some View{
        Button(action: {
            withAnimation(.spring(), {
                selected = text
                selectedCategory = text
                
                
                
            })
//            refresh.toggle()
            selectedCategory = text
            print("value>>>>:  \(selectedCategory)")
            
        }){
            Text(text)
                .fontWeight(.medium)
                .foregroundColor(selected == text ? .white: .black)
                .padding()
                .padding(.horizontal)
                .background(ZStack{
                    if (selected == text){
                        Color.green
                    }
                })
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.16), radius: 16, x: 4, y: 4)
        }
    }
}
struct HomePage: View {

    @State var selectedPath = topTabs[0]
    @Namespace var animation
    var allPlants: [plantModel] = plantList.allPlants
    var indoorPlants: [plantModel] = plantList.indoorPlants
    var outdoorPlants: [plantModel] = plantList.outdoorPlants
    
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
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        FilterListComponent()
                    }
                    .padding()
                    ScrollView(.vertical){
                        RecommendedComponent(title: selectedCategory)
                        

                        if(selectedCategory == "All") {
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 16){
                                    ForEach(allPlants, id: \.id) { plant in
                                        NavigationLink(destination: SinglePlantDetails(plant: plant), label: {
                                            SinglePlantComponent(title: plant.title, star: "4.9", image: plant.image)
                                        })
                                        
                                        
    //                                    SinglePlantComponent(title: "Oscar Plant", star: "4.8", image: "plants2")
                                    }
                                    
                                    
                                }
                                .padding(40)
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 16){
                                ForEach(indoorPlants, id: \.id) { plant in
                                    SinglePlantComponent(title: plant.title, star: "4.9", image: plant.image)
                                    
//                                    SinglePlantComponent(title: "Oscar Plant", star: "4.8", image: "plants2")
                                }
                            }
                            .padding()
                        }
                    }
                }
                
            }
        }
    }
}
struct SinglePlantComponent: View{
    var title:String
    var star:String
    var image:String

    
    var body: some View {

            VStack{
                ZStack(alignment: .topTrailing){
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                VStack{
                    Text(title)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(star)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                    }
                }
                .padding()
            }
            .frame(width: 160, height: 240)
            .background(Color.white)
            .cornerRadius(20.0)
            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 16, y:16)

    }
}
struct RecommendedComponent: View{
    var title:String
    
    var body: some View{
        HStack{
            Text(title)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(Color.green)
            Spacer()
            
        }
        .padding()
    }
}
