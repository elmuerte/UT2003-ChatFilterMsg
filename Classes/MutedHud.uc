///////////////////////////////////////////////////////////////////////////////
// filename:    MutedHud.uc
// version:     101
// author:      Michiel 'El Muerte' Hendriks <elmuerte@drunksnipers.com>
// purpose:     display on the HUD that the player has been muted
///////////////////////////////////////////////////////////////////////////////

class MutedHud extends interaction;

var Texture Logo;
var float IconScale;
var string msg;

simulated function PostRender( canvas Canvas )
{
  local float X,Y;
  Canvas.style = 5; //ERenderStyle.STY_Alpha;
  Canvas.Font = class'HudBase'.static.GetMediumFontFor(Canvas);
  Canvas.StrLen(msg, X, Y);
  IconScale = Y/Logo.VSize;
  X = (Canvas.SizeX-X-(Logo.USize*IconScale))/2;  
  Y = 0;
  Canvas.SetPos(X, Y);
  Canvas.DrawIcon(Logo, IconScale);
  Canvas.SetDrawColor(255,0,0,127);
  Canvas.SetPos(X+(Logo.USize*IconScale), Y);
  Canvas.DrawText(msg, false);
}

defaultproperties
{
  msg=" ChatFilter: Muted"
  IconScale=0.5
  Logo=Texture'ChatFilterMsg152.ChatFilterLogoImage'
  bVisible=true
  bActive=true
  bRequiresTick=True
}
