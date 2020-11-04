protocol Soap {
    var soap: Double {get}
    var loaded: Int {get}
}
protocol Machine {
    func info()
}
class WashingMachine: Soap, Machine {
    var soap: Double
    var loaded: Int
    func info () {
        print(" Загружено \(loaded) кг для стирки, требуется \(soap) кг моющего средства")
    }
    init(loaded: Int, soap: Double) {
        self.soap = soap
        self.loaded = loaded
    }
}
class DishWasher: Soap, Machine {
    var soap: Double
    var loaded: Int
    func info () {
        print(" Загружено \(loaded) кг для мытья, требуется \(soap) кг моющего средства")
    }
    init(loaded: Int, soap: Double) {
        self.soap = soap
        self.loaded = loaded
    }
}
struct Queque<T: Soap> {
    private var elements: [T] = []
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    var totalSoap: Double {
        var total = 0.0
        for element in elements {
            total += element.soap
        }
        return total
    }
    var totalWeight: Int {
        var weight = 0
        for element in elements {
            weight += element.loaded
        }
        return weight
    }
    subscript(index: Int) -> Int? {
        get {
            if index < elements.count {
                return self.elements[index].loaded
            }
            else {
                return  nil
            }
        }
    }
}

var quequeWashing = Queque<WashingMachine>()
quequeWashing.push(WashingMachine(loaded: 1, soap: 0.8))
quequeWashing.push(WashingMachine(loaded: 5, soap: 0.1))
quequeWashing.push(WashingMachine(loaded: 10, soap: 0.5))
print("Для стирки \(quequeWashing.totalWeight) кг белья понадобится \(quequeWashing.totalSoap) кг моющего средства")
quequeWashing.totalWeight
var quequeDishes = Queque<DishWasher>()
quequeDishes.push(DishWasher(loaded: 12, soap: 0.5))
quequeDishes.push(DishWasher(loaded: 10, soap: 0.4))
quequeDishes.push(DishWasher(loaded: 3, soap: 0.09))
print("Для мытья \(quequeDishes.totalWeight) комплектов посуды понадобится \(quequeDishes.totalSoap) кг моющего средства")
quequeWashing[1]
quequeWashing[6]
quequeDishes[0]
quequeDishes[4]
quequeDishes.pop()
quequeDishes.pop()
print("Для мытья \(quequeDishes.totalWeight) комплектов посуды понадобится \(quequeDishes.totalSoap) кг моющего средства")
quequeWashing.pop()
quequeWashing.pop()
print("Для стирки \(quequeWashing.totalWeight) кг белья понадобится \(quequeWashing.totalSoap) кг моющего средства")
quequeDishes.pop()
print("Для мытья \(quequeDishes.totalWeight) комплектов посуды понадобится \(quequeDishes.totalSoap) кг моющего средства")
quequeDishes.isEmpty()
quequeDishes[1]


// Task 2
struct QuequeSecond<T> {
    var array: [T] = []
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    mutating func push(_ i: T) {
        array.append(i)
    }
    mutating func pop() -> T? {
        return array.removeFirst()        
    }
}
var quequeSecond = QuequeSecond<Int>()
quequeSecond.isEmpty()
quequeSecond.push(10)
quequeSecond.push(20)
quequeSecond.push(30)
quequeSecond.push(40)
quequeSecond.push(50)
quequeSecond.push(60)
quequeSecond.isEmpty()
var myArray = quequeSecond.array
var array1 = myArray.map{$0 * $0}
print(array1)
var array2 = myArray.map{$0 % 2 == 0}
print(array2)
var array3 = array1.map{$0 / 100}
print(array3)
var array4 = array3.filter{$0 % 2 == 0}
print(array4)
var array5 = array4.map{Array(repeating: $0, count: $0)}
print(array5)
var array6 = array4.filter{$0 > 10}
print(array6)
var array7 = array6.reduce(200, +)
print(array7)
var array8 = array1.reduce(200, -)
print(array8)
var multyArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
var array9 = multyArray.flatMap {$0.filter {$0 % 3 != 0}}
print(array9)
var array10 = array4.flatMap{Array(repeating: $0, count: $0)}
print(array10)
array3.forEach {
    print($0)
    
}
