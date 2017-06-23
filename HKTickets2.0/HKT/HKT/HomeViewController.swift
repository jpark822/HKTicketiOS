//
//  HomeViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func TicketSearchButtonPressed(_ sender: Any) {
        let ticketSearchVC = UIStoryboard(name: "TicketStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ticketSearchSplitViewControllerId")
        self.present(ticketSearchVC, animated: true) {
            
        }
    }

    @IBAction func customerSearchButtonPressed(_ sender: Any) {
        let ticketSearchVC = UIStoryboard(name: "CustomerStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CustomerSplitViewControllerId")
        self.present(ticketSearchVC, animated: true) {
            
        }
        
    }
    
    @IBAction func ticketListButtonPressed(_ sender: Any) {
        let ticketSearchVC = UIStoryboard(name: "TicketStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ticketListSplitViewControllerId")
        self.present(ticketSearchVC, animated: true) {
            
        }
    }
}
