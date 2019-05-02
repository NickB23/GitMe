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
    
    var dataSource: Observable<[Repo]>?
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        fetchData()
        dataSource?.bind(to: tableView.rx.items(cellIdentifier: "feedRepoCell")) { (row, repo: Repo, cell: FeedRepoCell) in
            cell.configureCell(repo: repo)
            // End Splash View animation
            self.revealingSplashView.heartAttack = true
            }.disposed(by: disposeBag)
    }
    
    func fetchData() {
        dataSource = DownloadService.instance.downloadReposDictArray(url: trendingRepoURL)
    }
}
