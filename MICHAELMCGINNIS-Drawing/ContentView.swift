//
//  ContentView.swift
//  MICHAELMCGINNIS-Drawing
//
//  Created by Michael Mcginnis on 3/16/22.
//

import SwiftUI

/*
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape{
    var insetAmount = 0.0
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjusment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjusment
        let modifiedEnd = endAngle - rotationAdjusment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius:  rect.width/2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape{
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8){
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width/2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double{
        get{insetAmount}
        set{insetAmount=newValue}
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get{
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set{
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

/*
struct ContentView: View {
    var body: some View {
        /*
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300 , y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        //.fill(.blue)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        Triangle()
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
        
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
        
        Circle()
            .strokeBorder(.blue, lineWidth: 40)
        
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)*/

    }
}

struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0

    var body: some View {
        /*
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])

            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("Example")))*/
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct ContentView: View {
    @State private var colorCycle = 0.0

    var body: some View {
        /*
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
        }*/
        Image("PaulHudson")
            .colorMultiply(.red)
    }
}

struct ContentView: View {
    @State private var amount = 0.0

    var body: some View {
        /*
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)

         Image("PaulHudson")
             .resizable()
             .scaledToFit()
             .frame(width: 200, height: 200)
             .saturation(amount)
             .blur(radius: (1 - amount) * 20)
         
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()*/
        
    }
}

struct ContentView: View {
    @State private var insetAmount = 50.0

    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation{
                    insetAmount = Double.random(in: 10...90)
                }
            }
    }
}*/

struct ContentView: View {
    @State private var rows = 4
    @State private var columns = 4

    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
    }
}*/
//All above is the techniques

//Through random copy pasting of points I have achieved an arrow!
struct Arrow: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        return path
    }
}

//Seems to just be a copy using Rectangle()?
struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var lineWidthAnimation: CGFloat = 10
    @State private var colorCycle = 0.5
    var body: some View {
        VStack{
            Text("Tap me!")
                .font(.title)
        Arrow()
            .stroke(.red, style: StrokeStyle(lineWidth: lineWidthAnimation, lineCap: .round, lineJoin: .round))
            .frame(width: 150, height: 200)
            .onTapGesture {
                withAnimation{
                    lineWidthAnimation = CGFloat.random(in: 10...70)
                }
            }
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 200, height: 200)
            
            Text("Color Cycler")
            Slider(value: $colorCycle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
