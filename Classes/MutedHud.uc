///////////////////////////////////////////////////////////////////////////////
// filename:    MutedHud.uc
// version:     101
// author:      Michiel 'El Muerte' Hendriks <elmuerte@drunksnipers.com>
// purpose:     display on the HUD that the player has been muted
///////////////////////////////////////////////////////////////////////////////

class MutedHud extends interaction;

var Texture Logo;
var float IconScale;

simulated function PostRender( canvas Canvas )
{
  Canvas.SetPos(0, canvas.SizeY-(Logo.VSize*IconScale));
  Canvas.DrawIcon(Logo, IconScale);
}

defaultproperties
{
  IconScale=0.5
  Logo=Texture'ChatFilterMsg152.ChatFilterLogoImage'
  bVisible=true
  bActive=true
  bRequiresTick=True
}
