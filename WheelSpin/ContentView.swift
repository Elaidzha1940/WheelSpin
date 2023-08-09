//  /*
//
//  Project: WheelSpin
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.08.2023
//
//  */

import SwiftUI

struct ContentView: View {
    
    struct Pie: Shape {
        
        var startAngle: Angle
        var endAngle: Angle
        
        func path(in rect: CGRect) -> Path {
            
            let center = CGPoint(x: rect.minX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2
            let start = CGPoint(
                
                x: center.x + radius * cos(CGFloat(startAngle.radians)),
                y: center.y + radius * sin(CGFloat(endAngle.radians))
            )
            
            var path = Path()
            path.move(to: center)
            path.addLine(to: start)
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            path.addLine(to: center)
            return path
        }
    }
    
    var body: some View {
        
        VStack {
           
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
