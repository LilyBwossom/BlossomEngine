package states;

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
					instance.addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
				}
			}
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

		/*
			switch (WeekName)
			{
				case 'vanilla':
					// there is probably a better way to add all vanilla songs but this will do for now
					addSongs(instance, [
						'Tutorial', 'Bopeebo', 'Fresh', 'Dad Battle',          'Spookeez',  'South', 'Monster',   'Pico', 'Philly Nice', 'Blammed', 'Satin Panties',
							'High',    'Milf', 'Cocoa',     'Eggnog', 'Winter Horrorland', 'Senpai',   'Roses', 'Thorns',         'Ugh',    'Guns',        'Stress'
					]);
				case 'b-side':
					addSongs(instance, [
						'Bopeebo-b', 'Fresh-b', 'Dadbattle-b', 'spookeez-b', 'South-b', 'Pico-b', 'Philly-b', 'Blammed-b', 'Satin-Panties-b', 'High-b', 'Milf-b',
						'Cocoa-b', 'Eggnog-b', 'Winter-Horrorland-b', 'Senpai-b', 'Roses-b', 'Thorns-b'
					]);
				case 'erect':
					addSongs(instance, [
						'dadbattle-erect',
						'south-erect',
						'blammed-erect',
						'senpai-erect',
						'roses-erect',
						'thorns-brightfyre',
						'thorns-leebert'
					]);
				case 'creepypasta':
					addSongs(instance, [
						'too-slow-fatass-remix',
						'too-slow-old',
						'monochrome-fatass-metal-cover',
						'triple-trouble-fatass-metal-cover',
						'execution-old',
						'execution-remix',
						'sunshine-remix'
					]);
				case 'sonic':
					addSongs(instance, ['endless-old', 'phantasm', 'Prey', 'pasta-night']);
					addWeek(instance, 'thriller gen');
					addWeek(instance, 'replay');
				case 'smoke-em-out-struggle':
					addSongs(instance, [
						'Headache', 'Nerves', 'Release', 'Fading', 'headache-', 'nerves-', 'release-', 'fading-', 'Good Enough', 'Lover', 'Tug Of War',
						'Take A Swig of This', 'Animal', 'Dilemma', 'Drowning'
					]);
				case 'miku':
					addSongs(instance, ['aishite', 'disappearance', 'popipo', 'ievan polkka']);
				case 'amongus':
					addWeek(instance, 'redimpostor');
					addWeek(instance, 'mira');
					addWeek(instance, 'skeld');
					addWeek(instance, 'defeat');
				case 'tricky':
					addSongs(instance, [
						'Improbable-Outset',
						'madness',
						'hellclown',
						'expurgation',
						'Expurgation',
						'improbable-outset-Neutroa',
						'madness-Neutroa-Remix',
						'Expurgation-Neutroa-Remix'
					]);
				case 'hank':
					addSongs(instance, ['accelerant', 'inundation', 'gunfight', 'sacrifice']);
				case 'mid-fight-masses':
					addSongs(instance, ['Parish', 'Worship', 'Zavodila', 'Gospel', 'glazomer', 'crescendo']);
					addWeek(instance, 'vsselever');
					addWeek(instance, 'vsselever2');
				case 'sky':
					addSongs(instance, ['wife-forever', 'sky', 'manifest']);
				case 'ski':
					addSongs(instance, [
						'Meow',
						'Foolhardy',
						'Sporty Ski',
						'Bopeepow',
						'Talentless Ski',
						'No Memes',
						'Manifest'
					]);
				case 'tabi':
					addSongs(instance, ['my-battle', 'last-chance', 'genocide']);
				case 'whitty':
					addSongs(instance, ['lo-fight', 'overhead', 'ballistic-old']);
					addWeek(instance, 'whitty_aside');
				case 'fnaf':
					addWeek(instance, 'week87');
					addWeek(instance, 'fnaf1');
					addWeek(instance, 'fnaf2');
					addWeek(instance, 'fnaf3');
					addWeek(instance, 'fnaf4');
					addWeek(instance, 'fnaf5');
					addWeek(instance, 'vs_vloo');
					addWeek(instance, 'bite');
				case 'qt':
					addWeek(instance, 'QT Week');
				case 'herobrine':
					addWeek(instance, 'Herobrine-Week');
				case 'hex':
					addWeek(instance, 'HEXTRAVAGANZA');
					addWeek(instance, 'Encore');
				case 'indie-cross':
					addWeek(instance, 'Cuphead-Week');
					addWeek(instance, 'Sans-Week');
					addWeek(instance, 'Bendy-Week');
					addWeek(instance, 'week-sans-freeplay');
					addWeek(instance, 'BonusSongs-Week');
					addWeek(instance, 'Nightmare-Week');
					addWeek(instance, 'secret_songs_week');
				case 'hotline-024':
					addWeek(instance, 'HL24FP1');
					addWeek(instance, 'HL24FP2');
					addWeek(instance, 'HL24EX');
					addWeek(instance, 'HL24CV');
					addWeek(instance, 'HL24SC1');
					addWeek(instance, 'HL24SC2');
					addWeek(instance, 'HL24SC3');
					addWeek(instance, 'HL24SC404');
				case 'misc':
					addSongs(instance, ['killer-scream', 'foolhardy', 'run', 'Playtime', 'Atrocity']);
			};
		 */
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
					var colors:Array<Int> = song[2];
					if (colors == null || colors.length < 3)
					{
						colors = [146, 113, 253];
					}
					instance.addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
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
				if (!songsArray.contains(song[0]))
				{
					continue;
				}

				var colors:Array<Int> = song[2];
				if (colors == null || colors.length < 3)
				{
					colors = [146, 113, 253];
				}
				instance.addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]));
			}
		}
	}

	var selector:FlxText;

	public static var curSelected:Int = 0;

	private var iconArray:Array<HealthIcon> = [];

	private var grpCategories:FlxTypedGroup<Alphabet>;

	var currentCategoryName:Alphabet;

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
				name: "all",
				icon: "dad",
				color: [135, 206, 250],
				weeks: null,
				songs: null
			}
		];
		for (mod in Mods.getModDirectories())
		{
			trace(Paths.mods(mod) + '/categories');
			var categoriesFolder:String = Paths.mods(mod) + '/categories';
			if (FileSystem.exists(categoriesFolder))
			{
				for (jsonFile in FileSystem.readDirectory(categoriesFolder))
				{
					trace(File.getContent(categoriesFolder + '/' + jsonFile));
					var jsonCategories:CategoriesMetaData = tjson.TJSON.parse(File.getContent(categoriesFolder + '/' + jsonFile));
					for (category in jsonCategories.categories)
					{
						categories.push(category);
					}
				}
			}
		}
		// FlxColor.fromRGB(category.color[0], category.color[1], category.color[2])

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
			trace(categories[i].name);
			trace(categories[i].name);
			trace(categories[i].name);
			trace(categories[i].name);
			trace(categories[i].name);
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
			var icon:HealthIcon = new HealthIcon(categories[i].icon);
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

		var selectedCategoryText:Alphabet = new Alphabet(0, 10, "Selected Category", true);
		selectedCategoryText.scaleX = 0.5;
		selectedCategoryText.scaleY = 0.5;
		selectedCategoryText.screenCenter(X);
		add(selectedCategoryText);

		var selectedCategoryTextColon:Alphabet = new Alphabet(0, -10, ":", false);
		selectedCategoryTextColon.scaleX = 0.5;
		selectedCategoryTextColon.scaleY = 0.5;
		selectedCategoryTextColon.screenCenter(X);
		selectedCategoryTextColon.x += 210;
		add(selectedCategoryTextColon);

		currentCategoryName = new Alphabet(0, 25, "", false);
		currentCategoryName.scaleX = 0.5;
		currentCategoryName.scaleY = 0.5;
		currentCategoryName.screenCenter(X);
		add(currentCategoryName);

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
			MusicBeatState.switchState(new FreeplayState());
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
	color:Array<Int>,
	weeks:Array<String>,
	songs:Array<String>,
}
