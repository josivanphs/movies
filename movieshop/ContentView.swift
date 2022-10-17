//
//  ContentView.swift
//  plantshop
//
//  Created by Mikael Fonseca on 16/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["all", "Romance", "Drama", "Action", "Comedia", "Table"]
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment:.leading){
                    AppBarView()
                    
                    TagLineView()
                        .padding()
                    
                    SearchAndScanView()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(0 ..< categories.count, id: \.self) { i in
                                CategoryView(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }
                        .padding()
                    }
                    
                    Text("Keep Watching")
                        .font(.custom("", size: 24))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image:Image("chair_\(index + 1)"), size: 210)
                            }
                        }
                        .padding(.trailing)
                    }
                    
                    Text("The Best")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .fontWeight(.bold)
                        
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image:Image("chair_\(index + 1)"), size: 210)
                            }
                        }
                        .padding(.trailing)
                    }
                    
                    
                    
                }
            }
            // - MARK: NavBar
            
            HStack{
                ButtonNavBarItem(image: Image("Home")){}
                ButtonNavBarItem(image: Image("Fav")){}
                ButtonNavBarItem(image: Image("Shop")){}
                ButtonNavBarItem(image: Image("User")){}

            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("menu")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            Spacer()
            
            Button(action: {}){
                
                Image("josivan")
                    .resizable()
                    .frame(width: 46, height: 46)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("AmazonEmber_Rg", size: 28))
            .foregroundColor(Color.white)
        + Text("Movie")
            .font(.custom("AmazonEmber_Bd", size: 28))
            .foregroundColor(Color.white)
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Movie", text: $search)
            }
            .padding(.all, 20)
            .background(Color(.white))
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}){
                Image("Scan")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size:18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color(.white): Color.white.opacity(0.5))
            
            if (isActive){
                Color(.white)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}


struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        .padding()
    }
}

struct ButtonNavBarItem: View {
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}
