
module {

    // Challenge 7
    public type List<T> = ?(T, List<T>);
    public func is_null<T>(l : List<T>) : Bool{
        switch(l){
            case(null) { true };
            case(_) { false };
        };
    };

    // Challenge 8
    public func last<T>(l : List<T>) : ?T{
        switch(l){
            case(null) { null };
            case(?(l, null)) { ?l };
            case(?(_, t)) { last<T>(t) };
        }
    };

    // Challenge 9
    public func size<T>(l : List<T>) : Nat{
        func recursive_sum(l : List, n: Nat): Nat{
            switch(l){
                case(null) { n };
                case(?(_, t)) { recursive_sum(t, n + 1) };
            }
        };
        recursive_sum(1, 0)
    };


    // Challenge 10
    public func get<T>(l : List<T>, n : Nat) : ?T{
        switch(n, l){
            case (_, null) { null };
            case (0, (?(h, t))) { ?h };
            case (_, (?(_, t))) { get<T>(t, n-1) };
        };
    };


    // Challenge 11
    public func reverse(l : List<T>) : List<T> {
        func rec(l : List<T>, r: List<T>){
            switch l{
                case null { r };
                case (?(h, t)) { rec(t, ?(h, r))};
            }
        };
        rec(l, null)
    };

}