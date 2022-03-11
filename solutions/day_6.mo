import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";

actor {

    // Challenge 1
    public type TokenIndex = Nat;
    public type Error = {
        #ok  : Text;
        #err : Text;
    };

    // Challenge 2
    let registry : HashMap.HashMap<TokenIndex, Principal> = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);


}