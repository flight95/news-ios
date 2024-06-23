# News for iOS

![Static Badge](https://img.shields.io/badge/Clean%20Architecture-purple)
![Static Badge](https://img.shields.io/badge/SwiftUI-purple)
![Static Badge](https://img.shields.io/badge/Combine-purple)   
![Static Badge](https://img.shields.io/badge/Swift-5-red)
![Static Badge](https://img.shields.io/badge/SwiftLint-0.55.1-red)   
![Static Badge](https://img.shields.io/badge/Realm-10.52.0-red)
![Static Badge](https://img.shields.io/badge/Alarmofire-5.9.1-red)
![Static Badge](https://img.shields.io/badge/Kingfisher-7.12.0-red)

- https://newsapi.org
- Search worldwide news with code.
  Locate articles and breaking news headlines from news sources and blogs across the web with our JSON API.

&nbsp;

## Authentication

- You need to register `news.api.key` in your `\NewsApplication\NewsApplication\local.xcconfig` file.
- NEWS_API_KEY = `API key issued by the site`

&nbsp;

## Top headlines API

- ![Static Badge](https://img.shields.io/badge/GET-blue) [https://newsapi.org/v2/top-headlines?country=kr&apiKey={authorization}&page={page}&pageSize={size}](https://newsapi.org/docs/endpoints/top-headlines)

&nbsp;

## Clean Architecture Modules

![Static Badge](https://img.shields.io/badge/application-grey)   
![Static Badge](https://img.shields.io/badge/view-home-red)
![Static Badge](https://img.shields.io/badge/view-news-red)
![Static Badge](https://img.shields.io/badge/view-core-purple)   
![Static Badge](https://img.shields.io/badge/presenter-home-red)
![Static Badge](https://img.shields.io/badge/presenter-model.news-darkred)
![Static Badge](https://img.shields.io/badge/presenter-core-purple)   
![Static Badge](https://img.shields.io/badge/domain-news-red)
![Static Badge](https://img.shields.io/badge/domain-model.news-darkred)
![Static Badge](https://img.shields.io/badge/domain-model.core-purple)   
![Static Badge](https://img.shields.io/badge/data-news-red)
![Static Badge](https://img.shields.io/badge/data-core-purple)  
![Static Badge](https://img.shields.io/badge/data.remote-news-red)
![Static Badge](https://img.shields.io/badge/data.remote-core-purple)  
![Static Badge](https://img.shields.io/badge/data.cache-news-red)
![Static Badge](https://img.shields.io/badge/data.cache-database.news-darkred)
![Static Badge](https://img.shields.io/badge/data.cache-database-purple)

- TODO: NOT YET   
![Static Badge](https://img.shields.io/badge/presenter-model.news-darkred)
![Static Badge](https://img.shields.io/badge/presenter-core-purple)   
![Static Badge](https://img.shields.io/badge/data-core-purple)   

- [Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

### Dependencies

![Clean Architecture](https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)

- Set up dependencies in ![Static Badge](https://img.shields.io/badge/presenter-home-red) module.
- I implemented it myself without using the library.


#### View &rarr; Presenter &rarr; Domain

![Static Badge](https://img.shields.io/badge/view-news-red)   
![Static Badge](https://img.shields.io/badge/view-home-red) &rarr;
![Static Badge](https://img.shields.io/badge/presenter-home-red) &rarr;
![Static Badge](https://img.shields.io/badge/domain-news-red)

#### Data source &rarr; Repository &rarr; Domain

![Static Badge](https://img.shields.io/badge/data.remote-news-red)   
![Static Badge](https://img.shields.io/badge/data.cache-news-red) &rarr;
![Static Badge](https://img.shields.io/badge/data-news-red) &rarr;
![Static Badge](https://img.shields.io/badge/domain-news-red)

### About Data Layer

![Data Layer](https://developer.android.com/static/topic/libraries/architecture/images/mad-arch-data-overview.png)
- https://developer.android.com/topic/architecture/data-layer

&nbsp;

## Using Swift Package Manager

- https://developer.apple.com/documentation/Xcode/swift-packages

&nbsp;

## Pagination Package

- I implemented the pagination-related packages myself.
- https://github.com/flight95/news-ios/tree/master/PagingLibrary

&nbsp;

## Kingfisher and Image cache

- Do not use [Cache Key](https://github.com/onevcat/Kingfisher/wiki/Cheat-Sheet#check-whether-an-image-in-the-cache).
- Use [Disk Storage](https://github.com/onevcat/Kingfisher/wiki/Cheat-Sheet#set-limit-for-cache) max size:
  [KingfisherManager.shared.cache.diskStorage.config.sizeLimit](https://github.com/onevcat/Kingfisher/blob/master/Sources/Cache/DiskStorage.swift)
- Skip memory cache.
- In most cases, once an image has been loaded, it is fetched from the cache without being downloaded again.
- This will force the image URL to change from HTTP to HTTPS,
  but depending on the image server, an Error may be thrown.

&nbsp;

## Paging with Realm and Remote API

1. Check entities in Room.
2. If empty, call remote API.
3. Add response data in Room.
4. Get added entities in Room.

- I chose Realm because CoreData is too inconvenient to write.
- First, I had to move the DAO to cache-new instead of database-news because I couldn't use queries differently from Android Room.
- The main problem was that the threads had to be identical to work, so transactions had to be implemented in the cache layer to work with Combine.
- TODO: I think we should change to using CoreData.

&nbsp;

## Support for device orientation.

- On the portrait, it displays in one column, then three columns for landscape.

&nbsp;

## Check viewed news.

- Load news in a full-screen in-app WebView.
- Many news webpages are not optimized for mobile, so we display loading status indicators and convert to https from http.
- TODO: [NSAppTransportSecurity](https://developer.apple.com/documentation/bundleresources/information_property_list/nsapptransportsecurity) is recommended.
- Record the news you saw.
- For better usability, refresh the screen before recording, and rollback if recording fails.

&nbsp;

## Support Swipe Refresh.

- Clear all cached news and viewed history.
- And refresh news contents.

&nbsp;

## TODO: Log streaming.

- If you see the message `Logging Error: Failed to initialize logging system.`, you need to modify `IDEPreferLogStreaming=YES`.

&nbsp;

## TODO: DI for [Uber Needle](https://github.com/uber/needle).

- Needle is a dependency injection (DI) system for Swift.
- Unlike other DI frameworks, such as Cleanse, Swinject, Needle encourages hierarchical DI structure and utilizes code generation to ensure compile-time safety.
- This allows us to develop our apps and make code changes with confidence.
- If it compiles, it works. In this aspect, Needle is more similar to Dagger for the JVM.

&nbsp;

## TODO: [Logging](https://developer.apple.com/documentation/os/logging).

- Using [OSLog](https://developer.apple.com/documentation/os/oslog)

&nbsp;

## TODO: MVI Architecture for UI state holders

- As more requirements are placed on a screen, it becomes difficult to manage the state of the screen.
- If state management becomes difficult at the Presenter Layer of a Clean Architecture, using an MVI Architecture at that layer makes it easier to manage state.

### [UI Layer](https://developer.android.com/topic/architecture/ui-layer)

![UI Layer](https://developer.android.com/static/topic/libraries/architecture/images/mad-arch-ui-overview.png)

###  [Redux Fundamentals, Part 2: Concepts and Data Flow](https://redux.js.org/tutorials/fundamentals/part-2-concepts-data-flow/)

![Redux](https://redux.js.org/assets/images/ReduxDataFlowDiagram-49fa8c3968371d9ef6f2a1486bd40a26.gif)

### [ReactorKit](https://github.com/ReactorKit/ReactorKit)

- ReactorKit is a framework for a reactive and unidirectional Swift application architecture.
- This repository introduces the basic concept of ReactorKit and describes how to build an application using ReactorKit.
