// Playground - noun: a place where people can play

print("Hello, world")

// Variables and Constants

var myVariable = 42
myVariable = 50

var mutableString = "This is a variable string"
let constString = "This is a constant"

let myConstant = 42
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 70

let label = "The width is"
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let friend = "float "
let numberFloat = 55.6
let greet = "Hey \(friend)"

// Initializing and Empty String
var emptyString = ""
var anotherEmptyString = String()
// these two strings are both empty, and are equivalent to each other”

// Boolean isEmpty property
if emptyString.isEmpty {
    print("Nothing to see here")
}

// Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)

// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double (multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"


// Tuples
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

// Decompose a Tuple's content
let (statusCode, statusMessage) = http404Error

// Arrays and Dictionaries
var shoppingList = ["swordfish", "water", "beer", "books"]

class aSwiftClass {
    var ourArray:[String] = []
    func aMethod(anArray: [String]) {
        self.ourArray  = ["one", "Two", "Three"]
    }
}

shoppingList[1] = "bottle of water"

var occupations = [
    "Fatih":"Developer",
    "Neco":"Engineer",
]
occupations


occupations["jayne"] = "Public Relations"

// To create an empty array or dictionary

let emptyArray = [String]()
let emptyDictionary = Dictionary<String, Float>()

shoppingList = []
occupations = [:]


let oneToFour = [1, 4, 3, 2]
if let firstNumber = oneToFour.lazy.map({ $0 * 3}).first {
    print(firstNumber)
}


let listOfNumbersSorted = oneToFour.lazy.sort()


print(listOfNumbersSorted)

let optionalValue: String? = "optional string"
//optionalValue = nil
print(optionalValue!)


// Control Flows

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

for (name, role) in occupations {
    print("\(name): \(role)")
}

// Optional value either contains a value or contains nil
var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "Fatih"
//var nilName: String? = nil
var greeting = "Hello"
var greetingSurName:String
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let nilName:String? = nil
if let surName = nilName {
    greetingSurName = "Hello, Mr. \(surName)"
} else {
    // Optional does not have a value
}


// Switch case
// no need to break! Supports any kind of data
let aNumber = "Four or Five"
switch aNumber {
case "One":
    let one = "One"
case "Two", "Three":
    let twoOrThree = "Two or Three"
case let x where x.hasSuffix("Five"):
    let fourOrFive = "it is \(x)"
default:
    let anyOtherNumber = "Any other number"
}


// for in

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
var kindOfNumber: String? = nil
for (kinds, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindOfNumber = kinds
        }
    }
}
largest
kindOfNumber

// While

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
repeat {
    m = m * 2
    
} while m < 100
m

// Indexes in for
// .. to make a range that omits its upper value
// ... to make a range that includes both values

var firstForLoop = 0
for i in 0...3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += i
}
secondForLoop

// Functions and Closures

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("Fatih", day: "Thursday")

// Tuples in functions
func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()

// Variable number of arguments in functions - Variadic Parameters
func sumOf(numbers:Int...) -> (Int, Int) {
    var sum = 0
    var counter = 0
    for number in numbers {
        sum += number
        counter += 1
    }
    return (sum, counter)
}
sumOf()
sumOf(42, 599, 15)

func calculateAverage(firstNumber: Int, secondNumber: Int) -> Int {
    let (sum,  count) = sumOf(firstNumber, secondNumber)
    let average = sum / count
    return average
}
calculateAverage(10, secondNumber: 20)

// Constant and Variable Parameters
func alignRight(var string: String, count: Int, pad: Character) -> String {
    let amountToPad = count - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}

// In-Out Parameters
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
    
}
// With Generics:
func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}


// Nested functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Return another function as its value
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// Take another function as one of arguments
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [9, 29, 19, 79]
hasAnyMatches(numbers, condition: lessThanTen)


// Closures
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map({
    (number: Int) -> Int in
    let result = number % 2
    if result == 1 {
        return 0
    } else {
        return number
    }
})

let intNumbers = [9, 29, 19, 79]

// Imperative example
var tripledNumbers:[Int] = []
for number in intNumbers {
    tripledNumbers.append(number * 3)
}
print(tripledNumbers)

// Declarative example
let tripledIntNumbers = intNumbers.map({ number in 3 * number })
print(tripledIntNumbers)


numbers.sort() { $0 > $1 }


// Closures

//// As a variable:
//var closureReceivesIntReturnsInt: Int -> Int
//var closureName: (parameterTypes) -> (returnType)
//
////As an optional variable:
//var closureName: ((parameterTypes) -> (returnType))?
//
////As a type alias:
//typealias closureType = (parameterTypes) -> (returnType)
//
////As a constant:
//let closureName: closureType = { ... }
//
////As an argument to a function call:
//func({(parameterTypes) -> (returnType) in statements})
//
////As a function parameter:
//array.sort({ (item1: Int, item2: Int) -> Bool in return item1 < item2 })
//
////As a function parameter with implied types:
//array.sort({ (item1, item2) -> Bool in return item1 < item2 })
//
////As a function parameter with implied return type:
//array.sort({ (item1, item2) in return item1 < item2 })
//
////As the last function parameter:
//array.sort { (item1, item2) in return item1 < item2 }
//
////As the last parameter, using shorthand argument names:
//array.sort { return $0 < $1 }
//
////As the last parameter, with an implied return value:
//array.sort { $0 < $1 }
//
////As the last parameter, as a reference to an existing function:
//array.sort(<)
//
////As a function parameter with explicit capture semantics:
//array.sort({ [unowned self] (item1: Int, item2: Int) -> Bool in return item1 < item2 })
//
////As a function parameter with explicit capture semantics and inferred parameters / return type:
//array.sort({ [unowned self] in return item1 < item2 })


// Subscripts
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// prints "six times three is 18"


// Objects and Classes
class Shape {
    var numberOfSides = 0
    let constProp = "This is a constant "
    func simpleDiscription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func simplerDiscription(description: String) -> String {
        return constProp + description
    }
}

// Create an instance of a class
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDiscription()
shape.simplerDiscription("description")

// Class init

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    deinit {
        self.name = ""
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

// Override inherited method

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "Test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    init(radius:Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    func area()-> Double {
        let pi = 3.14
        return pi * radius * radius
    }
    func describe() -> String {
        return "A circle with radius of \(radius)"
    }
}

let testCircle = Circle(radius: 4, name: "New circle")
testCircle.area()
testCircle.describe()

// Reference Counting
//lazy var someClosure: (Int, String) -> String = {
//  [unowned self] (index: Int, stringToProcess: String) -> String in
//  // closure body goes here
//}

// Optional Chaining
class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms { // This can be used for calling methods through optional chaining
    // Use the roomCount
}

// Type Casting - Any and AnyObject
class Movie {
    var director: String
    var name: String
    init(name: String, director: String) {
        self.director = director
        self.name = name
    }
}

let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones")]


for object in someObjects {
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}
// Shorter syntax
for movie in someObjects as [AnyObject] {
    let typedMovie = movie as! Movie
    print("Movie: '\(typedMovie.name)', dir. \(typedMovie.director)")
}

// Nested Types

struct BlackjackCard {
    // nested Suit enumeration
    enum Suit: Character {
        case Spades = "♠",
        Hearts = "♡",
        Diamonds = "♢",
        Clubs = "♣"
    }
    // nested Rank enumeration
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}


enum StarkChild { case Rickon, Bran, Arya, Sansa, Robb, Jon }
enum Direwolf { case Shaggydog, Summer, Nymeria, Lady, Greywind, Ghost }

enum Actor {
    case Wolf(Direwolf)
    case Person(StarkChild)
}

struct Parters {
    var wolf: Direwolf
    var person: StarkChild
}

// there are 6 * 6 = 36 potential values for Parters
//enum Parters {
//  case Value(wolf: DireWolf, person: StarkChild)
//}

enum MLSTeam {
    case Montreal
    case Toronto
    case Newyork
    case Columbus
    case LA
    case Seatle
}
let theTeam = MLSTeam.Montreal

switch theTeam {
case .Montreal:
    print("Montreal Impact")
case .Toronto:
    print("Toronto FC")
case .Newyork:
    print("Newyork Redbulls")
case .Columbus:
    print("Columbus Crew")
case .LA:
    print("LA Galaxy")
case .Seatle:
    print("Seatle Sounders")
}

enum NhlTeam { case Canadines, Senators, Rangers, Penguins, BlackHawks, Capitals}

enum Team {
    case Hockey(NhlTeam)
    case Soccer(MLSTeam)
}

struct HockeyAndSoccerTeams {
    var hockey: NhlTeam
    var soccer: MLSTeam
}

enum HockeyAndSoccerTeam1s {
    case Value(hockey: NhlTeam, soccer: MLSTeam)
}

// Getter and setters

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0 // newValue is the implicit name, we can provide an explicit name in parantheses after set
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

// willSet and didSet to provide code that is run before and after setting a new value

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
        
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

// Enumerations

enum Rank: Int {
    case Ace = 1 // specify first raw value. The rest of the raw values are assigned in order
    case Two, Three, Four, Five, Sixe
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .King:
            return "king"
        case .Queen:
            return "queen"
        default:
            return String(self.rawValue)
            
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue // use rawValue function to convert between the raw value and the enumeration value

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "Hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartDescription = hearts.simpleDescription()

// Structures
// They are like classes but they are copied when they are passed around in code while classes are passed by reference

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:07 pm")
let failure = ServerResponse.Error("Problem occured.")

enum Tree {
    case Empty
    indirect case Node(Tree, Tree)
}
//typealias Node = (indirect Node, indirect Node)

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}

// Error Handling
enum httpError: ErrorType {
    case BadRequest
    case Unauthorized
    case Forbidden
    case RequestTimeOut
    case UnsupportedMediaType
    case InternalServerError
    case NotImplemented
    case BadGateway
    case ServiceUnavailable
}

//do {
//  let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
//  self.delegate?.didRecieveResults(jsonResult)
//} catch let error as NSError {
//  print("json error" + error.localizedDescription)
//}

func greetSomeone(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
}


// Protocols

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations and structs can all adopt protocols.
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class example"
    var anotherProperty: Int = 79799
    func adjust() {
        simpleDescription += " Now 100% adjusted..."
    }
}

var aSimpleClass = SimpleClass()
aSimpleClass.adjust()
let aDescription = aSimpleClass.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple struct"
    mutating func adjust() { // Mutating to mark a method that modifies the structure - For classes we do not need to use mutating keyword
        simpleDescription += " (adjusted)"
    }
}

var aSimpleStruct = SimpleStructure()
aSimpleStruct.adjust()
let aSimpleStructDescription = aSimpleStruct.simpleDescription

// Extensions

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 46
    }
}

// Extensions

//extension SomeType: SomeProtocol, AnotherProtocol {
//
//}

//// Computed Properties
//extension Double {
//  var mm: Double { return self / 1_000.0 }
//  var ft: Double { return self / 3.28.84 }
//}
//
//let oneInch = 25.4.mm
//let threeFeet = 3.ft


7.simpleDescription

// We can use protocol name just like any other type - for example, to create a collection of objects that have different types but all conform to a single protocol.
// When we work with values whose type is a protocol type, methods outside the protocol definition are not available.


let protocolValue: ExampleProtocol = aSimpleClass
protocolValue.simpleDescription
// protocolValue.anotherProperty


// Generics

func repeatIt<Item>(item: Item, times: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<times {
        result.append(item)
    }
    print("meh")
    print(result)
    return result
}

repeatIt("knock", times: 4)


// We can make generic forms of functions and methods, as well as classes, enumerations and structures.

enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

// Use where after the type name to specify a list of requirements

func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs:T, rhs:U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 5], rhs: [4])



