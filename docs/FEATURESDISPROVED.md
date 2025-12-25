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
- C# Object Initializers
    ```haxe
    // C# Object Initializers can be used for setting variables without making assignment lines
    // It can be used as such
    class Person {
    public var age:Int = 0;
    public var gender:String = '';

    public function new() {

    }
    }

    // after the new Class() statement put a block with the {variable:value} you want
    var person = new Person() {
    age:34,
    gender:'Male',
    };

    trace(person.age); // 34
    trace(person.gender); // Male
    // this is the equivalent of
    var person = new Person();
    person.age = 34;
    person.gender = "Male";

    trace(person.age); // 34
    trace(person.gender); // Male
    ```
    - Note: the `required` syntax has yet to be added
- With Operator (`with`)
    the with operator clones an object except with values changed 
    it can be used similarly to object initializers except unlike it instead of new Class() {var:value}
    you do obj with {var:value}
    look at the example below for more explanation
    ```haxe
    var obj = {a:3, b:2, c:"hey"};
    trace(obj); // [b => 2, c => hey, a => 3]

    // after the with expression you put a block with the parameters as such {variable:value}
    var obj2 = obj with {a:5, c:"don't"};
    trace(obj2); // [b => 2, a => 5, c => don't]
    ```
- [EXPERIMENTAL] Function Overloads
    functions overloads can be used to allow you to have multiple functions with the same name as long as they have different argument amounts (support for type based overloads is planned but not top priority)
    ```haxe
    // since this is the first function with the name `test` it is the default function for `test`
    function test() {
        return 5;
    }

    // this is another function that shares the same name
    function test(a,b) {
        return a + b;
    }

    trace(test()); // 5
    trace(test(3,7)); // 10

    // when assigning a variable to the function it defaults to the default function for backwards (hscript-improved) compatibility reasons
    // incase you want to get the `Functions` class itself and not the default function use the @:functionProp metadata like below
    @:functionProp
    var a = test;
    trace(a); // Functions

    // otherwise this is the outcome
    var b = test;
    trace(b) // Object
    ```
### TODO:
- [ ] Define Macro
- [ ] C Style Variables
- [ ] C Style Functions
- [ ] C Style For Loops
- [x] crab
- [x] method overloading