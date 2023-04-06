//
//  Pie.swift
//  Memorize
//
//  Created by Mufeed AlMatar on 06/04/2023.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var offsetAngle = Angle(degrees: 0)
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos((startAngle + offsetAngle).radians)),
            y: center.y + radius * CGFloat(sin((startAngle + offsetAngle).radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle  + offsetAngle,
            endAngle: endAngle  + offsetAngle,
            clockwise: !clockwise)
        p.addLine(to: center)
        return p
    }
}
