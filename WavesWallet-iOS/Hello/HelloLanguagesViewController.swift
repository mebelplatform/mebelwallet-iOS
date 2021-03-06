//
//  LanguagesViewController.swift
//  WavesWallet-iOS
//
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import UIKit

class HelloLanguagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var continueBtn: UIButton!
    
    let languages = DataManager.getLanguages()
    
    var chosenIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0)
        continueBtn.alpha = 0
    }
    
    @IBAction func continueWasPressed(_ sender: Any) {
        let nextVC = StoryboardManager.HelloStoryboard().instantiateViewController(withIdentifier: "InfoPagesViewController") as! InfoPagesViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableCellIdentifier", for: indexPath) as! LanguageTableCell
        
        let item = languages[indexPath.row]
        cell.labelTitle.text = item["title"]
        cell.iconLanguage.image = UIImage(named: item["icon"]!)
        
        if let index = chosenIndexPath, index == indexPath {
            cell.iconCheckmark.image = UIImage(named: "on")
        }
        else {
            cell.iconCheckmark.image = UIImage(named: "off")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenIndexPath = indexPath
        tableView.reloadData()

        tableViewBottomConstraint.constant = 62
        UIView.animate(withDuration: 0.3) {
            self.continueBtn.alpha = 1.0
        }
    }
}
