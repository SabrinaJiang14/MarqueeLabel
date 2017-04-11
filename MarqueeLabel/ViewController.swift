//
//  ViewController.swift
//  MarqueeLabel
//
//  Created by Sabrina on 2017/4/11.
//  Copyright © 2017年 Sabrina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var demoLabel: MarqueeLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.demoLabel.innerText = "Last year's bleaching event, the worst on record, mainly affected the north of the reef, while the recent damage has mostly impacted the middle sections, according to scientists at the ARC Centre of Excellence for Coral Reef Studies."
        
        self.demoLabel.innerSize = 15
        self.demoLabel.innerColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

