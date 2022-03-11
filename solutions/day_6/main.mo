import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import List "mo:base/List";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Option "mo:base/Option";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import HTTP "http";

actor {

    // Challenge 1
    public type TokenIndex = Nat;
    public type Error = {
        #ok  : Text;
        #err : Text;
    };

    // Challenge 2
    let registry : HashMap.HashMap<TokenIndex, Principal> = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);


    // Challenge 3
    stable var nextTokenIndex : Nat = 0;
    public shared({caller}) func mint() : async Result.Result<Text, Text>{
        switch(Principal.toText(caller) == "2vxsx-fae"){
            case true { #err("Error: because of anonymous principal")};
            case false { 
                registry.put(nextTokenIndex, caller);
                nextTokenIndex += 1;
                #ok("Your mint success !!")
            };
        };
    };

    public func show_next_token_index(): async Nat{
        // Debug.print("show next token index");
        return nextTokenIndex;
    };

    // Challenge 4
    public func transfer(to: Principal, tokenIndex: Nat): async Result.Result<Text, Text>{
        let principal_ : ?Principal = registry.get(tokenIndex);
        switch(principal_){
            case (?_) {
                let before_princpal : ?Principal = registry.remove(tokenIndex);
                registry.put(tokenIndex, to);
                #ok("Transfer Success");
            };
            case (null) {
                #err("Transfer Error");
            };
        };
    };

    // Challenge 5
    public type List<TokenIndex> = ?(TokenIndex, List<TokenIndex>);
    public shared({caller}) func balance(): async List.List<TokenIndex>{
        var tokens : List<TokenIndex> = List.nil<TokenIndex>(); 
        for((k, v) in registry.entries()){
            if(v == caller) { 
                tokens := List.push<TokenIndex>(k, tokens);
            };
        };
        return tokens;
    };

    // Challenge 6
    public query func http_request(request: HTTP.Request) : async HTTP.Response{
        return {
            body = Text.encodeUtf8(
                "mint num: " # Nat.toText(nextTokenIndex) #
                ", latest principal : " # Principal.toText(
                    Option.unwrap(
                        registry.get(nextTokenIndex-1)
                    )
                )
            );
            headers = [("Content-Type", "text/html; charset=UTF-8")];
            status_code = 200 : Nat16;
            streaming_strategy = null;
        };
    };


}