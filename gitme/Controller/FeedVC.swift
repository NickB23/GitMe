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

class FeedVC: UIViewController {
    
    var dataSource: Observable<[Repo]>?
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        dataSource?.bind(to: tableView.rx.items(cellIdentifier: "feedRepoCell")) { (row, repo: Repo, cell: FeedRepoCell) in
            cell.configureCell(repo: repo)
            }.disposed(by: disposeBag)
    }
    
    func fetchData() {
        dataSource = DownloadService.instance.downloadReposDictArray(url: trendingRepoURL)
    }
}
