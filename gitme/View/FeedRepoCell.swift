//
//  FeedRepoCell.swift
//  gitme
//
//  Created by Nick Bruinsma on 01/05/2019.
//  Copyright © 2019 appeeme. All rights reserved.
//

import UIKit
import RxSwift

class FeedRepoCell: UITableViewCell {
    
    var disposeBag = DisposeBag()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var forksNrLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var contributorsNrLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var viewReadMeButton: RoundedBorderButton!
    
    private var repoURL: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(repo: Repo) {
        let imageURL = repo.owner.avatar_url
        DownloadService.instance.downloadAvatarImage(avatarURL: imageURL).bind(to: repoImageView.rx.image).disposed(by: disposeBag)
        nameLabel.text = repo.name
        descriptionLabel.text = repo.description
        forksNrLabel.text = "\(repo.forks)"
        languageLabel.text = repo.language
        contributorsNrLabel.text = "\(repo.watchers)"
        repoURL = repo.html_url
    }
    
    override func layoutSubviews() {
        backView.layer.cornerRadius = 15
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backView.layer.shadowOpacity = 0.25
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
