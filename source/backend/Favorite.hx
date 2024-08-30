package backend;

import objects.HealthIcon;
import states.FreeplayState.SongMetadata;

class Favorite
{
	public static var favoriteSongs:Array<String> = new Array<String>();

	public static function addFavorite(songName:String):Void
	{
		favoriteSongs.push(songName);
		FlxG.save.data.favorites = favoriteSongs;
		FlxG.save.flush();
	}

	public static function removeFavorite(songName:String):Void
	{
		favoriteSongs.remove(songName);
		FlxG.save.data.favorites = favoriteSongs;
		FlxG.save.flush();
	}

	public static function addStarIcon(songText:FlxSprite):HealthIcon
	{
		var starIcon:HealthIcon = new HealthIcon("star");
		starIcon.offset.x -= 40;
		starIcon.offset.y -= 30;
		starIcon.scale.x = 0.5;
		starIcon.scale.y = 0.5;
		starIcon.sprTracker = songText;
		starIcon.visible = starIcon.active = false;

		return starIcon;
	}

	public static function isFavoriteSong(song:SongMetadata):Bool
	{
		return Favorite.favoriteSongs.contains(song.songName);
	}

	public static function cleanFavoriteSongs()
	{
		var songFound:Bool;
		var cleanFavoriteSongs:Array<String> = [];

		WeekData.reloadWeekFiles(false);

		if (favoriteSongs != null)
		{
			for (songName in favoriteSongs)
			{
				songFound = false;
				for (i in 0...WeekData.weeksList.length)
				{
					if (songFound)
						break;

					var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);

					WeekData.setDirectoryFromWeek(leWeek);

					for (song in leWeek.songs)
					{
						if (song[0] == songName)
						{
							cleanFavoriteSongs.push(songName);
							songFound = true;
							break;
						}
					}
				}
			}
		}

		favoriteSongs = cleanFavoriteSongs;
		FlxG.save.data.favorites = favoriteSongs;
		FlxG.save.flush();
	}

	public static function load():Void
	{
		if (FlxG.save.data.favorites != null)
		{
			favoriteSongs = FlxG.save.data.favorites;
		}
	}
}
