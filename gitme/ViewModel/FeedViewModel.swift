//
//  FeedViewModel.swift
//  gitme
//
//  Created by Nick Bruinsma on 02/05/2019.
//  Copyright © 2019 appeeme. All rights reserved.
//

import UIKit
import RxSwift

class FeedViewModel {
    var dataSource: Observable<[Repo]>?
    
    var disposeBag = DisposeBag()
    
    func loadTableView(tableView: UITableView, completed: () -> ()) {
        fetchData()
        dataSource?
            .bind(to: tableView.rx.items(cellIdentifier: "feedRepoCell")) { (row, repo: Repo, cell: FeedRepoCell) in
            cell.configureCell(repo: repo)
            }
            .disposed(by: disposeBag)
        //TODO: FIX
        completed()
    }
    
    func fetchData() {
        dataSource = DownloadService.instance.downloadReposArray(url: trendingRepoURL)
    }
}
