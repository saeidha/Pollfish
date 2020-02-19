//
//  FirstViewController.swift
//  Pollfish
//
//  Created by Saeid Hosseinabadi on 2/7/20.
//  Copyright © 2020 Saeid Hosseinabadi. All rights reserved.
//

import UIKit
import SHPollfish

class FirstViewController: UIViewController {

    fileprivate var slideButon = UIButton()
    fileprivate var vc: SHPollfishOverlayView!
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(changePollfish), name: UIDevice.orientationDidChangeNotification, object: nil)
        super.viewDidLoad()
        self.view.addSubview(slideButon)
        self.view.backgroundColor = .red
        self.slideButon.translatesAutoresizingMaskIntoConstraints = false
        self.slideButon.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.slideButon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.slideButon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.slideButon.setTitle("Slide Button", for: .normal)
        self.slideButon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.slideButon.backgroundColor = .black
        self.view.backgroundColor = .white
        self.slideButon.addTarget(self, action: #selector(openVC), for: .touchUpInside)
        
        let model = SHPollfishModel(param1: "sample1", param2: "sample2", param3: "sample3", param4: "sample4", param5: "sample5")
        let viewModel = SHViewModel(m: model)
        self.vc = SHPollfishOverlayView()
        self.vc.delegate = self
        self.vc.viewModel = viewModel
    }
    
    // Deinit View Controller
    deinit {
       NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        
    }
    
    // Open Silde BUtton
    @objc func openVC(){
        
        if vc == nil {
        self.vc.viewModel = SHViewModel(m: SHPollfishModel(param1: "sample1", param2: "sample2", param3: "sample3", param4: "sample4", param5: "sample5"))
        self.vc.delegate = self
        }
        self.animationForLoad(vc)
    }
    
    // Change PollFish -- Rotate Handeler
    @objc func changePollfish(){
        self.vc = nil
        self.vc = SHPollfishOverlayView()
        self.vc.viewModel = SHViewModel()
        self.vc.delegate = self
    }
}


//SH Pollfish Over View Delegate -- Call Back
extension FirstViewController: SHPolisOverViewDelegate{
    func dismissPassValue(_ param: (String, String, String)) {
        print("\(param.0) \(param.1) \(param.2)")
    }
}
