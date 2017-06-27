//
//  CustomerSearchResultTableViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class CustomerSearchResultTableViewController: UITableViewController, TitleDetailSectionViewDelegate, CustomerOptionTableViewCellDelegate, CustomerDetailViewControllerDelegate {
    
    //rows are expanded options when selected
    private enum CustomerSearchResultTableViewRow:Int {
        case editCustomer = 0
        case measurements = 1
    }
    
    private var expandedSections:Dictionary<Int,Bool> = [:]
    private let customerOptionCellId = "customerOptionCellId"
    
    var customers = [CustomerModel]() {
        didSet {
            guard self.isViewLoaded else {
                return
            }
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "CustomerOptionTableViewCell", bundle: nil), forCellReuseIdentifier: self.customerOptionCellId)
    }
    
    //MARK: - Expanded Table Helpers
    func isSectionExpanded(section:Int) -> Bool {
        if self.expandedSections[section] == true {
            return true
        }
        return false
    }
    
    func toggleSection(section:Int) {
        if self.expandedSections[section] == nil || self.expandedSections[section] == false {
            self.expandedSections[section] = true
        }
        else {
            self.expandedSections[section] = false
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return customers.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.expandedSections[section] == true {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader:TitleDetailSectionView = UIView.fromNib()
        let customer = self.customers[section]
        sectionHeader.delegate = self
        sectionHeader.section = section
        sectionHeader.setLabels(title: customer.firstName, detail: customer.lastName)
        
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.customerOptionCellId, for: indexPath) as! CustomerOptionTableViewCell
        cell.customer = self.customers[indexPath.section]
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
}

//MARK: TitleDetailSectionViewDelegate
extension CustomerSearchResultTableViewController {
    func titleDetailSectionViewTapped(sectionView: TitleDetailSectionView) {
        self.toggleSection(section: sectionView.section)
        self.tableView.reloadSections(IndexSet(integer:sectionView.section), with: .automatic)
    }
}

//MARK: - CustomerOptionTableViewCellDelegate
extension CustomerSearchResultTableViewController {
    func CustomerOptionTableViewCellDidPressEditCustomer(cell: CustomerOptionTableViewCell) {
        let customerDetailVC = UIStoryboard(name: "CustomerStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CustomerDetailViewControllerID") as! CustomerDetailViewController
        customerDetailVC.delegate = self
        
        let customerDetailNav = StyledNavigationController(rootViewController: customerDetailVC)
        customerDetailNav.modalPresentationStyle = .pageSheet
        customerDetailNav.navigationController?.navigationBar.isTranslucent = false
        
        self.present(customerDetailNav, animated: true)
    }
    
    func CustomerOptionTableViewCellDidPressMeasurements(cell: CustomerOptionTableViewCell) {
        
    }
}

//MARK: - CustomerDetailViewControllerDelegate
extension CustomerSearchResultTableViewController {
    func CustomerDetailViewControllerDidPressCancel() {
        self.dismiss(animated: true)
    }
    
    func CustomerDetailViewControllerDidSave() {
        
    }
}
