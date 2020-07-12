//
//  ContentView.swift
//  Bus Buddy
//
//  Created by Terran Kroft on 7/10/20.
//  Copyright © 2020 itemic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RoutesViewModel(client: .init())
    let busRoutes = [
        BusRoute(route: "R1", destination: "This"),
        BusRoute(route: "R2", destination: "Is"),
        BusRoute(route: "R3", destination: "A"),
        BusRoute(route: "R4", destination: "Bus"),
        BusRoute(route: "R5", destination: "Route"),
        BusRoute(route: "R6", destination: "I"),
        BusRoute(route: "R6a", destination: "Made"),
        BusRoute(route: "R7", destination: "Up"),
        BusRoute(route: "R9", destination: "Camalari"),
        BusRoute(route: "R10", destination: "Kokyō"),
        BusRoute(route: "280", destination: "Shoudu"),
        BusRoute(route: "35", destination: "Chairevil"),
        BusRoute(route: "400", destination: "Lasilla"),
        BusRoute(route: "175", destination: "Dinedun"),
        BusRoute(route: "0", destination: "Ling"),
        BusRoute(route: "0a", destination: "Zhongdian"),
        BusRoute(route: "0b", destination: "Ayex Twelve")
    ]
    
    var body: some View {
        
//        NavigationView {
        ZStack {
            Color(UIColor.init(red: 10/255, green: 10/255, blue: 15/255, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("A Bus Application").foregroundColor(.white)
                GeometryReader { geo in
                    ScrollView {
                        VStack(spacing: 10) {

                            ForEach(self.viewModel.routes) { route in
                                ElementRow(route: route.routeName.zhTw!, destination: route.destinationStopName.zhTw!)
                            }
                                
                        }.padding()
                            .navigationBarTitle("Bus Buddy Tainan")
                            .frame(width: geo.size.width)
                        
        //            }
                    }
                }
            }
        }
    }
}

struct ElementRow: View {
    
    var route: String
    var destination: String
    
    var body: some View {
        HStack(alignment: .bottom) {
            
            Text(route)
                .font(.custom("Helvetica Neue", size: 24)).fontWeight(.bold)
                .foregroundColor(colorFromName())
                .padding(1)
            Spacer()
            Text("to \(destination)")
                
                .font(.custom("Helvetica Neue", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            .padding(1)
//            Spacer()

            
            
            
        }
        .padding(5)
        .background(Color(UIColor.init(red: 20/255, green: 20/255, blue: 30/255, alpha: 1)))
        .cornerRadius(10)
        
        
    }
    
    func colorFromName() -> Color {
        if route.starts(with: "紅") {return .red}
        if route.starts(with: "綠") {return .green}
        if route.starts(with: "藍") {return .blue}
        if route.starts(with: "黃") {return .yellow}
        if route.starts(with: "棕") {return Color(UIColor.brown)}
        if route.starts(with: "橘") {return .orange}
        return .purple
    }
}

struct BusRoute: Hashable {
    var route: String
    var destination: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
