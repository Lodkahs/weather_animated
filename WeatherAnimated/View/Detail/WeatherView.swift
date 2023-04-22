//
//  WeatherView.swift
//  WeatherAnimated
//
//  Created by Andrew  on 4/22/23.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            //MARK: - background
            Color.background
                .ignoresSafeArea()
            
            //MARK: - weather widgets
            ScrollView(showsIndicators: false) {
                VStack(spacing : 20) {
                    ForEach(Forecast.cities) {forecast in
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
            NavigationBar()

        }
        .toolbar(.hidden)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
