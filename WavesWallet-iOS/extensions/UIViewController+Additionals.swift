//
//  UIViewController+Additionals.swift
//  WavesWallet-iOS
//
//  Created by Pavel Gubin on 4/26/18.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation
import UIKit
import RESideMenu


extension UIViewController {
    
    func createBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back"), style: .plain, target: self, action: #selector(backTapped))
    }
    
    func createMenuButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_menu"), style: .done, target: self, action: #selector(menuTapped))
    }
    
    func menuTapped() {
        let menu = AppDelegate.shared().window?.rootViewController as! RESideMenu
        menu.presentLeftMenuViewController()
    }
    
    func backTapped() {
        navigationController?.popViewController(animated: true)
    }

    func hideTopBarLine() {
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setupTopBarLine() {
        
        if let nav = navigationController {
            let showImage = nav.navigationBar.frame.size.height.rounded(.down) <= 44
            if showImage {
                if nav.navigationBar.shadowImage != nil {
                    nav.navigationBar.shadowImage = nil
                }
            }
            else {
                if nav.navigationBar.shadowImage == nil {
                    nav.navigationBar.shadowImage = UIImage()
                }
            }
        }
    }
    
    func setupSmallNavigationBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    
    func setupBigNavigationBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationItem.largeTitleDisplayMode = .never
        }
    }
}