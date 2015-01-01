//
//  ViewController.swift
//  Tips
//
//  Created by Ilie Ciorba on 12/30/14.
//  Copyright (c) 2014 Ilie Ciorba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipHalfLabel: UILabel!
    @IBOutlet weak var tipThirdLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalHalfLabel: UILabel!
    @IBOutlet weak var totalThirdLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipBgView: UIView!
    
    @IBOutlet weak var appBgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billField.attributedPlaceholder = NSAttributedString(string:"$",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor().colorWithAlphaComponent(0.25)])
        
        billField.becomeFirstResponder()

        tipControl.hidden = true
        

        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        
        var tip = billAmount * tipPercentage
        var halftip = tip / 2
        var thirdtip = tip / 3
        
        var total = billAmount + tip
        var halftotal = total / 2
        var thirdtotal = total / 3
        
        var bgAnimated = false
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        tipHalfLabel.text = String(format: "$%.2f", halftip)
        tipThirdLabel.text = String(format: "$%.2f", thirdtip)
        
        totalLabel.text = String(format: "$%.2f", total)
        totalHalfLabel.text = String(format: "$%.2f", halftotal)
        totalThirdLabel.text = String(format: "$%.2f", thirdtotal)
       
        
        if billField.text != "" {
        
            UIView.animateWithDuration(0.4, animations: {
              self.tipBgView.frame.origin.y = -320
            })
            
            tipControl.hidden = false
        }

        else {
            UIView.animateWithDuration(0.4, animations: {
                self.tipBgView.frame.origin.y = 0
            })
            
            tipControl.hidden = true
        }
    }
    
  
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
}

