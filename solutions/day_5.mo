import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor {

    // challenge 1
    public shared({caller}) func is_anonymous() : async Bool{
        return (Principal.toText(caller) == "2vxsx-fae");
    };

    // challenge 2
    let favoriteNumber : HashMap.HashMap<Principal, Nat> = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);



}