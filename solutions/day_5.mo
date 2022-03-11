import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Result "mo:base/Result";
import Option "mo:base/Option";
import Nat "mo:base/Nat";

actor {

    // challenge 1
    public shared({caller}) func is_anonymous() : async Bool{
        return (Principal.toText(caller) == "2vxsx-fae");
    };

    // challenge 2
    let favoriteNumber : HashMap.HashMap<Principal, Nat> = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    // challenge 3
    // public shared({caller}) func add_favorite_number(n: Nat): async(){
    //     favoriteNumber.put(caller, n);
    // };

    public shared({caller}) func show_favorite_number(): async ?Nat{
        favoriteNumber.get(caller);
    };

    // challenge 4
    public shared({caller}) func add_favorite_number(n: Nat): async Result.Result<Text, Text>{
        switch(favoriteNumber.get(caller)){
            case(null) {
                favoriteNumber.put(caller, n);
                #ok("You've successfully registered your number");
            };
            case(_) {
                #err("You've already registered your number")
            };
        }
    };

    // challenge 5
    public shared({caller}) func update_favorite_number(n: Nat): async Result.Result<Text, Text>{
        switch(favoriteNumber.get(caller)){
            case(null) {
                favoriteNumber.put(caller, n);
                #ok("You've successfully registered your number");
            };
            case(_) {
                let tmp : ?Nat = favoriteNumber.replace(caller, n);
                #err("You've successfully updated " # Nat.toText(Option.unwrap(tmp)) # " -> " # Nat.toText(n) #" your number");
            };
        }
    };

    public shared({caller}) func delete_favorite_number(): async Result.Result<Text, Text>{
        switch(favoriteNumber.get(caller)){
            case(null) {
                #err("Not registered");
            };
            case(_) {
                let deleted_number : ?Nat = favoriteNumber.remove(caller);
                #ok("You've successfully delete "# Nat.toText(Option.unwrap(deleted_number)) #" your number");
            };
        }
    };


    // Challenge 6
    public func deposit_cycles() : async Nat {
        return (Cycles.balance());
    };

}