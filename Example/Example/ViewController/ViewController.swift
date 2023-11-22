//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2022/12/15.
//  ~/Library/Caches/org.swift.swiftpm/
//  file:///Users/william/Desktop/WWUserDefaults

import UIKit
import WWRoundedSegmentedControl

@IBDesignable class MyRoundedSegmentedControl: WWRoundedSegmentedControl {}

final class ViewController: UIViewController {

    @IBOutlet weak var mySegmentedControl: MyRoundedSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
