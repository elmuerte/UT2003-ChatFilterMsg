///////////////////////////////////////////////////////////////////////////////
// filename:    MsgDispatcher.uc
// version:     101
// author:      Michiel 'El Muerte' Hendriks <elmuerte@drunksnipers.com>
// purpose:     dispatched messages to players
///////////////////////////////////////////////////////////////////////////////

class MsgDispatcher extends Actor;

replication
{
  reliable if( Role==ROLE_Authority )
    Dispatch, ChangeNamerequest, MutedHud;
}

simulated function Dispatch(PlayerController PC, int Msg)
{
  log("Dispatch message");
  if (PC == none) return;
  if (PC.Player == none) return;
  if (PC.Player.GUIController == none) return;
  if (ChatFilterMsg(GUIController(PC.Player.GUIController).ActivePage) == none)
    PC.ClientOpenMenu("ChatFilterMsg155.ChatFilterMsg", true, String(Msg));
}

simulated function ChangeNamerequest(PlayerController PC, int Msg)
{
  log("Name request");
  if (PC == none) return;
  if (PC.Player == none) return;
  if (PC.Player.GUIController == none) return;
  if (ChangeNick(GUIController(PC.Player.GUIController).ActivePage) == none)
    PC.ClientOpenMenu("ChatFilterMsg155.ChangeNick", false, String(Msg));
}

simulated function MutedHud(PlayerController PC)
{
  log("Muted hud");
  if (PC == none) return;
  if (PC.Player == none) return;
  if (PC.Player.InteractionMaster == none) return;
  PC.Player.InteractionMaster.AddInteraction("ChatFilterMsg155.MutedHud", PC.Player);
}

defaultproperties
{
  bHidden=true
  RemoteRole=ROLE_SimulatedProxy
  bAlwaysRelevant=True
}