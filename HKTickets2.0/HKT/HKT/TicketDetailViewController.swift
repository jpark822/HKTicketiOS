//
//  TicketDetailViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class TicketDetailViewController: UIViewController, CustomerDetailViewControllerDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var customerContainerView: UIView!
    @IBOutlet weak var showCustomerDataButton: UIButton!
    @IBOutlet weak var customerViewHeightConstraint: NSLayoutConstraint!
    fileprivate var customerDataIsHidden = true
    fileprivate var customerViewExpandedHeight:CGFloat = 0.0
    
    var ticket:TicketModel! {
        didSet {
            guard self.isViewLoaded else {
                return
            }
            self.configureViewWithTicket(ticket)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customerViewExpandedHeight = self.customerViewHeightConstraint.constant
        self.hideCustomerDataView(animated:false)
    }
    
    private func configureViewWithTicket(_ ticket:TicketModel) {
        
    }
    
    @IBAction func showCustomerDataButtonPressed(_ sender: Any) {
        if self.customerDataIsHidden {
            self.showCustomerDataView(animated:true)
            self.showCustomerDataButton.setTitle("Hide Customer Data", for: .normal)
        }
        else {
            self.hideCustomerDataView(animated:true)
            self.showCustomerDataButton.setTitle("Show Customer Data", for: .normal)
        }
        self.customerDataIsHidden = !self.customerDataIsHidden
    }
    
    private func showCustomerDataView(animated:Bool) {
        self.customerViewHeightConstraint.constant = self.customerViewExpandedHeight
        
        if (animated) {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        else {
            self.view.layoutIfNeeded()
        }
    }
    
    private func hideCustomerDataView(animated:Bool) {
        let customerViewCompressedHeight = self.nameLabel.bounds.height + 16
        self.customerViewHeightConstraint.constant = customerViewCompressedHeight
        if (animated) {
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        else {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func editCustomerButtonPressed(_ sender: Any) {
        let customerDetailVC = UIStoryboard(name: "CustomerStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CustomerDetailViewControllerID") as! CustomerDetailViewController
        customerDetailVC.delegate = self
        
        let customerDetailNav = UINavigationController(rootViewController: customerDetailVC)
        customerDetailNav.modalPresentationStyle = .pageSheet
        customerDetailNav.navigationController?.navigationBar.isOpaque = true
        
        self.present(customerDetailNav, animated: true)
    }
}

//MARK: CustomerDetailViewControllerDelegate extension
internal extension TicketDetailViewController {
    func CustomerDetailViewControllerDidSave() {
        //
    }
    
    func CustomerDetailViewControllerDidPressCancel() {
        self.dismiss(animated: true)
    }
}

