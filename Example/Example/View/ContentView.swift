//
//  ContentView.swift
//  Example
//
//  Created by John Lima on 8/30/23.
//

import SimultaneouslyScrollView
import SwiftUI
import SwiftUIIntrospect

struct ContentView: View {

    // MARK: - Properties
    let simultaneouslyScrollViewHandler = SimultaneouslyScrollViewHandlerFactory.create()

    var body: some View {
        ScrollView {
            ForEach(0..<15) { category in
                LazyVStack {
                    Text("Category: \(category)")
                    ZStack(alignment: .leading) {

                        ScrollView (.horizontal) {
                            LazyVStack(spacing: 4) {
                                ForEach(0..<20) { channel in
                                    LazyHStack(spacing: 4) {
                                        ForEach(0..<20) { program in
                                            ZStack {
                                                Text("Custom \(channel), \(program)")
                                                    .foregroundColor(.white)
                                                    .font(.body)
                                                    .padding(8)
                                            }
                                            .frame(width: 256, height: 72, alignment: .leading)
                                            .background(Color.red)
                                            .onTapGesture {
                                                print("channel: \(channel), program: \(program)")
                                            }
                                        }
                                    }
                                    .padding(.leading, 128)
                                }
                            }
                        }
                        .introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17)) {
                            simultaneouslyScrollViewHandler.register(scrollView: $0)
                        }

                        VStack(spacing: 4) {
                            ForEach(0..<20) { channel in
                                Text("Channel: \(channel)")
                                    .foregroundColor(.yellow)
                                    .font(.headline)
                                    .frame(width: 124, height: 72)
                                    .background(Color.blue)
                                    .onTapGesture {
                                        print("row: \(channel)")
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
