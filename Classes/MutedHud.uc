///////////////////////////////////////////////////////////////////////////////
// filename:    MutedHud.uc
// version:     100
// author:      Michiel 'El Muerte' Hendriks <elmuerte@drunksnipers.com>
// purpose:     show a player he's muted
///////////////////////////////////////////////////////////////////////////////

class MutedHud extends Interaction;

var Texture Logo;

simulated function PostRender( canvas Canvas )
{
  canvas.DrawTile(Logo, Logo.USize, Logo.VSize, 0, 0, Logo.USize, Logo.VSize );
}

defaultproperties
{
  Logo=Texture'ChatFilterMsg.ChatFilterLogoImage'
  bRequiresTick=True
  bVisible=true
  bActive=true
}