/** 

 Debugging wrapper around `Set` module
 ========================================

 */

let List = import "list.as";
let Hash = import "hash.as";
let Trie = import "trie.as";
let Set = import "set.as";
let BitList = Hash.BitList;



  /* private */ func setDbPrint(s:Set.Set<Nat>) {
    func rec(s:Set.Set<Nat>, ind:Nat, bits:Hash.BitList) {
      func indPrint(i:Nat) {
	      if (i == 0) { } else { print "| "; indPrint(i-1) }
      };
      switch s {
      case null {
	           //indPrint(ind);
	           //bitsPrintRev(bits);
	           //print "(null)\n";
	         };
      case (?n) {
	           switch (n.keyvals) {
	           case null {
		                //indPrint(ind);
		                //bitsPrintRev(bits);
		                //print "bin \n";
		                rec(n.right, ind+1, ?(true, bits));
		                rec(n.left,  ind+1, ?(false,bits));
		                //bitsPrintRev(bits);
		                //print ")\n"
		              };
	           case (?keyvals) {
		                //indPrint(ind);
		                print "(leaf [";
                    List.iter<(Trie.Key<Nat>,())>(
                      ?keyvals, 
                      func ((k:Trie.Key<Nat>, ())) : () = {
                        print("hash(");
                        printInt(k.key);
                        print(")=");
		                    Hash.hashPrintRev(k.hash);
                        print("; ");
                        ()
                      }
                    );
		                print "])\n";
		              };
	           }
	         };
      }
    };
    rec(s, 0, null);
  };

  ////////////////////////////////////////////////////////////////////////////////

  /* private */ func natEq(n:Nat,m:Nat):Bool{ n == m};

  func insert(s:Set.Set<Nat>, x:Nat, xh:Hash.Hash):Set.Set<Nat> = {
    print "  setInsert(";
    printInt x;
    print ")";
    let r = Set.insert<Nat>(s,x,xh,natEq);
    print ";\n";
    setDbPrint(r);
    r
  };

  func mem(s:Set.Set<Nat>, sname:Text, x:Nat, xh:Hash.Hash):Bool = {
    print "  setMem(";
    print sname;
    print ", ";
    printInt x;
    print ")";
    let b = Set.mem<Nat>(s,x,xh,natEq);
    if b { print " = true" } else { print " = false" };
    print ";\n";
    b
  };

  func union(s1:Set.Set<Nat>, s1name:Text, s2:Set.Set<Nat>, s2name:Text):Set.Set<Nat> = {
    print "  setUnion(";
    print s1name;
    print ", ";
    print s2name;
    print ")";
    // also: test that merge agrees with disj:
    let r1 = Set.union<Nat>(s1, s2, natEq);
    let r2 = Trie.disj<Nat,(),(),()>(s1, s2, natEq, func (_:?(),_:?()):(())=());
    assert(Trie.equalStructure<Nat,()>(r1, r2, natEq, Set.unitEq));
    print ";\n";
    setDbPrint(r1);
    print "=========\n";
    setDbPrint(r2);
    r1
  };

  func intersect(s1:Set.Set<Nat>, s1name:Text, s2:Set.Set<Nat>, s2name:Text):Set.Set<Nat> = {
    print "  setIntersect(";
    print s1name;
    print ", ";
    print s2name;
    print ")";
    let r = Set.intersect<Nat>(s1, s2, natEq);
    print ";\n";
    setDbPrint(r);
    r
  };


