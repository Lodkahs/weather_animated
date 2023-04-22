//
//  ForecastView.swift
//  WeatherAnimated
//
//  Created by Andrew  on 4/17/23.
//

import SwiftUI

struct ForecastView: View {
    
    var bottomSheetTranslationProrated : CGFloat = 1
    @State private var selection = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                //MARK: - segmented control
                SegmentedControl(selection: $selection)
                //MARK: - forecast cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(Forecast.hourly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            ForEach(Forecast.weekly) { forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .weekly)
                            }
                            .transition(.offset(x: 430))
                        }
                        
                    }
                    .padding(.vertical, 20)
                    
                }
                .padding(.horizontal, 20)
                
                //MARK: - forecast widget
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)

            }
            .backgroundBlur(radius: 25, opaque: true)
            .clipShape(RoundedRectangle(cornerRadius: 44))
            .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blenMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
            .overlay {
                //MARK: - bottom sheep separator
                Divider()
                    .blendMode(.overlay)
                    .background(Color.bottomSheetBorderTop)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 44))
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black.opacity(0.3))
                    .frame(width: 48, height: 5)
                    .frame(height: 20)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
        }
    }
    
    struct ForecastView_Previews: PreviewProvider {
        static var previews: some View {
            ForecastView()
                .background(Color.background)
                .preferredColorScheme(.dark)
        }
    }
}
