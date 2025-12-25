package hscript;

import haxe.xml.Access;
import hscript.utils.UnsafeReflect;
import hscript.Interp;

@:access(hscript.Interp)
@:structInit
class FunctionProperty implements IProperty {
	public var r:Functions;
	public var interp:Interp;

	public function new(func:Dynamic, len:Int, interp:Interp) {
		this.r = {property:this, func:func, len:len};
		this.interp = interp;
	}

	public function callGetter(name:String) {
		return r;
	}

    public function callFunction(args) {
        return r.call(args.length, args);
    }

	public function callSetter(name:String, val:Dynamic) {
        interp.error(ECustom("functions cannot be assigned use arrow/local functions for changing the function"));
		return r;
	}
}

@:structInit
class Functions {
    var property:FunctionProperty;
    var functions:Map<Int, Dynamic> = new Map<Int, Dynamic>();
    public var defaultFunction:Dynamic;

    public function new(property:FunctionProperty, func:Dynamic, len:Int) {
        this.property = property;
        defaultFunction = func;
        set(len, func);
    }

    public function call(len, args) {
		return UnsafeReflect.callMethodSafe(null, get(len), args);
    }

    public function set(len, func:Dynamic, overrideFunction:Bool = true) {
        if (!exists(len) || overrideFunction)
            functions.set(len, func);
        else   
            property.interp.error(ECustom('error the function with $len arg(s) already exists'));
    }

    public function get(len:Int) {
        return functions.exists(len) ? functions.get(len) : defaultFunction;
    }

    public function exists(len:Int) {
        return functions.exists(len);
    }
}