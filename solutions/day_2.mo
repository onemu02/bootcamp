import Nat "mo:base/Nat";
import Order "mo:base/Order";
import Option "mo:base/Option";
import Bool "mo:base/Bool";
import Nat32 "mo:base/Nat32";
import Text "mo:base/Text";
import Nat8 "mo:base/Nat8";
import Iter "mo:base/Iter";
import Prim "mo:⛔";
import Char "mo:base/Char";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";


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

  // challenge 3
  public func decimal_to_bits(n : Nat) : async Text{
    var bits_text : Text = "";
    var _n: Nat = n;

    if (n==0) return "0";

    while (_n > 0){
      bits_text := Text.concat(Nat.toText(_n % 2), bits_text);
      _n := _n / 2;
    };
    return bits_text;
  };

  // practice
  public func unicode_to_character(n : Nat32) : async Text{
    let char : Char = Char.fromNat32(n);
    return(Char.toText(char));
  };

  // challenge 4
  public func capitalize_character(c : Char) : async Char{
    var decimal : Nat32 = Char.toNat32(c);
    if ((decimal >= Char.toNat32('a')) and (decimal <= Char.toNat32('z'))){
      decimal := decimal - (Char.toNat32('a') - Char.toNat32('A'));
      return Char.fromNat32(decimal);
    } else{
      return c;
    };
  };

  // challenge 5
  public func capitalize_text(text : Text) : async Text{
    var tmp : Char = 'a';
    var r = ""; 
    for(c in Text.toIter(text)){
      tmp := await capitalize_character(c);
      r #= Prim.charToText(tmp);
    };
    return r;
  };

  // challenge 6
  public func is_inside(t : Text, c: Char) : async Bool{
    for(char in Text.toIter(t)){
      if(c == char){
        return true;
      };
    };
    return false;
  };

  // challenge 7
  public func trim_whitespace(t: Text) : async Text{
    var r : Text = "";
    for(char in Text.toIter(t)){
      if (char != ' '){
        r #= Text.fromChar(char);
      };
    };
    return r;
  };

  // challenge 8
  public func duplicate_character(t: Text) : async Text{
    var buf : Buffer.Buffer<Char> =  Buffer.Buffer(0);
    var r : Text = "";

    for(char in Text.toIter(t)){
      var count_diffrent_chars = 0;
      for(buf_char in buf.vals()){
        if (buf_char != char) {
          count_diffrent_chars += 1;
        }
      };
      if (count_diffrent_chars == buf.size()) {
        buf.add(char);
      }
    };

    for(i in buf.vals()){
      r #= Char.toText(i);
    };

    return r;
  };

   // challenge 9
   public func size_in_bytes(t : Text) : async Nat{
     return Text.encodeUtf8(t).size();
   };

   // challenge 10
   public func bubble_sort(array: [Nat]) : async [Nat]{
     var sorted_array : Buffer.Buffer<Nat> = Buffer.Buffer(array.size());
     for(v in array.vals()){ sorted_array.add(v) };

     for(i in Iter.range(1, (sorted_array.size()))){
       for(j in Iter.range(0, (sorted_array.size()-i-1))){
         let is_less : Bool = Order.isLess(Nat.compare(sorted_array.get(j), sorted_array.get(j+1)));
         if(is_less == false){
           var tmp : Nat = sorted_array.get(j);
           sorted_array.put(j, sorted_array.get(j+1));
           sorted_array.put(j+1, tmp);
         };
       };
     };
     return sorted_array.toArray();
   };

};