//
//  TestTableViewController.swift
//  StackViewTest
//
//  Created by Sujananth Visvaratnam on 23/05/20.
//  Copyright © 2020 Sujananth Visvaratnam. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let nib = UINib(nibName: "StackViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "StackViewCell")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StackViewCell", for: indexPath) as? StackViewCell
        cell?.configure()
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
}

extension TestTableViewController: StackViewCellDelegate {
    func didUpdated() {
        UIView.performWithoutAnimation {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
}
