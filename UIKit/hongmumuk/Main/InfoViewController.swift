//
//  InfoViewController.swift
//  hongmagip_ios
//
//  Created by Dongwan Ryoo on 2023/09/01.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    //MARK: - UI ProPerties
    let mainView = InfoView()
    
    //MARK: - Define Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetView()
        Constraint()
    }
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    func SetView() {
        self.view.backgroundColor = .white
        mainView.githubButton.addTarget(self, action: #selector(githubButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func githubButtonClicked() {
        guard let url = URL(string: "https://www.notion.so/lyoodong/702ccffff6e4416688ec72622259faa6")
        else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func Constraint() {
        
    }
  

}
