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

        public function new() {}
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
    'required' field is also supported allowing you to make it so an object needs to be created in the object initializer
    it can be used like this
    ```haxe
    class Person {
        // put `required` when creating the variable to make it a required variable for object initialization
        public required var age:Int = 0;
        public var gender:String = '';
        // due to the way hscript is designed functions and variables are the same thing
        // for consistencies sake i just decided to make it also work on functions so this is also valid code
        // public required function myFunction() {}

        public function new() {}
    }

    // valid code
    var person = new Person() {
        age:34,
        gender:'Male',
    };
    // invalid code
    // will error out with the message
    //  Missing required Fields: 'age'
    var person = new Person() {
        gender:'Male',
    };
    ```
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

# EXPERIMENTAL FEATURES

- Experimental Meta (`@:experimental(a)`)
    Experimental features can be enabled simply by writing `@:experimental(a, ?b)` replace `a` with the feature you want to enable `b` is an optional argument to manually enable/disable experiments by default b is true so you can just do `@:experimental(a)`
    For example incase you want to enable function overloads you would have to do `@:experimental(functionOverloads)`
    preferably put the experimental meta at the top of your script like this
    ```haxe
    @:experimental(feature)
    // ... rest of code
    ```
- Function Overloads
    `@:experimental(functionOverloads)`
    functions overloads can be used to allow you to have multiple functions with the same name as long as they have different argument amounts (support for type based overloads is planned but very low priority)
    ```haxe
    @:experimental(functionOverloads) // preferably put this at the top of the code to enable function overloads

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