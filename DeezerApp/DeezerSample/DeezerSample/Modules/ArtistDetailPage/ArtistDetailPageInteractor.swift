//
//  ArtistDetailPageInteractor.swift
//  DeezerSample
//
//  Created by Sedat on 11.05.2023.
//

import Foundation

protocol ArtistDetailPageInteractorProtocol {
    func getArtistDetail(at id: String)
    func getArtistAlbums(at id: String)
    func getArtistRelated(at id: String)
}

final class ArtistDetailPageInteractor {
    weak var output: ArtistDetailInteractorOutput?
}

extension ArtistDetailPageInteractor: ArtistDetailPageInteractorProtocol {
    func getArtistDetail(at id: String) {
        let service = ApiService<ArtistResponse>()
        let request = ArtistDetailRequest(id: id)
        service.getData(request: request) { (result) in
            switch result {
            case .success(let data):
                self.output?.handleDetailResult(with: .success(data))
            case .failure(let error):
                self.output?.handleDetailResult(with: .failure(error))
            }
        }
    }
    
    func getArtistAlbums(at id: String) {
        let service = ApiService<ApiResponseWithInData<[AlbumResponse]>>()
        let request = ArtistAlbumsRequest(id: id)
        service.getData(request: request) { (result) in
            switch result {
            case .success(let data):
                self.output?.handleAlbumsResult(with: .success(data.data))
            case .failure(let error):
                self.output?.handleAlbumsResult(with: .failure(error))
            }
        }
    }
    
    func getArtistRelated(at id: String) {
        let service = ApiService<ApiResponseWithInData<[ArtistResponse]>>()
        let request = ArtistRelatedRequest(id: id)
        service.getData(request: request) { (result) in
            switch result {
            case .success(let data):
                self.output?.handleRelatedResult(with: .success(data.data))
            case .failure(let error):
                self.output?.handleRelatedResult(with: .failure(error))
            }
        }
    }
}
