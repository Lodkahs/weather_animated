//
//  WeatherView.swift
//  WeatherAnimated
//
//  Created by Andrew  on 4/22/23.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    var searchResults : [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter { $0.location.contains(searchText)
            }
        }
    }
    
    var body: some View {
        ZStack {
            //MARK: - background
            Color.background
                .ignoresSafeArea()
            
            //MARK: - weather widgets
            ScrollView(showsIndicators: false) {
                VStack(spacing : 20) {
                    ForEach(searchResults) {forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay {
            //MARK: - navigation bar
            NavigationBar(searchText: $searchText)

        }
        .toolbar(.hidden)
        //.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city or airport")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
