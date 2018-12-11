//
//  APIMethods.swift
//  Kinopoisk
//
//  Created by Aleksey Shabrov on 28/09/2018.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation

struct APIMethods {
    enum AuthCodes: URLPathConvertable {
        case base
        case status
        case uid(String)
        
        func pathString() -> String {
            switch self {
            case .base:
                return "/auth-codes"
            case .status:
                return "/auth-codes/status"
            case let .uid(code):
                return "/auth-codes/" + code + "/uid"
            }
        }
    }
    
    enum Devices: URLPathConvertable {
        case deviceToken
        
        func pathString() -> String {
            switch self {
            case .deviceToken:
                return "/device-tokens"
            }
        }
    }
    
    enum Selection: URLPathConvertable {
        case home
        
        func pathString() -> String {
            switch self {
            case .home:
                return "/home"
            }
        }
    }
    
    enum Suggest: URLPathConvertable {
        case suggestedData
        
        func pathString() -> String {
            switch self {
            case .suggestedData:
                return "/suggested-data"
            }
        }
    }
    
    enum UserProfile: URLPathConvertable {
        case createProfile
        case getProfile
        case getProfileSubscription
        
        func pathString() -> String {
            switch self {
            case .createProfile:
                return "/profiles"
            case .getProfile:
                return "/profiles/me"
            case .getProfileSubscription:
                return "/profiles/me/subscription"
            }
        }
    }
    
    enum Films: URLPathConvertable {
        case films
        case filmsByContentId(String)
        case filmsRecommendationsByContentId(String)
        case filmsVoteByUIID(String)
        
        func pathString() -> String {
            switch self {
            case .films:
                return "/films"
            case let .filmsByContentId(contentId):
                return "/films/" + contentId
            case let  .filmsRecommendationsByContentId(contentId):
                return "/films/" + contentId + "/recommendations"
            case let .filmsVoteByUIID(uuid):
                return "/films/" + uuid + "/vote"
            }
        }
    }
    
    enum Persons: URLPathConvertable {
        case filmography(Int)
        
        func pathString() -> String {
            switch self {
            case let .filmography(persionId):
                return "/persons/\(persionId)/filmography"
            }
        }
    }
    
    enum Support: URLPathConvertable {
        case contactInformation
        case userAgreement
        
        func pathString() -> String {
            switch self {
            case .contactInformation:
                return "/contact-information"
            case .userAgreement:
                return "/user-agreement"
            }
        }
    }
    
    enum Purchases: URLPathConvertable {
        case purchasesList
        case purchasedFilm(String)
        
        func pathString() -> String {
            switch self {
            case .purchasesList:
                return "/purchases"
            case let .purchasedFilm(uuid):
                return "/purchases/" + uuid
            }
        }
    }
}
