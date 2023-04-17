//
//  HomeView.swift
//  WeatherAnimated
//
//  Created by Andrew  on 4/17/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: background color
                Color.background
                    .ignoresSafeArea()
                //MARK: - background image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                //MARK: - house image
                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)
                
                VStack(spacing: -10) {
                    Text("Montreal")
                        .font(.largeTitle)
                    
                    VStack {
                        Text(attributedString)
                        Text("H:24°  L:18°")
                            .font(.title3.weight(.semibold))
                    }
                    Spacer()
                    
                }
                .padding(.top, 51)
                
                //MARK: - tab bar
                
                TabBar(action: {})

            }
            .toolbar(.hidden)
        }
    }
    
    private var attributedString : AttributedString {
        var string = AttributedString("19°" + "\n " + "Mostly clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: 96, weight: .thin )
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Mostly clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
