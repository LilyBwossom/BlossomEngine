package states;

import backend.Favorite;
import flixel.math.FlxPoint.FlxCallbackPoint;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import flash.text.TextField;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import objects.HealthIcon;
import states.FreeplayState.SongMetadata;
import backend.WeekData; #if MODS_ALLOWED import sys.FileSystem; #end class FreeplaySelectState extends MusicBeatState

{
	public static var categories:Array<CategoryMetaData> = [
		/*
			new CategoryMetaData("all", "dad", FlxColor.fromRGB(135, 206, 250)) 
			new CategoryMetaData("vanilla", "bf", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("b-side", "bsides", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("erect", "erect", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("creepypasta", "creepypasta", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("sonic", "sonic", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("smoke-em-out-struggle", "garcello", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("miku", "miku", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("amongus", "imposter", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("tricky", "tricky", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("hank", "hank", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("mid-fight-masses", "sarvente", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("sky", "sky", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("ski", "ski", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("tabi", "tabi", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("whitty", "whitty", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("fnaf", "matpat", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("qt", "qt", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("herobrine", "herobrine", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("hex", "hex", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("indie-cross", "sans", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("hotline-024", "nikku", FlxColor.fromRGB(135, 206, 250)),
			new CategoryMetaData("misc", "gf", FlxColor.fromRGB(135, 206, 250))
		 */
	];

	public static function addToMenu(instance:FreeplayState, WeekName:String)
	{
		if (WeekName == "all")
		{
			for (i in 0...WeekData.weeksList.length)
			{
				if (instance.weekIsLocked(WeekData.weeksList[i]))
					continue;

				var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
				var leSongs:Array<String> = [];
				var leChars:Array<String> = [];

				for (j in 0...leWeek.songs.length)
				{
					leSongs.push(leWeek.songs[j][0]);
					leChars.push(leWeek.songs[j][1]);
				}

				WeekData.setDirectoryFromWeek(leWeek);
				for (song in leWeek.songs)
				{
					var colors:Array<Int> = song[2];
					if (colors == null || colors.length < 3)
					{
						colors = [146, 113, 253];
					}
					instance.addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]), song[3]);
				}
			}
			return;
		}

		if (WeekName == "favorites")
		{
			addSongs(instance, Favorite.favoriteSongs);
			return;
		}

		for (category in categories)
		{
			if (category.name == WeekName)
			{
				if (category.songs != null && category.songs != [])
				{
					addSongs(instance, category.songs);
				}

				if (category.weeks != null && category.weeks != [])
				{
					for (week in category.weeks)
					{
						addWeek(instance, week);
					}
				}
				return;
			}
		}
	}

	public static function addWeek(instance:FreeplayState, name:String)
	{
		for (i in 0...WeekData.weeksList.length)
		{
			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			if (leWeek.weekName == name)
			{
				var leSongs:Array<String> = [];
				var leChars:Array<String> = [];

				for (j in 0...leWeek.songs.length)
				{
					leSongs.push(leWeek.songs[j][0]);
					leChars.push(leWeek.songs[j][1]);
				}

				WeekData.setDirectoryFromWeek(leWeek);
				for (song in leWeek.songs)
				{
					/*
						try
						{
							trace("'" + song[0].replace("-", " ").toLowerCase() + "'" + ", ");
						}
						catch (e)
						{
							trace(e);
						}
					 */

					var colors:Array<Int> = song[2];
					if (colors == null || colors.length < 3)
					{
						colors = [146, 113, 253];
					}
					instance.addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]), song[3]);
				}
			}
		}
	}

	public static function addSongs(instance:FreeplayState, songsArray:Array<String>)
	{
		for (i in 0...WeekData.weeksList.length)
		{
			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var leSongs:Array<String> = [];
			var leChars:Array<String> = [];

			for (j in 0...leWeek.songs.length)
			{
				leSongs.push(leWeek.songs[j][0]);
				leChars.push(leWeek.songs[j][1]);
			}

			WeekData.setDirectoryFromWeek(leWeek);

			for (song in leWeek.songs)
			{
				/*
					try
					{
						trace("'" + song[0].replace("-", " ").toLowerCase() + "'" + ", ");
					}
					catch (e)
					{
						trace(e);
					}
				 */

				if (!songsArray.contains(song[0]))
				{
					continue;
				}

				var colors:Array<Int> = song[2];
				if (colors == null || colors.length < 3)
				{
					colors = [146, 113, 253];
				}
				instance.addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]), song[3]);
			}
		}
	}

	var selector:FlxText;

	public static var curSelected:Int = 0;

	private var iconArray:Array<HealthIcon> = [];

	private var grpCategories:FlxTypedGroup<Alphabet>;

	var currentCategoryName:Alphabet;
	var ratingText:Alphabet;
	var rating:Alphabet;
	var starIcon:HealthIcon;

	var bg:FlxSprite;
	var intendedColor:Int;
	var colorTween:FlxTween;

	var canScroll:Bool = true;

	override function create()
	{
		// Paths.clearStoredMemory();
		// Paths.clearUnusedMemory();

		categories = [
			{
				name: "favorites",
				icon: "star",
				color: [255, 228, 181],
				weeks: null,
				songs: null
			},
			{
				name: "all",
				icon: "dad",
				rating: "1-5",
				color: [147, 112, 219],
				weeks: null,
				songs: null
			},
			{
				name: "vanilla",
				icon: "bf",
				rating: "1-2",
				color: [135, 206, 250],
				weeks: null,
				songs: [
					"Tutorial", "Bopeebo", "Fresh", "Dad Battle", "Spookeez", "South", "Monster", "Pico", "Philly Nice", "Blammed", "Satin Panties", "High",
					"Milf", "Cocoa", "Eggnog", "Winter Horrorland", "Senpai", "Roses", "Thorns", "Ugh", "Guns", "Stress"
				]
			}
		];

		for (mod in Mods.getModDirectories())
		{
			var categoriesFolder:String = Paths.mods(mod) + '/categories';
			if (FileSystem.exists(categoriesFolder))
			{
				for (jsonFile in FileSystem.readDirectory(categoriesFolder))
				{
					var jsonCategories:CategoriesMetaData = tjson.TJSON.parse(File.getContent(categoriesFolder + '/' + jsonFile));
					for (category in jsonCategories.categories)
					{
						categories.push(category);
					}
				}
			}
		}

		persistentUpdate = true;
		PlayState.isStoryMode = false;

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();

		grpCategories = new FlxTypedGroup<Alphabet>();
		add(grpCategories);

		for (i in 0...categories.length)
		{
			var categoryText:Alphabet = new Alphabet(90, 320, categories[i].name, true);
			categoryText.isMenuItem = true;
			categoryText.targetY = i - curSelected;
			grpCategories.add(categoryText);

			var maxWidth = 980;
			if (categoryText.width > maxWidth)
			{
				categoryText.scaleX = maxWidth / categoryText.width;
			}
			categoryText.snapToPosition();
			var icon:HealthIcon = new HealthIcon();
			icon.changeIcon(categories[i].icon);
			icon.sprTracker = categoryText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);

			// categoryText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// categoryText.screenCenter(X);
		}

		if (curSelected >= categories.length)
			curSelected = 0;
		bg.color = FlxColor.fromRGB(categories[curSelected].color[0], categories[curSelected].color[1], categories[curSelected].color[2]);
		intendedColor = bg.color;

		changeSelection();

		var textBG:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, 100, 0xFF000000);
		textBG.alpha = 0.6;
		add(textBG);

		var selectedCategoryText:Alphabet = new Alphabet(0, 10, "Selected Category :", true);
		selectedCategoryText.scaleX = 0.5;
		selectedCategoryText.scaleY = 0.5;
		selectedCategoryText.screenCenter(X);
		add(selectedCategoryText);

		currentCategoryName = new Alphabet(0, 25, "", false);
		currentCategoryName.scaleX = 0.5;
		currentCategoryName.scaleY = 0.5;
		currentCategoryName.screenCenter(X);
		add(currentCategoryName);

		if (!ClientPrefs.data.hideRatings)
		{
			ratingText = new Alphabet(FlxG.width * 0.75, 10, "Difficulty\nRating :", true);
			ratingText.scaleX = 0.5;
			ratingText.scaleY = 0.5;
			add(ratingText);

			rating = new Alphabet(0, 30, "", false);
			rating.scaleX = 0.5;
			rating.scaleY = 0.5;
			// rating.alignment = CENTERED;
			add(rating);

			starIcon = new HealthIcon("star");
			starIcon.y = rating.y;
			starIcon.offset.y += 30;
			starIcon.scale.x = 0.35;
			starIcon.scale.y = 0.35;
			add(starIcon);
		}

		super.create();
	}

	override function closeSubState()
	{
		changeSelection(0, false);
		persistentUpdate = true;
		super.closeSubState();
	}

	var instPlaying:Int = -1;

	public static var vocals:FlxSound = null;

	var holdTime:Float = 0;

	override function update(elapsed:Float)
	{
		currentCategoryName.text = categories[curSelected].name;
		currentCategoryName.screenCenter(X);

		if (!ClientPrefs.data.hideRatings)
		{
			rating.text = (categories[curSelected].rating != null) ? categories[curSelected].rating : "?";

			rating.x = ratingText.x + 185;
			starIcon.x = ratingText.x + rating.width + 145;
		}

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		var ctrl = FlxG.keys.justPressed.CONTROL;

		var shiftMult:Int = 1;
		if (FlxG.keys.pressed.SHIFT)
			shiftMult = 3;

		if (categories.length > 1)
		{
			if (upP)
			{
				changeSelection(-shiftMult);
				holdTime = 0;
			}
			if (downP)
			{
				changeSelection(shiftMult);
				holdTime = 0;
			}

			if (controls.UI_DOWN || controls.UI_UP)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if (holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				}
			}

			if (FlxG.mouse.wheel != 0)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.2);
				changeSelection(-shiftMult * FlxG.mouse.wheel, false);
			}
		}

		if (controls.BACK)
		{
			persistentUpdate = false;
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		else if (accepted)
		{
			canScroll = false;

			if (categories[curSelected].name == "all")
			{
				MusicBeatState.switchState(new FreeplayState());
				return;
			}

			if (categories[curSelected].name == "favorites")
			{
				trace("before: " + Favorite.favoriteSongs);
				Favorite.cleanFavoriteSongs();
				trace("after: " + Favorite.favoriteSongs);

				if (Favorite.favoriteSongs.length == 0)
				{
					MusicBeatState.switchState(new EmptyCategoryState());
				}
				else
				{
					MusicBeatState.switchState(new FreeplayState());
				}
				return;
			}

			var noSongs:Bool = categories[curSelected].songs == null || categories[curSelected].songs.length == 0;
			var noWeeks:Bool = categories[curSelected].weeks == null || categories[curSelected].weeks.length == 0;

			if (noSongs && noWeeks)
			{
				MusicBeatState.switchState(new EmptyCategoryState());
			}
			else
			{
				MusicBeatState.switchState(new FreeplayState());
			}
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0, playSound:Bool = true)
	{
		if (!canScroll)
		{
			return;
		}

		if (playSound)
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = categories.length - 1;
		if (curSelected >= categories.length)
			curSelected = 0;

		var newColor:Int = FlxColor.fromRGB(categories[curSelected].color[0], categories[curSelected].color[1], categories[curSelected].color[2]);
		if (newColor != intendedColor)
		{
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween)
				{
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpCategories.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}

typedef CategoriesMetaData =
{
	categories:Array<CategoryMetaData>
}

typedef CategoryMetaData =
{
	name:String,
	icon:String,
	?rating:String,
	color:Array<Int>,
	weeks:Array<String>,
	songs:Array<String>,
}
