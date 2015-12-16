//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Ellen Stanfill on 12/15/15.
//  Copyright © 2015 Ellen Stanfil. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipField: UITextField!
    
    @IBOutlet weak var minTipField: UITextField!
    
    @IBOutlet weak var maxTipField: UITextField!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var defaultTip = defaults.doubleForKey("default_tip")
        if (defaultTip == 0.0) {
            defaultTip = 20.0
        }
        var minTip = defaults.doubleForKey("min_tip")
        if (minTip == 0.0) {
            minTip = 10.0
        }
        var maxTip = defaults.doubleForKey("max_tip")
        if (maxTip == 0.0) {
            maxTip = 60.0
        }
        
        defaultTipField.text = "\(defaultTip)"
        minTipField.text = "\(minTip)"
        maxTipField.text = "\(maxTip)"

    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func onEditingChanged(sender: UITextField) {
        
        defaults.setDouble(NSString(string: defaultTipField.text!).doubleValue, forKey: "default_tip")
        
        defaults.setDouble(NSString(string: minTipField.text!).doubleValue, forKey: "min_tip")
        
        defaults.setDouble(NSString(string: maxTipField.text!).doubleValue, forKey: "max_tip")
        
        defaults.synchronize()
    }
    
    @IBAction func editingDidBeginDefault(sender: AnyObject) {
        defaultTipField.text = "";
    }
    
    @IBAction func editingDidBeginMin(sender: AnyObject) {
        minTipField.text = "";
    }
    @IBAction func editingDidBeginMax(sender: AnyObject) {
        maxTipField.text = "";
    }

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
