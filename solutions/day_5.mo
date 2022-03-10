import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Result "mo:base/Result";

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

}