//
//  HomeView.swift
//  WeatherAnimated
//
//  Created by Andrew  on 4/17/23.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition : CGFloat, CaseIterable {
    case top = 0.83 // 702/844
    case middle = 0.385 // 325/844
}

struct HomeView: View {
    @State var bottomSheepPosition : BottomSheetPosition = .middle
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
                
                //MARK: - bottom sheep
                BottomSheetView(position: $bottomSheepPosition) {
                    //Text(bottomSheepPosition.rawValue.formatted())
                } content: {
                    ForecastView()
                }

                
                //MARK: - tab bar
                
                TabBar(action: {
                    bottomSheepPosition = .top
                })
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
