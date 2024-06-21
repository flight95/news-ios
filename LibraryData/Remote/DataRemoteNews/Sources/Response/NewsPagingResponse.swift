//
//  NewsPagingResponse.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

class NewsPagingResponse: Decodable {
    var totalResults: Int64? = nil
    var articles: [NewsResponse]? = nil
    
    enum CodingKeys: String, CodingKey {
        case totalResults
        case articles
    }
    
    class NewsResponse: Decodable {
        var source: SourceResponse? = nil
        var author: String? = nil
        var title: String? = nil
        var description: String? = nil
        var content: String? = nil
        var url: String? = nil
        var urlToImage: String? = nil
        var publishedAt: String? = nil
        
        enum CodingKeys: String, CodingKey {
            case source
            case author
            case title
            case description
            case content
            case url
            case urlToImage
            case publishedAt
        }
        
        class SourceResponse: Decodable {
            var id: String? = nil
            var name: String? = nil
            
            enum CodingKeys: String, CodingKey {
                case id
                case name
            }
        }
    }
}
