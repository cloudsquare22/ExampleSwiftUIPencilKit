//
//  ExampleController.swift
//  ExampleSwiftUIPencilKit
//
//  Created by Shin Inaba on 2021/07/22.
//

import SwiftUI
import PencilKit

struct ExampleControllerView: View {
    var body: some View {
        ZStack {
            Image("template")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            PencilKitViewControllerView()
        }
    }
}

struct ExampleControllerView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleControllerView()
    }
}

struct PencilKitViewControllerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PencilKitViewController {
        return PencilKitViewController()
    }

    func updateUIViewController(_ controller: PencilKitViewController, context: Context) {}
}

class PencilKitViewController: UIViewController {
    var pkcanvasview: PKCanvasView?
    let pktoolpicker = PKToolPicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pkcanvasview = PKCanvasView(frame: .zero)
        if let view = self.pkcanvasview {
            view.isOpaque = false
            view.backgroundColor = .clear
            view.overrideUserInterfaceStyle = .light
            self.pktoolpicker.addObserver(view)
            self.pktoolpicker.setVisible(true, forFirstResponder: view)
            view.becomeFirstResponder()
            self.view = view

            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft(sender:)))
            swipeLeft.direction = .left
            view.addGestureRecognizer(swipeLeft)

            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight(sender:)))
            swipeRight.direction = .right
            view.addGestureRecognizer(swipeRight)
        }
    }

    @objc func swipeLeft(sender: UISwipeGestureRecognizer) {
        print("Swipe left.")
    }

    @objc func swipeRight(sender: UISwipeGestureRecognizer) {
        print("Swipe right.")
    }
}
