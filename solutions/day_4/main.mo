import Custom "custom";
import Animal "animal";
import Debug "mo:base/Debug";

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


}