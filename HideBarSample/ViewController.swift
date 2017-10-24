//
//  ViewController.swift
//  HideBarSample
//
//  Created by DerekYang on 2017/10/24.
//  Copyright © 2017年 LBD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let identifier = "cell"
    var hidingNavBarManager: HidingNavigationBarManager?
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        view.addSubview(tableView)
        
        self.hidingNavBarManager = HidingNavigationBarManager(viewController: self, scrollView: tableView)
        if let tabBar = self.tabBarController?.tabBar {
            self.hidingNavBarManager?.manageBottomBar(tabBar)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate
{
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        hidingNavBarManager?.shouldScrollToTop()
        
        return true
    }
}

extension ViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "row \((indexPath as NSIndexPath).row)"
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
}
