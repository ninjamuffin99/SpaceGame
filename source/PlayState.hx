package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var gameButton:FlxButton;
	private var gameMakeSkill:Float = 0;
	private var skillTexts:FlxText;
	
	private var dateTxt:FlxText;
	
	private var weeks:Int = 0;
	private var month:Int = 0;
	private var year:Int = 0;
	
	override public function create():Void
	{
		gameButton = new FlxButton(0, 0, "Make Game", makeGame);
		gameButton.screenCenter();
		add(gameButton);
		
		skillTexts = new FlxText(20, 20, 0, "", 32);
		add(skillTexts);
		
		dateTxt = new FlxText(20, 70, 0, "", 32);
		add(dateTxt);
		
		super.create();
	}

	private function makeGame():Void
	{
		weeks += 1;
		gameMakeSkill += FlxG.random.float(0, 3.5);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		month = Std.int(weeks / 4.34524);
		year = Std.int(month / 12);
		
		skillTexts.text = Std.string(gameMakeSkill);
		
		dateTxt.text = "Week: " + weeks + "\nMonth: " + month + "\nYear: " + year;
		
	}
}