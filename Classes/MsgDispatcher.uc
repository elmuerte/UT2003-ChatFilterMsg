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
  if (PC == none) return;
  if (PC.Player == none) return;
  if (PC.Player.GUIController == none) return;
  if (ChatFilterMsg(GUIController(PC.Player.GUIController).ActivePage) == none)
    PC.ClientOpenMenu("ChatFilterMsg152.ChatFilterMsg", true, String(Msg));
}

simulated function ChangeNamerequest(PlayerController PC, int Msg)
{
  if (PC == none) return;
  if (PC.Player == none) return;
  if (PC.Player.GUIController == none) return;
  if (ChangeNick(GUIController(PC.Player.GUIController).ActivePage) == none)
    PC.ClientOpenMenu("ChatFilterMsg152.ChangeNick", false, String(Msg));
}

simulated function MutedHud(PlayerController PC)
{
  if (PC == none) return;
  if (PC.Player == none) return;
  if (PC.Player.InteractionMaster == none) return;
  PC.Player.InteractionMaster.AddInteraction("ChatFilterMsg152.MutedHud", PC.Player);
}

defaultproperties
{
  RemoteRole=ROLE_SimulatedProxy
  bAlwaysRelevant=True
}