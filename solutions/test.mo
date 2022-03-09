import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Animal "day_4/animal";

let a : Animal.Animal = {
    speice = "test";
    energy = 2;
};
let b : Animal.Animal = Animal.animal_sleep(a);
assert(b.energy == 12);
Debug.print("OK");
assert(b.energy == 10);