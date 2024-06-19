package backend;

import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

using StringTools;

typedef MechanicJson =
{
	var disabledScripts:Array<String>;
}

class Mechanic
{
	public static var defaultList:Array<String> = ['Default Mechanics'];
	public static var list:Array<String> = [];
	public static var defaultMechanic(default, never):String = 'Default Mechanics';

	public static var disabledScripts:Array<String> = [];
	public static var currentMechanic:String = "Default Mechanics";

	public static function loadFromWeek(week:WeekData = null)
	{
		if (week == null)
			week = WeekData.getCurrentWeek();

		list = defaultList.copy();
		var mechStr:String = week.mechanics;
		if (mechStr != null)
			mechStr = mechStr.trim();

		if (mechStr != null && mechStr.length > 0)
		{
			var mechs:Array<String> = mechStr.split(',');
			var i:Int = mechs.length - 1;
			while (i > 0)
			{
				if (mechs[i] != null)
				{
					mechs[i] = mechs[i].trim();
					if (mechs[i].length < 1)
						mechs.remove(mechs[i]);
				}
				--i;
			}

			if (mechs.length > 0 && mechs[0].length > 0)
			{
				list = mechs;
			}
		}
		else
			resetList();
	}

	inline public static function resetList()
	{
		list = defaultList.copy();
	}

	public static function loadFromJson(jsonInput:String, folder:String):MechanicJson
	{
		var rawJson = null;

		var formattedFolder:String = Paths.formatToSongPath(folder);
		var formattedMechanic:String = Paths.formatToSongPath(jsonInput);

		#if MODS_ALLOWED
		var moddyFile:String = Paths.modsJson(formattedFolder + '/' + formattedMechanic);
		if (FileSystem.exists(moddyFile))
		{
			rawJson = File.getContent(moddyFile).trim();
		}
		#end

		if (rawJson == null)
		{
			return {disabledScripts: ['']};
		}

		while (!rawJson.endsWith("}"))
		{
			rawJson = rawJson.substr(0, rawJson.length - 1);
		}

		return parseJSON(rawJson);
	}

	public static function parseJSON(rawJson:String):MechanicJson
	{
		var jsonParsed:MechanicJson = cast Json.parse(rawJson);
		return jsonParsed;
	}
}
