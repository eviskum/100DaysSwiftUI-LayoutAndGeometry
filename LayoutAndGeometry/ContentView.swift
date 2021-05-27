//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Esben Viskum on 27/05/2021.
//

import SwiftUI

extension VerticalAlignment {
//    struct MidAccountAndName: AlignmentID {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}


struct ContentView: View {
    var body: some View {

        let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

        
//        Text("Hello, world!")
//            .frame(width: 300, height: 300, alignment: .topLeading)
        
/*        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("Long")
            Text("and")
                .font(.title)
            Text("Prosper")
                .font(.largeTitle)
        } */
        
/*        VStack(alignment: .leading) {
            Text("Hello world")
                .alignmentGuide(.leading) { d in
                    d[.trailing]
                }
            Text("This is a longer line of text")
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue) */

/*        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in
                        CGFloat(position) * -10
                    }
            }
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue) */
        
/*        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@viskum")
                    .alignmentGuide(.midAccountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                Image("Esben")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("ESBEN VISKUM")
                    .alignmentGuide(.midAccountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                    .font(.largeTitle)
            }
        } */

/*        Text("Hello world")
//            .position(x: 100, y: 100)
            .background(Color.green)
            .offset(x: 100, y: 100)
            .background(Color.red) */
        
/*        VStack {
            GeometryReader { geo in
                Text("Hello World")
                    .frame(width: geo.size.width * 0.9, height: 40)
                    .background(Color.red)
            }
            .background(Color.green)
            
            Text("Teeeext")
                .background(Color.blue)
        } */
        
/*        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom") */
        
/*        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row \(index)")
                            .font(.title)
                            .frame(width: fullView.size.width)
                            .background(colors[index % 7])
                            .rotation3DEffect(
                                .degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(height: 40)
                }
            }
        } */
        
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                            Rectangle()
                                .fill(colors[index % 7])
                                .frame(height: 150)
                                .rotation3DEffect(
                                    .degrees(-Double(geo.frame(in: .global).minX - fullView.size.width / 2) / 10),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                        }
                        .frame(width: 150)
                    }
                }
                .padding(.horizontal, (fullView.size.width - 150) / 2)
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
    
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
