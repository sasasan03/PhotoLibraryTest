//
//  SliderTest.swift
//  PhotoLibraryTest
//
//  Created by sako0602 on 2023/09/01.
//

import SwiftUI
import UIKit

struct SliderTest: View {
    
    @State private var sliderValue: Float = 5.0
    @State private var flower = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("スライダーで選択した値は\(sliderValue)です")
                //MARK: - UIKitのSlider
                UIKitSlider(value: $sliderValue, flower: $flower)
                    .background(Color.cyan)
                //MARK: -  SwiftUIのslider
    //            Slider(value: $sliderValue,
    //                   in: 0...10,
    //                   step: 1.0
    //            )
                //MARK: -
            }
            .background(Color.green)
        }
    }
}

struct UIKitSlider: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    @Binding var value: Float
    @Binding var flower: String
    
    //MARK: -
    func makeUIViewController(context: Context) -> UIViewControllerType {
        
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 300))//🟦sliderの設定をする
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(//
            context.coordinator,//ターゲットとなるオブジェクト。
            action: #selector(Coordinator.valueChange),//実行するメソッドを指定。 @objcメソッドを呼ぶ⚠️
            for: .valueChanged//発声するイベントを指定。値が変わった時にイベントが発生する。
        )
        
        let viewController = UIViewController()
        viewController.view.addSubview(slider)//🟦Sliderをサブビューに追化
        
        return viewController //作られたViewControllerを返す
    }
    
    //MARK: -
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let slider = uiViewController.view.subviews.first as? UISlider {
            slider.value = value
        }
    }
    //MARK: -
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    //MARK: -
    class Coordinator {//: NSObject {
        var parent: UIKitSlider
        
        init(parent: UIKitSlider) {
            self.parent = parent
        }
        
        @objc func valueChange(_ sender: UISlider){
            parent.value = sender.value
        }
    }
}
//MARK: -
struct SliderTest_Previews: PreviewProvider {
    static var previews: some View {
        SliderTest()
    }
}
