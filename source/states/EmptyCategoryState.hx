package states;

import backend.Favorite;
import backend.Mechanic;
import backend.WeekData;
import backend.Highscore;
import backend.Song;
import objects.HealthIcon;
import objects.MusicPlayer;
import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;
import flixel.math.FlxMath;

class EmptyCategoryState extends MusicBeatState
{
	var bg:FlxSprite;
	var colorTween:FlxTween;

	override function create()
	{
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.screenCenter();
		add(bg);

		WeekData.setDirectoryFromWeek();

		var emptyText:FlxText = new FlxText(0, FlxG.height * 0.4, 0, "this category contains no songs", 100);
		emptyText.setFormat(Paths.font("vcr.ttf"), 48, FlxColor.BLACK, CENTER);
		emptyText.screenCenter(X);
		add(emptyText);

		super.create();
	}

	override function update(elapsed:Float)
	{
		if (controls.BACK)
		{
			persistentUpdate = false;
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new FreeplaySelectState());
		}
	}
}
