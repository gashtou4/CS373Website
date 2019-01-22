import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Home Page
    router.get{ req -> Future<View> in
        let context = PageContext(currentPage: "home", scripts: ["scripts/carouselScript.js"])
        return try req.view().render("home", context)
    }
    // Contact Page
    router.get("Contact") { req -> Future<View> in
        let context = PageContext(currentPage: "contact")
        return try req.view().render("contact", context)
    }
    router.get("Writeups") {req -> Future<View> in
        let context = WriteupsContext(currentPage: "writeups", availableWriteups: [1,2])
        return try req.view().render("writeups", context)
    }
    router.get("Writeup", Int.parameter) {req -> Future<View> in
        let writeupNum = try req.parameters.next(Int.self)
        let context = WriteupContext(currentPage: "writeup\(writeupNum)", writeupNum: writeupNum)
        return try req.view().render("writeup\(writeupNum)", context)
    }
//    // Projects Page
//    router.get("Projects") { req -> Future<View> in
//        let context = PageContext(currentPage: "project")
//        return try req.view().render("projects", context)
//    }
//    // Experience Page
//    router.get("Experience") { req -> Future<View> in
//        let context = ExperienceContext(currentPage: "experience", scripts:["scripts/typingScript.js"], experiences: ["C#: 3 Years Education, 1 Year Professional","SQL: 1 Year Professional","C++: 3 Years Education","Swift: 1 Year Self-taught"])
//        return try req.view().render("experience", context)
//    }
}

struct WriteupContext: Codable {
    init(currentPage:String, writeupNum:Int) {
        CurrentPage = currentPage
        Scripts = []
        WriteupNum = writeupNum
    }
    init(currentPage:String, scripts:[String], writeupNum:Int) {
        CurrentPage = currentPage
        Scripts = scripts
        WriteupNum = writeupNum
    }
    var CurrentPage: String
    var Scripts: [String]
    var WriteupNum: Int
}

struct WriteupsContext: Codable {
    init(currentPage:String, availableWriteups:[Int]) {
        CurrentPage = currentPage
        Scripts = []
        Writeups = availableWriteups
    }
    init(currentPage:String, scripts:[String], availableWriteups:[Int]) {
        CurrentPage = currentPage
        Scripts = scripts
        Writeups = availableWriteups
    }
    var CurrentPage: String
    var Scripts: [String]
    var Writeups: [Int]
}

struct PageContext: Codable {
    init(currentPage:String) {
        CurrentPage = currentPage
        Scripts = []
    }
    init(currentPage:String, scripts:[String]) {
        CurrentPage = currentPage
        Scripts = scripts
    }
    var CurrentPage: String
    var Scripts: [String]
}
