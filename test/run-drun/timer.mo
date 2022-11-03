//MOC-ENV MOC_UNLOCK_PRIM=yesplease
import {debugPrint; error} = "mo:⛔";

actor {

  let raw_rand = (actor "aaaaa-aa" : actor { raw_rand : () -> async Blob }).raw_rand;

  var count = 0;
  var max = 10;

  public shared func inc() : async () {
    count := count + 1;
  };

  system func timer() : async () {
    if (count < max) {
      ignore inc();
      await @run_timers();
    }
  };

  public shared func go() : async () {
     var attempts = 0;
     let prev = (prim "global_timer_set" : Nat64 -> Nat64) 2;
     assert prev == 0;
     while (count < max) {
       ignore await raw_rand(); // yield to scheduler
       attempts += 1;
       if (attempts >= 50 and count == 0)
         throw error("he's dead Jim");
     };
     debugPrint(debug_show {count});
  };
};

//SKIP run
//SKIP run-low
//SKIP run-ir

//CALL ingress go "DIDL\x00\x00"
