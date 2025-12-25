package hscript;

interface IProperty {
    public function callGetter(name:String):Null<Dynamic>;
	public function callSetter(name:String, val:Dynamic):Null<Dynamic>;
}