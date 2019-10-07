//
//  Builder.swift
//
//  Created by Developer on 29.09.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  --------------------------------------------------------------------------------------
//  Builder Pattern:
//      It creates a complex object using different classes with a step by step approach
//      The goal of the builder pattern is to reduce the need to keep mutable state,
//          resulting in objects that are simpler and generally more predictable.
//      This way, we can vary the object's internal status during its creation process.
//      The core idea behind the builder pattern is that the process of setting up an object is
//          performed by a dedicated Builder type, rather than by the object itself.
//  --------------------------------------------------------------------------------------

import Foundation


class Article {
    
    private var title:String = ""
    private var subTitle:String = ""
    private var published:Date = Date()
    private var author:String = ""
    private var visualLink:String = ""
    private var content:String = ""
    
    func setTitle(_ title:String) { self.title = title }
    func setSubtitle(_ subTitle:String) { self.subTitle = subTitle }
    func setPublishedDate(_ publishedDate:Date) { self.published = publishedDate }
    func setAuthorName(_ authorName:String) { self.author = authorName }
    func setVisualLink(_ imageLink:String) { self.visualLink = imageLink }
    func setContent(_ imageLink:String) { self.visualLink = imageLink }
    
    func present() {
        print(
            "\n\(title)" +
            "\n\(subTitle)" +
            "\n\(published.description)" +
            "\n\(author)" +
            "\n\(visualLink)" +
            "\n\(content)"
        )
    }
}


class ArticleBuilder {
    
    private var model:Article
    
    init(_ withArticle:Article? = nil) {
        self.model = withArticle ?? Article()
    }
    
    @discardableResult
    func addTitle(_ title:String) -> ArticleBuilder {
        self.model.setTitle(title)
        return self
    }
    
    @discardableResult
    func addSubtitle(_ subTitle:String) -> ArticleBuilder {
        self.model.setSubtitle(subTitle)
        return self
    }
    
    @discardableResult
    func addPublishedDate(_ date:Date) -> ArticleBuilder {
        self.model.setPublishedDate(date)
        return self
    }
    
    @discardableResult
    func addAuthor(_ authorName:String) -> ArticleBuilder {
        self.model.setAuthorName(authorName)
        return self
    }
    
    @discardableResult
    func addVisualContent(_ visualLink:String) -> ArticleBuilder {
        self.model.setVisualLink(visualLink)
        return self
    }
    
    @discardableResult
    func addContent(_ content:String) -> ArticleBuilder {
        self.model.setContent(content)
        return self
    }
    
    @discardableResult
    func build() -> Article {
        return self.model
    }
    
}

print("\Builder pattern exercise begins!!")
print("\n ... \n ... \n ...  \n ...  \n ... ")

//Build basic article
let basicArticle = ArticleBuilder()
    .addTitle("Lorem Ipsum")
    .addAuthor("Name Surname")
    .addContent("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
    .build()

basicCampaign.present()

//Build anonymous article
let anonymousCampaign = CampaignBuilder()
    .addTitle("Lorem Ipsum")
    .addSubtitle("Lorem Ipsum")
    .addPublishedDate(Date())
    .addVisualContent("file:///loremipsum.jpeg")
    .addContent("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
    .build()

anonymousCampaign.present()

print("\n ... \n ... \n ...  \n ...  \n ... ")
print("\nDone!")
print("\nReady to enjoy!")
