# FEATURES


- From Imports (`from A import B`)

  ```haxe
  // imports the `random` function from `Std` Class
  from Std import random;
  // imports all static functions and variables from the `Std` Class
  from Std import *;
  // alternatively you can also do from(Std, *) or from(Std, random) to import
  // imports all static functions and variables from the `Std` Class
  from(Std, *);
  ```
- What Do you Think? (`whatdoyouthink`)
  ```haxe
  // the `whatdoyouthink` syntax can be used for letting the interpreter pick which block to run incase you're not sure!
  // the following code has a 50% chance between either printing `example` or `example2`
  whatdoyouthink {
    trace("example");
  }
  else {
    trace("example2");
  }
  
  // alongside that you can also just write whatdoyouthink (cond) {} else {}
  // the interpreter will ignore whatever condition you put because your conditions are just a suggestion not a requirement!

  // the whatdoyouthink syntax can also be used alongside if statements like the following
  if (cond) {
    trace("my conditions have been met!")
  } else whatdoyouthink {
    trace("i think this one is better!");
  } else {
    trace("i think this one is even better!");
  }
  // now the code will try to check for the condition if the condition is false it continues and now it's 50/50 chance of whether it uses the 2nd or 3rd block!
  ```

### TODO:
- [ ] Define Macro
- [ ] C Style Variables
- [ ] C Style Functions
- [ ] C Style For Loops
- [x] crab
- [ ] method overloading