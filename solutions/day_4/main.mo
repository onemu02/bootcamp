import Custom "custom";
import Animal "animal";
import Debug "mo:base/Debug";
import List "mo:base/List";

actor {

    // Challenge 1
    public type Exam = Custom.Exam;
    public func fun(): async Exam {
        let r : Exam = {
            math = 97;
            english = 78;
            science = 85;
        };
        return r;
    };

    // Challenge 2
    public type Animal = Animal.Animal;
    var animal : Animal = {speice = "test"; energy = 1}; 
    Debug.print(animal.speice);


    // Challenge 4
    public func create_animal_then_takes_a_break(speice: Text, energy : Nat): async Animal{
        let a : Animal.Animal = {
            speice = speice;
            energy = energy;
        };
        return Animal.animal_sleep(a);
    };

    // Challenge 5
    private type List<T> = List.List<T>;
    private var animals : [Animal] = [{speice= ""; energy = 0}];
    private var animal_list: List<Animal> = List.fromArray<Animal>(animals);

    // Challenge 6
    public func push_animal(a: Animal): async (){
        let new_animal : List<Animal> = List.fromArray<Animal>([a]);
        animal_list := List.append(animal_list, new_animal);
    };

    public func get_animal(): async [Animal]{
        return List.toArray(animal_list);
    };

}