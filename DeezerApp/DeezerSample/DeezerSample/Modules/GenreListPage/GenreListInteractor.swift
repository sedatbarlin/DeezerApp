//
//  GenreListInteractor.swift
//  DeezerSample
//
//  Created by Sedat on 8.05.2023.
//

import Foundation

protocol GenreListInteractorOutput: AnyObject {
    func handleSearchResult(with result: Result<[GenreResponse], ApiError>)
}

protocol GenreListInteractorProtocol {
    func getGenres()
}

final class GenreListInteractor {
    weak var output: GenreListInteractorOutput?
}

extension GenreListInteractor: GenreListInteractorProtocol {
    func getGenres() {
        let service = ApiService<ApiResponseWithInData<[GenreResponse]>>()
        let request = GenreListRequest()
        
        service.getData(request: request) { (result) in
            switch result {
            case .success(let data):
                self.output?.handleSearchResult(with: .success(data.data))
            case .failure(let error):
                self.output?.handleSearchResult(with: .failure(error))
            }
        }
    }
}
