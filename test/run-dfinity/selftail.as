
// a single function that can be evaluated recursively or tail-recursively
func f (tailCall:Bool, n:Int, acc:Int) : Int {
    if (n<=0) 
	return acc;

    if (tailCall)
	f(tailCall, n-1, acc+1)
    else
	1 + f(tailCall, n-1, acc);
};

// check we get same results for small n 
assert (f(false, 100, 0) == f(true, 100, 0));

// check tail recursion work for large n
let 10000 = f (true, 10000, 0);

// check recursion overflows for larger n 
let 10000 = f (false, 10000, 0);

assert (false);



