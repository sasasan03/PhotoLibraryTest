//
//  SliderTest.swift
//  PhotoLibraryTest
//
//  Created by sako0602 on 2023/09/01.
//

import SwiftUI

struct SliderTest: View {
    
    @State private var sliderValue: Float = 5.0
    
    var body: some View {
        VStack {
            Text("スライダーで選択した値は\(sliderValue)です")
            //MARK: - UIKitのSlider
             UIKitSlider(value: $sliderValue)
            //MARK: -  SwiftUIのslider
//            Slider(value: $sliderValue,
//                   in: 0...10,
//                   step: 1.0
//            )
            //MARK: -
        }
    }
}

struct UIKitSlider: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    @Binding var value: Float
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewController()
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange),
            for: .valueChanged
        )
        
        viewController.view.addSubview(slider)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let slider = uiViewController.view.subviews.first as? UISlider {
            slider.value = value
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject {
        var parent: UIKitSlider
        
        init(parent: UIKitSlider) {
            self.parent = parent
        }
        
        @objc func valueChange(_ sender: UISlider){
            parent.value = sender.value
        }
    }
    
}

struct SliderTest_Previews: PreviewProvider {
    static var previews: some View {
        SliderTest()
    }
}
