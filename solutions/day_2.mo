import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Iter "mo:base/Iter";
import Prim "mo:⛔";


actor {

  // challenge 1
  public func nat_to_nat8(n : Nat) : async Nat8 {
    assert(n < 256);
    return Prim.natToNat8(n);
  };

  // challenge 2
  public func max_number_with_n_bits(n : Nat) : async Nat{
    return Nat.pow(2, n) - 1;
  };
};
