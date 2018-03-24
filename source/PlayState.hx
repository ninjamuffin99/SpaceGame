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
	private var submitGameBtn:FlxButton;
	private var releaseBtn:FlxButton;
	
	private var gameMakeSkill:Float = 0;
	private var skillTexts:FlxText;
	
	private var dateTxt:FlxText;
	
	private var weeks:Int = 1;
	private var month:Int = 1;
	private var year:Int = 1;
	
	private var curGameQuality:Float = 0;
	private var curGameSales:Int = 0;
	private var curGameScore:Float = 0;
	private var submittedIGF:Bool = false;
	
	override public function create():Void
	{
		gameButton = new FlxButton(0, 0, "Make Game", makeGame);
		gameButton.screenCenter();
		add(gameButton);
		
		submitGameBtn = new FlxButton(0, 100, "Submit Game to IGF", submitToIGF);
		submitGameBtn.screenCenter(X);
		add(submitGameBtn);
		
		releaseBtn = new FlxButton(0, 140, "Release Game", releaseGame);
		releaseBtn.screenCenter(X);
		add(releaseBtn);
		
		skillTexts = new FlxText(20, 20, 0, "", 32);
		add(skillTexts);
		
		dateTxt = new FlxText(20, 150, 0, "", 32);
		add(dateTxt);
		
		super.create();
	}

	private function makeGame():Void
	{
		weeks += 1;
		gameMakeSkill += FlxG.random.float(0, 3.5);
		curGameQuality += FlxG.random.float(0, 0.5) * gameMakeSkill;
		curGameScore += FlxG.random.float(0.07, 0.19);
	}
	
	private function submitToIGF():Void
	{
		if (submittedIGF)
		{
			
		}
		else
		{
			weeks += 1;
			submittedIGF = true;
		}
		
	}
	
	private function releaseGame():Void
	{
		curGameSales = Std.int(curGameQuality);
		curGameQuality = 0;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (weeks == 12)
		{
			submittedIGF = false;
		}
		
		month = Std.int(weeks / 4.34524);
		year = Std.int(month / 12);
		
		skillTexts.text = Std.string(gameMakeSkill) + "\n" + curGameScore + "\nSales: " + curGameSales;
		
		dateTxt.text = "Week: " + weeks + "\nMonth: " + month + "\nYear: " + year;
		
	}
}