//
//  EmojiArtModel.Background.swift
//  EmojiArt_Lectures
//
//  Created by Dmitry Pyzhov on 31.01.2022.
//

import Foundation

extension EmojiArtModel {
    enum Background: Equatable, Codable {
        case blank
        case url(URL)
        case imageData(Data)
        
        var url: URL? {
            switch self {
            case .url(let url): return url
            default: return nil
            }
        }
        
        var imageData: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
        
        init(from decoder: Decoder) throws {
            let contaner = try decoder.container(keyedBy: CodingKeys.self)
            if let url = try? contaner.decode(URL.self, forKey: .url) {
                self = .url(url)
            } else if let data = try? contaner.decode(Data.self, forKey: .imageData) {
                self = .imageData(data)
            } else {
                self = .blank
            }
        }
        
        enum CodingKeys: CodingKey {
            case url
            case imageData
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case .url(let url): try container.encode(url, forKey: .url)
            case .imageData(let data): try container.encode(data, forKey: .imageData)
            case .blank: break
            }
        }
    }
}
