//
//  FeedVC.swift
//  gitme
//
//  Created by Nick Bruinsma on 01/05/2019.
//  Copyright © 2019 appeeme. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RevealingSplashView

class FeedVC: UIViewController {
    
    var revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "github-icon")!, iconInitialSize: CGSize(width: 50, height: 50), backgroundColor: UIColor.white)
    
    var viewModel: FeedViewModel!
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FeedViewModel()
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        viewModel.loadTableView(tableView: tableView) {
            // End Splash View animation
            self.revealingSplashView.heartAttack = true
        }

    }
    
}
