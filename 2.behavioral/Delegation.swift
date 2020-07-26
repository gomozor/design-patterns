//  Delegation.swift
//  patterns
//
//  Created by Developer on 26.07.2020.
//  Copyright © 2020 Ramazan Demir. All rights reserved.
//  ------------------------------------------------------------------------------------------------------------------------------
//  Delegation Pattern:
//      Delegation is like inheritance done manually through object composition.
//      It is a technique where an object expresses certain behavior to the outside but in reality delegates perform the behavior.
//  -------------------------------------------------------------------------------------------------------------------------------
  
import Foundation




//MARK: Models
enum OutputType: String { case text, image, video }

class File {
    var type: OutputType
    init(type: OutputType) {
        self.type = type
    }
}


//MARK: Abstraction
protocol SearchEngineDelegate {
    func doSearch(input: String) -> [File]
}


//MARK: Services
class TextSearchService: SearchEngineDelegate {
    func doSearch(input: String) -> [File] {
        return Array<File>(arrayLiteral: File(type: .text), File(type: .text), File(type: .text))
    }
}

class ImageSearchService: SearchEngineDelegate {
    func doSearch(input: String) -> [File] {
        return Array<File>(arrayLiteral: File(type: .image), File(type: .image), File(type: .image))
    }
}

class VideoSearchService: SearchEngineDelegate {
    func doSearch(input: String) -> [File] {
        return Array<File>(arrayLiteral: File(type: .video), File(type: .video), File(type: .video))
    }
}


//MARK: Operation
class SearchEngine {
    
    static var shared = SearchEngine()
    var delegate: SearchEngineDelegate?
    
    init() { }
    
    func search(input: String, outputType: OutputType) -> [File]? {
        switch outputType {
            case .text:
                delegate = TextSearchService()
                break
            case .image:
                delegate = ImageSearchService()
                break
            case .video:
                delegate = VideoSearchService()
                break
        }
        return delegate?.doSearch(input: input)
    }
    
}
