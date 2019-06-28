//
//  DownloadService.swift
//  gitme
//
//  Created by Nick Bruinsma on 01/05/2019.
//  Copyright © 2019 appeeme. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import RxSwift

enum FailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}

class DownloadService {
    static let instance = DownloadService()
    
    func downloadReposArray(url: String) -> Observable<[Repo]> {
        return Observable.create { observer -> Disposable in
            Alamofire.request(url)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            observer.onError(response.error ?? FailureReason.notFound)
                            return
                        }
                        do {
                            let result = try JSONDecoder().decode(RootJSON.self, from: data)
                            
                            observer.onNext(result.items)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode, let reason = FailureReason(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
    
    func downloadAvatarImage(avatarURL: String) -> Observable<UIImage> {
        return Observable.create({ (observer) -> Disposable in
            Alamofire.request(avatarURL)
                .validate()
                .responseImage { response in
                    switch response.result {
                    case .success:
                        guard let image = response.result.value else {print("Cannot cast result to image"); return}
                        observer.onNext(image)
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        })
    }
}
