import Cocoa

//MARK: Адресс
struct Adress {
    let x: String
    let y: String
    let nameStreet: String
}


//MARK: Персона
class Person {
    private var name: String
    private var surname: String
    private var age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
}


//MARK: Директор
class Director: Person {
     let experience: Int
     let rating: Int
    
    init(experience: Int, rating: Int, name: String, surname: String, age: Int) {
        self.experience = experience
        self.rating = rating
        super.init(name: name, surname: surname, age: age)
    }
}


//MARK: Ученик
class Student: Person {
    private var classs: (nameItem: String, ocenka: Int)
    
    init(classs: (nameItem: String, ocenka: Int), name: String, surname: String, age: Int = 18) {
        self.classs = classs
        super.init(name: name, surname: surname, age: age)
    }
    
    func infoStudent(name: String, surName: String, classs: (String), item: (String, Int)) -> String {
        return """
               \(surName) \(name) (\(classs))
               \(item.0): \(item.1)
               """
    }
}


//MARK: Школа
struct School {
    var students: [Student]
    var director: Director
    var adress: Adress
    
    func infoSchool() -> String {
        return "\(self.students), \(self.director), \(self.adress)"
    }
    
}

//MARK: Обьекты
let director = Director(experience: 22, rating: 10, name: "Виктор", surname: "Чипушилин", age: 55)

let studentIlya = Student(classs: ("Английский", 9), name: "Илья", surname: "Костюк", age: 16)
print(studentIlya.infoStudent(name: "Илья", surName: "Костюк", classs: ("8-A"), item: ("Математика", 7)))

print("-----------------------------------------")

let studentPasha = Student(classs: ("История", 10), name: "Паша", surname: "Швед", age: 18)
print(studentPasha.infoStudent(name: "Паша", surName: "Швед", classs: ("11-B"), item: ("История", 10)))

let adress = Adress(x: "Мариуполь", y: "Украина", nameStreet: "Мирная / 123")
adress.nameStreet

print("-----------------------------------------")

let school = School(students: [studentIlya, studentPasha], director: director, adress: adress)
school.adress.nameStreet
school.director.experience
print(school)
