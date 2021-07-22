//
//  ContentView.swift
//  ExampleSwiftUIPencilKit
//
//  Created by Shin Inaba on 2021/07/22.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var pkcanvasview: PKCanvasView = PKCanvasView()

    let screenSize: CGSize = UIScreen.main.bounds.size

    var body: some View {
        ZStack {
            Image("template")
                .resizable()
                .scaledToFit()
                .frame(width: screenSize.width, height: screenSize.height, alignment: .center)
            PencilKitCanvasView(pkcanvasview: self.$pkcanvasview)
        }
    }
}

struct PencilKitCanvasView: UIViewRepresentable {
    @Binding var pkcanvasview: PKCanvasView
    let pktoolpicker = PKToolPicker()

    func makeUIView(context: Context) -> PKCanvasView {
        self.pkcanvasview.isOpaque = false
        self.pkcanvasview.backgroundColor = .clear
        self.pkcanvasview.overrideUserInterfaceStyle = .light
        self.pktoolpicker.addObserver(pkcanvasview)
        self.pktoolpicker.setVisible(true, forFirstResponder: pkcanvasview)
        self.pkcanvasview.becomeFirstResponder()
        return pkcanvasview
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}
