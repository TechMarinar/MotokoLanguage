/** 

 Tests with debugging wrapper around `Set` module
 ===============================================

 */

let Hash = import "hash.as";
let SetDb = import "setDb.as";
let Set = import "set.as";

func SetDb__test() {

  let hash_0 = Hash.hashOfInt(0);
  let hash_1 = Hash.hashOfInt(1);
  let hash_2 = Hash.hashOfInt(2);
  let hash_3 = Hash.hashOfInt(3);
  let hash_4 = Hash.hashOfInt(4);
  let hash_5 = Hash.hashOfInt(5);
  let hash_6 = Hash.hashOfInt(6);
  let hash_7 = Hash.hashOfInt(7);
  let hash_8 = Hash.hashOfInt(8);
  let hash_9 = Hash.hashOfInt(9);


  print "inserting...\n";
  // Insert numbers [0..8] into the set, using their bits as their hashes:
  let s0 : Set.Set<Nat> = Set.empty<Nat>();
  assert(Set.card<Nat>(s0) == 0);

  let s1 : Set.Set<Nat> = SetDb.insert(s0, 0, hash_0);
  assert(Set.card<Nat>(s1) == 1);

  let s2 : Set.Set<Nat> = SetDb.insert(s1, 1, hash_1);
  assert(Set.card<Nat>(s2) == 2);

  let s3 : Set.Set<Nat> = SetDb.insert(s2, 2, hash_2);
  assert(Set.card<Nat>(s3) == 3);

  let s4 : Set.Set<Nat> = SetDb.insert(s3, 3, hash_3);
  assert(Set.card<Nat>(s4) == 4);

  let s5 : Set.Set<Nat> = SetDb.insert(s4, 4, hash_4);
  assert(Set.card<Nat>(s5) == 5);

  let s6 : Set.Set<Nat> = SetDb.insert(s5, 5, hash_5);
  assert(Set.card<Nat>(s6) == 6);

  let s7 : Set.Set<Nat> = SetDb.insert(s6, 6, hash_6);
  assert(Set.card<Nat>(s7) == 7);

  let s8 : Set.Set<Nat> = SetDb.insert(s7, 7, hash_7);
  assert(Set.card<Nat>(s8) == 8);

  let s9 : Set.Set<Nat> = SetDb.insert(s8, 8, hash_8);
  assert(Set.card<Nat>(s9) == 9);
  print "done.\n";

  print "unioning...\n";
  let s1s2 : Set.Set<Nat> = SetDb.union(s1, "s1", s2, "s2");
  let s2s1 : Set.Set<Nat> = SetDb.union(s2, "s2", s1, "s1");
  let s3s2 : Set.Set<Nat> = SetDb.union(s3, "s3", s2, "s2");
  let s4s2 : Set.Set<Nat> = SetDb.union(s4, "s4", s2, "s2");
  let s1s5 : Set.Set<Nat> = SetDb.union(s1, "s1", s5, "s5");
  let s0s2 : Set.Set<Nat> = SetDb.union(s0, "s0", s2, "s2");
  print "done.\n";

  print "intersecting...\n";
  let s3is6 : Set.Set<Nat> = SetDb.intersect(s3, "s3", s6, "s6");
  let s2is1 : Set.Set<Nat> = SetDb.intersect(s2, "s2", s1, "s1");
  print "done.\n";


  print "testing membership...\n";

  // Element 0: Test memberships of each set defined above for element 0
  assert( not( SetDb.mem(s0, "s0", 0, hash_0 ) ));
  assert( SetDb.mem(s1, "s1", 0, hash_0 ) );
  assert( SetDb.mem(s2, "s2", 0, hash_0 ) );
  assert( SetDb.mem(s3, "s3", 0, hash_0 ) );
  assert( SetDb.mem(s4, "s4", 0, hash_0 ) );
  assert( SetDb.mem(s5, "s5", 0, hash_0 ) );
  assert( SetDb.mem(s6, "s6", 0, hash_0 ) );
  assert( SetDb.mem(s7, "s7", 0, hash_0 ) );
  assert( SetDb.mem(s8, "s8", 0, hash_0 ) );
  assert( SetDb.mem(s9, "s9", 0, hash_0 ) );

  // Element 1: Test memberships of each set defined above for element 1
  assert( not(SetDb.mem(s0, "s0", 1, hash_1 )) );
  assert( not(SetDb.mem(s1, "s1", 1, hash_1 )) );
  assert( SetDb.mem(s2, "s2", 1, hash_1 ) );
  assert( SetDb.mem(s3, "s3", 1, hash_1 ) );
  assert( SetDb.mem(s4, "s4", 1, hash_1 ) );
  assert( SetDb.mem(s5, "s5", 1, hash_1 ) );
  assert( SetDb.mem(s6, "s6", 1, hash_1 ) );
  assert( SetDb.mem(s7, "s7", 1, hash_1 ) );
  assert( SetDb.mem(s8, "s8", 1, hash_1 ) );
  assert( SetDb.mem(s9, "s9", 1, hash_1 ) );

  // Element 2: Test memberships of each set defined above for element 2
  assert( not(SetDb.mem(s0, "s0", 2, hash_2 )) );
  assert( not(SetDb.mem(s1, "s1", 2, hash_2 )) );
  assert( not(SetDb.mem(s2, "s2", 2, hash_2 )) );
  assert( SetDb.mem(s3, "s3", 2, hash_2 ) );
  assert( SetDb.mem(s4, "s4", 2, hash_2 ) );
  assert( SetDb.mem(s5, "s5", 2, hash_2 ) );
  assert( SetDb.mem(s6, "s6", 2, hash_2 ) );
  assert( SetDb.mem(s7, "s7", 2, hash_2 ) );
  assert( SetDb.mem(s8, "s8", 2, hash_2 ) );
  assert( SetDb.mem(s9, "s9", 2, hash_2 ) );

  // Element 3: Test memberships of each set defined above for element 3
  assert( not(SetDb.mem(s0, "s0", 3, hash_3 )) );
  assert( not(SetDb.mem(s1, "s1", 3, hash_3 )) );
  assert( not(SetDb.mem(s2, "s2", 3, hash_3 )) );
  assert( not(SetDb.mem(s3, "s3", 3, hash_3 )) );
  assert( SetDb.mem(s4, "s4", 3, hash_3 ) );
  assert( SetDb.mem(s5, "s5", 3, hash_3 ) );
  assert( SetDb.mem(s6, "s6", 3, hash_3 ) );
  assert( SetDb.mem(s7, "s7", 3, hash_3 ) );
  assert( SetDb.mem(s8, "s8", 3, hash_3 ) );
  assert( SetDb.mem(s9, "s9", 3, hash_3 ) );

  // Element 4: Test memberships of each set defined above for element 4
  assert( not(SetDb.mem(s0, "s0", 4, hash_4 )) );
  assert( not(SetDb.mem(s1, "s1", 4, hash_4 )) );
  assert( not(SetDb.mem(s2, "s2", 4, hash_4 )) );
  assert( not(SetDb.mem(s3, "s3", 4, hash_4 )) );
  assert( not(SetDb.mem(s4, "s4", 4, hash_4 )) );
  assert( SetDb.mem(s5, "s5", 4, hash_4 ) );
  assert( SetDb.mem(s6, "s6", 4, hash_4 ) );
  assert( SetDb.mem(s7, "s7", 4, hash_4 ) );
  assert( SetDb.mem(s8, "s8", 4, hash_4 ) );
  assert( SetDb.mem(s9, "s9", 4, hash_4 ) );

  // Element 5: Test memberships of each set defined above for element 5
  assert( not(SetDb.mem(s0, "s0", 5, hash_5 )) );
  assert( not(SetDb.mem(s1, "s1", 5, hash_5 )) );
  assert( not(SetDb.mem(s2, "s2", 5, hash_5 )) );
  assert( not(SetDb.mem(s3, "s3", 5, hash_5 )) );
  assert( not(SetDb.mem(s4, "s4", 5, hash_5 )) );
  assert( not(SetDb.mem(s5, "s5", 5, hash_5 )) );
  assert( SetDb.mem(s6, "s6", 5, hash_5 ) );
  assert( SetDb.mem(s7, "s7", 5, hash_5 ) );
  assert( SetDb.mem(s8, "s8", 5, hash_5 ) );
  assert( SetDb.mem(s9, "s9", 5, hash_5 ) );

  // Element 6: Test memberships of each set defined above for element 6
  assert( not(SetDb.mem(s0, "s0", 6, hash_6 )) );
  assert( not(SetDb.mem(s1, "s1", 6, hash_6 )) );
  assert( not(SetDb.mem(s2, "s2", 6, hash_6 )) );
  assert( not(SetDb.mem(s3, "s3", 6, hash_6 )) );
  assert( not(SetDb.mem(s4, "s4", 6, hash_6 )) );
  assert( not(SetDb.mem(s5, "s5", 6, hash_6 )) );
  assert( not(SetDb.mem(s6, "s6", 6, hash_6 )) );
  assert( SetDb.mem(s7, "s7", 6, hash_6 ) );
  assert( SetDb.mem(s8, "s8", 6, hash_6 ) );
  assert( SetDb.mem(s9, "s9", 6, hash_6 ) );

  // Element 7: Test memberships of each set defined above for element 7
  assert( not(SetDb.mem(s0, "s0", 7, hash_7 )) );
  assert( not(SetDb.mem(s1, "s1", 7, hash_7 )) );
  assert( not(SetDb.mem(s2, "s2", 7, hash_7 )) );
  assert( not(SetDb.mem(s3, "s3", 7, hash_7 )) );
  assert( not(SetDb.mem(s4, "s4", 7, hash_7 )) );
  assert( not(SetDb.mem(s5, "s5", 7, hash_7 )) );
  assert( not(SetDb.mem(s6, "s6", 7, hash_7 )) );
  assert( not(SetDb.mem(s7, "s7", 7, hash_7 )) );
  assert( SetDb.mem(s8, "s8", 7, hash_7 ) );
  assert( SetDb.mem(s9, "s9", 7, hash_7 ) );

  // Element 8: Test memberships of each set defined above for element 8
  assert( not(SetDb.mem(s0, "s0", 8, hash_8 )) );
  assert( not(SetDb.mem(s1, "s1", 8, hash_8 )) );
  assert( not(SetDb.mem(s2, "s2", 8, hash_8 )) );
  assert( not(SetDb.mem(s3, "s3", 8, hash_8 )) );
  assert( not(SetDb.mem(s4, "s4", 8, hash_8 )) );
  assert( not(SetDb.mem(s6, "s6", 8, hash_8 )) );
  assert( not(SetDb.mem(s6, "s6", 8, hash_8 )) );
  assert( not(SetDb.mem(s7, "s7", 8, hash_8 )) );
  assert( not(SetDb.mem(s8, "s8", 8, hash_8 )) );
  assert( SetDb.mem(s9, "s9", 8, hash_8 ) );

  print "done.\n";
};

SetDb__test();
