import Principal "mo:base/Principal";

actor {

    // challenge 1
    public shared({caller}) func is_anonymous() : async Bool{
        return (Principal.toText(caller) == "2vxsx-fae");
    };

}