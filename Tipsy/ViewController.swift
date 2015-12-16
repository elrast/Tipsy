//
//  ViewController.swift
//  Tipsy
//
//  Created by Ellen Stanfill on 12/12/15.
//  Copyright © 2015 Ellen Stanfil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipAmtLabel: UILabel!
    
    @IBOutlet weak var totalAmtLabel: UILabel!
    
    @IBOutlet weak var tipRatioSlider: UISlider!
    
    @IBOutlet weak var tipRatioLabel: UILabel!
    
    @IBOutlet weak var navBarController: UINavigationItem!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipAmtLabel.text = "$0.00"
        totalAmtLabel.text = "$0.00"
        
        tipRatioSlider.value = 20.0
        tipRatioSlider.maximumValue = 60.0
        tipRatioSlider.minimumValue = 10.0
        
        var defaultTipVal = defaults.doubleForKey("default_tip")
        if (defaultTipVal != 0.0){
            tipRatioSlider.value = Float(defaultTipVal)
        }
        tipRatioLabel.text = String(format: "%%%.0f", defaultTipVal)
        
        var maxTipVal = defaults.doubleForKey("max_tip")
        if (maxTipVal != 0.0) {
            tipRatioSlider.maximumValue = Float(maxTipVal)
        }
        
        var minTipVal = defaults.doubleForKey("min_tip")
        if (minTipVal != 0.0) {
            tipRatioSlider.minimumValue = Float(minTipVal)
        }
        tipRatioSlider.minimumTrackTintColor = UIColor(
            red: 81/255,
            green: 140/255,
            blue: 96/255,
            alpha:1.0
        )
        tipRatioSlider.thumbTintColor = UIColor(
            red: 143/255,
            green: 220/255,
            blue: 158/255,
            alpha:1.0
        )
        billField?.becomeFirstResponder()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaultTipVal = defaults.doubleForKey("default_tip")
        if (defaultTipVal != 0.0){
            tipRatioSlider.value = Float(defaultTipVal)
        }
        
        var maxTipVal = defaults.doubleForKey("max_tip")
        if (maxTipVal != 0.0) {
            tipRatioSlider.maximumValue = Float(maxTipVal)
        }
        
        var minTipVal = defaults.doubleForKey("min_tip")
        if (minTipVal != 0.0) {
            tipRatioSlider.minimumValue = Float(minTipVal)
        }
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipRatio = Double(tipRatioSlider.value)
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipRatio / 100
        var total = billAmount + tip
        
        tipRatioLabel.text = String(format: "%%%.0f", tipRatio)
        tipAmtLabel.text = String(format: "$%.2f", tip)
        totalAmtLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

