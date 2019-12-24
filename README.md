# KituraOrmMySQL
A small project demonstrating the usage of the Kitura Backend with MySQL

After reading this great article from raywenderlich.com https://www.raywenderlich.com/1079484-kitura-tutorial-getting-started-with-server-side-swift I decided to create a small sample project which shows how to setup an API Interface with a MySQL database. 

The class HeaderMiddleware.swift contains a small example how to use a Header for example to pass a authentication hash to secure the API. An algorithm for authentication is not implemented yet. But the main goal was to show how it can be used in a Kitura Backend. The usage can be found in AcronymRoutes.swift in the method `getAcronyms`. 

In the App class (Application.swift) is also an example how https certificates can be used for the Kitura backend (method `run`). 

### Setup this project

After cloning this project it is necessary to do the following steps:

- build project and load all dependencies with `swift build`
- generate an XCode Project file `swift package generate-xcodeproj`

You also need to install Kitura on your machine. 

The simpliest way to do this on OSX is to use Homebrew.

```
brew tap ibm-swift/kitura
brew install kitura
kitura init
```

It is also necessary to have MySQL installed on your machine. After installing and setup you can create a database (for example `swiftBackendTest`) and import the dump sql file from this project. After that this project should work on your machine.

### Methods working after Setup:

- GET Request: 

```
curl -k -H 'Auth-Header-Hash: testtest' http://localhost:8080/acronyms | jsonpp
```
- PUT Request: 

```
curl -X PUT http://localhost:8080/acronyms/2 -H 'content-type: application/json' -d '{"short_value":"VG", "long_value":"Viele Grueeeeessseeee"}' | jsonpp
```
- DELETE Request: 

```
curl -X DELETE http://localhost:8080/acronyms/2 | jsonpp
```
- POST Request: 

```
curl -k -X POST http://localhost:8080/acronyms -H 'content-type: application/json' -d '{"shortValue":"DE", "longValue":"Germany"}' | jsonpp
```

## License 

This project is published under the Apache 2.0 license
