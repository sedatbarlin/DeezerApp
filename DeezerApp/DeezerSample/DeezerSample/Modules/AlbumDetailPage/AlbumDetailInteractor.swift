//
//  AlbumDetailInteractor.swift
//  DeezerSample
//
//  Created by Sedat on 12.05.2023.
//

import Foundation

protocol AlbumDetailInteractorProtocol {
    func getTracks(at id: String)
}

final class AlbumDetailInteractor {
    weak var output: AlbumDetailInteractorOutput?
}

extension AlbumDetailInteractor: AlbumDetailInteractorProtocol {
    func getTracks(at id: String) {
        let service = ApiService<AlbumDetailResponse>()
        let request = AlbumDetailRequest(id: id)
        service.getData(request: request) { (result) in
            switch result {
            case .success(let data):
                self.output?.handleAlbumDetail(with: .success(data))
            case .failure(let error):
                self.output?.handleAlbumDetail(with: .failure(error))
            }
        }
    }
}
