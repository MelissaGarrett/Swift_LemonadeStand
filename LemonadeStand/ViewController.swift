//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Melissa  Garrett on 10/14/16.
//  Copyright © 2016 MelissaGarrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var lemonsCountLabel: UILabel!
    @IBOutlet weak var iceCubesCountLabel: UILabel!
    
    @IBOutlet weak var lemonsSuppliesTotal: UILabel!
    @IBOutlet weak var iceCubesSuppliesTotal: UILabel!
    
    @IBOutlet weak var lemonsMixTotal: UILabel!
    @IBOutlet weak var iceCubesMixTotal: UILabel!
    
    // Global properties
    var moneyAvailable: Int = 10
    var lemonsAvailable: Int = 1
    var iceCubesAvailable: Int = 1
    
    // Global constants
    let kLemonPrice = 2
    let kIceCubesPrice = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusLemonsSupplies(_ sender: AnyObject) {
        if (moneyAvailable >= kLemonPrice) {
            var lemonsTotal = Int(lemonsSuppliesTotal.text!)!
            lemonsTotal += 1
            lemonsSuppliesTotal.text = "\(lemonsTotal)"
        
            // Update the Lemons Count in topmost view
            lemonsAvailable += 1
            lemonsCountLabel.text = "\(lemonsAvailable)"
        
            // Update the Money Count in topmost view
            moneyAvailable -= kLemonPrice
            moneyLabel.text = "$ \(moneyAvailable)"
        }
    }
    
    @IBAction func minusLemonsSupplies(_ sender: AnyObject) {
        var lemonsTotal = Int(lemonsSuppliesTotal.text!)!
        
        if (lemonsTotal == 0) { // Don't allow value to decrease below 0
            lemonsSuppliesTotal.text = "\(0)"
        } else {
            lemonsTotal -= 1
            lemonsSuppliesTotal.text = "\(lemonsTotal)"
            
            // Update the Lemons Count in topmost view
            lemonsAvailable -= 1
            lemonsCountLabel.text = "\(lemonsAvailable)"
            
            // Update the Money Count in topmost view
            moneyAvailable += kLemonPrice
            moneyLabel.text = "$ \(moneyAvailable)"
        }
    }
    
    @IBAction func plusIceCubesSupplies(_ sender: AnyObject) {
        if (moneyAvailable >= kIceCubesPrice) {
            var iceCubesTotal = Int(iceCubesSuppliesTotal.text!)!
            iceCubesTotal += 1
            iceCubesSuppliesTotal.text = "\(iceCubesTotal)"
        
            // Update the Ice Cubes Count in topmost view
            iceCubesAvailable += 1
            iceCubesCountLabel.text = "\(iceCubesAvailable)"
        
            // Update the Money Count in topmost view
            moneyAvailable -= kIceCubesPrice
            moneyLabel.text = "$ \(moneyAvailable)"
        }
    }
    
    @IBAction func minusIceCubesSupplies(_ sender: AnyObject) {
        var iceCubesTotal = Int(iceCubesSuppliesTotal.text!)!
        
        if (iceCubesTotal == 0) { // Don't allow value to decrease below 0
            iceCubesSuppliesTotal.text = "\(0)"
        } else {
            iceCubesTotal -= 1
            iceCubesSuppliesTotal.text = "\(iceCubesTotal)"
            
            // Update the Ice Cubes Count in topmost view
            iceCubesAvailable -= 1
            iceCubesCountLabel.text = "\(iceCubesAvailable)"
            
            // Update the Money Count in topmost view
            moneyAvailable += kIceCubesPrice
            moneyLabel.text = "$ \(moneyAvailable)"
        }
    }
    
    @IBAction func plusLemonsMix(_ sender: AnyObject) {
        if (lemonsAvailable >= 1) {
            var lemonsTotal = Int(lemonsMixTotal.text!)!
            lemonsTotal += 1
            lemonsMixTotal.text = "\(lemonsTotal)"
            
            // Update the Lemons Count in topmost view
            lemonsAvailable -= 1
            lemonsCountLabel.text = "\(lemonsAvailable)"
        }
    }
    
    @IBAction func minusLemonsMix(_ sender: AnyObject) {
        var lemonsTotal = Int(lemonsMixTotal.text!)!
        
        if (lemonsTotal == 0) { // Don't allow value to decrease below 0
            lemonsMixTotal.text = "\(0)"
        } else {
            lemonsTotal -= 1
            lemonsMixTotal.text = "\(lemonsTotal)"
            
            // Update the Lemons Count in topmost view
            lemonsAvailable += 1
            lemonsCountLabel.text = "\(lemonsAvailable)"
        }
    }
    
    @IBAction func plusIceCubesMix(_ sender: AnyObject) {
        if (iceCubesAvailable >= 1) {
            var iceCubesTotal = Int(iceCubesMixTotal.text!)!
            iceCubesTotal += 1
            iceCubesMixTotal.text = "\(iceCubesTotal)"
            
            // Update the Ice Cubes Count in topmost view
            iceCubesAvailable -= 1
            iceCubesCountLabel.text = "\(iceCubesAvailable)"
        }
    }
    
    @IBAction func minusIceCubesMix(_ sender: AnyObject) {
        var iceCubesTotal = Int(iceCubesMixTotal.text!)!
        
        if (iceCubesTotal == 0) { // Don't allow value to decrease below 0
            iceCubesMixTotal.text = "\(0)"
        } else {
            iceCubesTotal -= 1
            iceCubesMixTotal.text = "\(iceCubesTotal)"
            
            // Update the Ice Cubes Count in topmost view
            iceCubesAvailable += 1
            iceCubesCountLabel.text = "\(iceCubesAvailable)"
        }
    }

    @IBAction func startDayButton(_ sender: AnyObject) {
        let lemonsMix = Int(lemonsMixTotal.text!)!
        let iceCubesMix = Int(iceCubesMixTotal.text!)!
        
        let lemonadeRatio = computeLemonadeRatio(lemonsMix: lemonsMix, iceCubesMix: iceCubesMix)

        let numCustomers = Int(arc4random_uniform(10)+1) // 1-10 inclusive
        
        for customer in 1...numCustomers {
            let tastePreference:Int = Int(arc4random_uniform(10))
            let doubleTastePreference:Double = Double(tastePreference) / 10.0
            
            if ((doubleTastePreference >= 0 && doubleTastePreference <= 0.4) && lemonadeRatio > 1) {
                print("Customer #\(customer) prefers acidic lemonade...Paid $1!")
                moneyAvailable += 1
            } else if ((doubleTastePreference >= 0.4 && doubleTastePreference <= 0.6) && lemonadeRatio == 1) {
                print("Customer #\(customer) prefers equal parts lemonade...Paid $1!")
                moneyAvailable += 1
            } else if ((doubleTastePreference >= 0.6 && doubleTastePreference <= 1) && lemonadeRatio < 1) {
                        print("Customer #\(customer) prefers diluted lemonade...Paid $1!")
                moneyAvailable += 1
            } else {
                print("Customer #\(customer): No match; No revenue.")
            }
        }
        
        // At the end of the "day", if...
        if (moneyAvailable < 3) {
            print("You don't have enough money to buy starting inventory. You LOSE the game.")
        } else {
            print("Congratulations on making money and winning the game!")
        }
    }
    
    func computeLemonadeRatio(lemonsMix: Int, iceCubesMix: Int) -> Double {
        var lemonadeRatio:Double = 0.0
        lemonadeRatio = (Double(lemonsMix) / Double(iceCubesMix))
        
        return lemonadeRatio
    }
}

