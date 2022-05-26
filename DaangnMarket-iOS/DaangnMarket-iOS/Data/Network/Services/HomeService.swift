//
//  HomeService.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/25.
//

import Foundation

import Alamofire

class HomeService: BaseService {
    static let shared = HomeService()
    
    private override init() {}
}

extension HomeService {
    
    func getPostDetail(postId: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFManager.request(HomeRouter.getPostDetail(postId: postId)).responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return}
                let networkResult = self.judgeStatus(by: statusCode, data, type: PostDetail.self, decodingMode: .model)
                completion(networkResult)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
