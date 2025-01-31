## Uniqcast app

Flutter code challenge app for fetching TV program data for up to 2 days provided by XML file.
As starting point I implemented my flutter starter project that I use for every new project (I used this skeleton in previous companies that is not originally mine but in same cases I adapted skeleton to my needs).
It contains all the starting packages:

    hooks_riverpod
    Freezed
    dartz
    Equatable
    build_runner
    dio
    intl
    Retrofit
    Flutter Flavorizr
    flutter_lints
    json_serializable
    mockito


### App Architecture

App uses flutter clean architecture design pattern that helps maintain a separation of concerns, making app scalable, testable and easy to maintain. It is implemented using a layered approach. Data layer (Repositories and APIs), domain layer (Logic), presentation layer (UI).
Also, I used flutter_architecture package which is set of reusable classes that speed up development time and reduce unnecessary boilerplate code. It is also package that I used in past companies and it is not originally mine but I am using it for every private projects. It contains different notifiers, states and other things to avoid writing
repetitive code and access global loading and failure handling. Feel free to look at it in external libraries.

### Implementaion
As task requires, I use Riverpod for state management, hooks riverpod for manage widget states etc. For data modeling I decided to use Equtable than Freezed because for my opinion it is more elegant in this situation and more cleaner than freezed and its generated code.
For data caching I used flutter package Hive for storing xml data in the local storage.


### Running the Application

Flutter skeleton project has all environments already setup (dev, stagging, production). I know that this is not required by the task but it is part of this skeleton so I didn't want to remove it.

For running the app use this command: flutter run --flavor prod -t lib/main/main_prod.dart




