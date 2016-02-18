# Swift Playground
------------------
```
print("Hello, world")
```
##Variables and Constants

```
var myVariable = 42
myVariable = 50

var str = "Hello, playground"
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
let greet = "Hey \(friend  + String(numberFloat))"
```

##Arrays and Dictionaries
```
var shoppingList = ["swordfish", "water", "beer", "books"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Fatih":"Developer",
    "Nec":"Engineer",
]

occupations["jayne"] = "Public Relations"

```
##To create an empty array or dictionary

```
let emptyArray = [String]()
let emptyDictionary = Dictionary<String, Float>()

shoppingList = []
occupations = [:]
```
## Control Flows
```
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
```
##Optional value either contains a value or contains nil
```
var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "Fatih"
var nilName: String? = nil
var greeting = "Hello"
var greetingSurName:String
if let name = optionalName {
    greeting = "Hello, \(name)"
}

if let surName = nilName {
    greetingSurName = "Hello, Mr. \(surName)"
} else {
    var surName = "Hello"
}
```
##Switch case
#### No need to break! Supports any kind of data

```
let vegetable = "Yellow Cucumber"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins"
case "red paper", "watercress":
    let vegetableComment = "That would make a good tea"
case let x where x.hasSuffix("Cucumber"):
    let vegetableComment = "Is it a yellow \(x)?"
default:
    let vegetableComment = "Everything tastes good in Swift"
}
```
## for in
```
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
```
## While
```
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
```
#### Indexes in for
#### .. to make a range that omits its upper value
#### ... to make a range that includes both values
```
var firstForLoop = 0
for i in 0..3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += i
}
secondForLoop
```
## Functions and Closures
```
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("Fatih", day: "Thursday")
```
### Tuples in functions
```
func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()
```
### Variable number of arguments in functions
```
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
    var (sum,  count) = sumOf(firstNumber, secondNumber)
    let average = sum / count
    return average
}
calculateAverage(10, secondNumber: 20)
```
### Nested functions
```
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()
```
### Return another function as its value
```
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)
```
### Take another function as one of arguments
```
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

```
## Closures
```
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
```
### Known parameters and returns
```
numbers.map({ number in 3 * number })

//sort([1, 6, 7, 9]) { $0 > $1 }
```
## Objects and Classes
```
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
```
### Create an instance of a class
```
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDiscription()
shape.simplerDiscription("description")
```
### Class init
```
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

```
### Override inherited method
```
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
```
## Getter and setters
```
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
```
#### willSet and didSet to provide code that is run before and after setting a new value
```
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
```
## Enumerations
```
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
let aceRawValue = ace.rawValue // use toRaw and fromRaw functions to convert between the raw value and the enumeration value

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
```
## Structures
### They are like classes but they are copied when they are passed around in code while classes are passed by reference
```
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

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}
```
## Protocols
```
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
```
### Classes, enumerations and structs can all adopt protocols.
```
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
```
## Extensions
```
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 46
    }
}

7.simpleDescription
```
#### We can use protocol name just like any other type - for example, to create a collection of objects that have different types but all conform to a single protocol.
#### When we work with values whose type is a protocol type, methods outside the protocol definition are not available.

```
let protocolValue: ExampleProtocol = aSimpleClass
protocolValue.simpleDescription
// protocolValue.anotherProperty
```

## Generics
```
func repeatIt<ItemType>(item: ItemType, times: Int) -> [ItemType] {
    var result = [ItemType]()
    for i in 0..times {
        result += item
    }
    return result
}

repeatIt("knock", times: 4)
```
#### We can make generic forms of functions and methods, as well as classes, enumerations and structures.
```
enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
```
#### We can use where after the type name to specify a list of requirements
```
func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs:T, rhs:U) -> Bool {
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
```
