import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Result "mo:base/Result";


actor {

    // Challenge 1
    private func swap(array:[var Nat], i: Nat, j: Nat): [var Nat]{
        var tmp : Nat = array[i];
        array[i] := array[j];
        array[j] := tmp;
        return array;
    };

    // test for Challenge 1 
    public func swap_test(array:[Nat], i: Nat, j: Nat): async [Nat]{
        return Array.freeze(swap(Array.thaw(array), i, j));
    };

    // Challenge 2
    public func init_count(n : Nat) : async [Nat]{
        return Array.tabulate(n, func(i : Nat) : Nat {i});
    };
    
    // Challenge 3
    public func seven(array : [Nat]) : async Result.Result<Text, Text>{
        for(v in array.vals()){
            if(v == 7) return #ok("Seven is found");
        };
        return #err("Seven not found");
    };

    // Challenge 4
    public func nat_opt_to_nat(n : ?Nat, m : Nat): async Nat{
        switch(n){
            case(null) return m;
            case(?n) return n;
        };
    };


    // Challenge 5
    public func day_of_the_week(n: Nat) : async ?Text{
        let day_text_array : [Text] = [
            "Monday", "Tuesday", "Wednesday", "Thirsday", "Friday", "Sataday", "Sunday"
        ];
        switch(n <= 7){
            case(true) return ?day_text_array[n-1];
            case(false) return (null);
        };
    };

    // Challenge 6
    public func populate_array(array : [?Nat]) : async [Nat]{
        return Array.map(array, func(i : ?Nat) : Nat{
            switch(i){
                case(null) 0;
                case(?i) i;
            };
        });
    };

    // Challenge 7
    public func sum_of_array(array : [Nat]) : async Nat{
        return Array.foldRight(array, 0, func(x: Nat, y: Nat) : Nat{
            x + y;
        })
    };

    // Challenge 8
    public func squared_array(array : [Nat]) : async [Nat]{
        return Array.map(array, func(x: Nat) : Nat {
            x ** 2;
        });
    };

    // Challenge 9
    public func increate_by_index(array : [Nat]) : async [Nat]{
        return Array.mapEntries(array, func(x : Nat, y: Nat) : Nat{
            x + y;
        });
    };

    // Challenge 10
    private func contains<A>(array : [A], a : A, f : (A , A) -> Bool) : Bool{
        let new_array : [A] = Array.filter(array, func(i: A) : Bool{
            f(a, i);
        });
        return (new_array.size() > 0);
    };

    // test for Challenge 10
    public func contains_test(array : [Nat], a : Nat) : async Bool{
        return contains<Nat>(array, a, func(x: Nat, y: Nat) : Bool {x == y});
    };
    
};