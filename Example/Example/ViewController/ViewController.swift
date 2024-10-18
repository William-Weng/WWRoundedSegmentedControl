//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/10/18.
//
//

import UIKit
import WWRoundedSegmentedControl

@IBDesignable class MyRoundedSegmentedControl: WWRoundedSegmentedControl {}

final class ViewController: UIViewController {

    @IBOutlet weak var mySegmentedControl: MyRoundedSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.mySegmentedControl.change(cornerRadiusPercent: 0.3, segmentInset: 10)
        }
    }
}
