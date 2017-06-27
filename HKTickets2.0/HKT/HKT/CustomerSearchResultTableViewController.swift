//
//  CustomerSearchResultTableViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class CustomerSearchResultTableViewController: UITableViewController, TitleDetailSectionViewDelegate {
    
    //rows are expanded options when selected
    private enum CustomerSearchResultTableViewRow:Int {
        case editCustomer = 0
        case measurements = 1
    }
    
    private var expandedSections:Dictionary<Int,Bool> = [:]
    private let indentationCellId = "indentationCellId"
    
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
        
        self.tableView.register(UINib(nibName: "IndentedLabelTableViewCell", bundle: nil), forCellReuseIdentifier: self.indentationCellId)
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
            return 2
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
        let cell = tableView.dequeueReusableCell(withIdentifier: self.indentationCellId, for: indexPath) as! IndentedLabelTableViewCell
        
        switch (indexPath.row) {
        case CustomerSearchResultTableViewRow.editCustomer.rawValue:
            cell.mainTitleLabel.text = "Edit Customer"
        case CustomerSearchResultTableViewRow.measurements.rawValue:
            cell.mainTitleLabel.text = "View Measurements"
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
    }
    
    //MARK: TitleDetailSectionViewDelegate
    func titleDetailSectionViewTapped(sectionView: TitleDetailSectionView) {
        self.toggleSection(section: sectionView.section)
        self.tableView.reloadSections(IndexSet(integer:sectionView.section), with: .automatic)
    }

}
