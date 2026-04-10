package hscript;

import haxe.extern.EitherType;
import haxe.xml.Access;
import hscript.utils.UnsafeReflect;
import hscript.Interp;

@:access(hscript.Interp)
class Function implements IProperty {
	public var r:FunctionGroup;
	public var interp:Interp;

    public var defaultFunction(get, never):Dynamic;

    function get_defaultFunction() {
        return r.defaultFunction;
    }

	public function new(func:Dynamic, len:Int, interp:Interp) {
		this.r = {property:this, func:func, len:len};
		this.interp = interp;
	}

    public function call(args) {
        return r.call(args);
    }

    public function callUnsafe(args) {
        return r.callUnsafe(args);
    }

	public function callGetter(name:String) {
		return r;
	}

	public function callSetter(name:String, val:Dynamic) {
        interp.error(ECustom("functions cannot be assigned use arrow/local functions for changing the function"));
		return r;
	}
}

@:structInit
class FunctionGroup {
    var property:Function;
    var functions:Map<Int, Dynamic> = new Map<Int, Dynamic>();
    public var defaultFunction:Dynamic;

    public function new(property:Function, func:Dynamic, len:Int) {
        this.property = property;
        defaultFunction = func;
        set(len, func);
    }

    public function call(args) {
		return UnsafeReflect.callMethodSafe(null, get(args.length), args);
    }

    public function callUnsafe(args) {
		return UnsafeReflect.callMethodUnsafe(null, get(args.length), args);
    }

    public function set(len, func:Dynamic, overrideFunction:Bool = true) {
        if (!exists(len) || overrideFunction)
            functions.set(len, func);
        else   
            property.interp.error(ECustom('error the function with $len arg(s) already exists'));
    }

    public function get(len:Int):Dynamic {
        return exists(len) ? functions.get(len) : defaultFunction;
    }

    public function exists(len:Int) {
        return functions.exists(len);
    }
}