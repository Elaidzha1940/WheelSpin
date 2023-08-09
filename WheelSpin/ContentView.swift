//  /*
//
//  Project: WheelSpin
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.08.2023
//
//  */

import SwiftUI

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

struct ContentView: View {
    let colors: [Color] = [.blue, .red, .white, .orange, .clear, .cyan, .blue, .black, .blue, .black, .brown, .blue]
    
    @State var count = 0
    @State var spin: Double = 0
    
    var body: some View {
        
        VStack {
            ZStack {
                ForEach(0..<count, id: \.self) { index in
                    Pie(startAngle: .degrees(Double(index) / Double(count) * 360), endAngle: .degrees(Double(index + 1 ) / Double(count) * 360))
                        .fill(colors[index % colors.count])
                }
            }
            .rotationEffect(.degrees(spin))
            
            Spacer()
            
            Button {
                if count < colors.count {
                    count += 1
                } else {
                    count = 0
                }
            } label: {
                Text("Add Color")
            }
            .frame(width: 200, height: 50)
            .background(.black)
            .cornerRadius(10)
            
            Button {
                withAnimation(.spring(response: 2, dampingFraction: 1.5)) {
                    spin += 360
                }
            } label: {
                <#code#>
            }
            .frame(width: 200, height: 50)
            .background(.black)
            .cornerRadius(10)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
