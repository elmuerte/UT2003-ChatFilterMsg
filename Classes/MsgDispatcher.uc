///////////////////////////////////////////////////////////////////////////////
// filename:    MsgDispatcher.uc
// version:     100
// author:      Michiel 'El Muerte' Hendriks <elmuerte@drunksnipers.com>
// purpose:     dispatched messages to players
///////////////////////////////////////////////////////////////////////////////

class MsgDispatcher extends Actor;

replication
{
  reliable if( Role==ROLE_Authority )
    Dispatch, MuteHud, ChangeNamerequest;
}

simulated function Dispatch(PlayerController PC, int Msg)
{
  PC.ClientOpenMenu("ChatFilterMsg.ChatFilterMsg", true, String(Msg));
}

simulated function ChangeNamerequest(PlayerController PC)
{
  PC.ClientOpenMenu("ChatFilterMsg.ChangeNick");
}

simulated function MuteHud(PlayerController PC)
{
  /*
  can't get this damn thing to work
  if (Viewport(PC.Player) != None) // Find the local Player
  {
    PC.Player.InteractionMaster.AddInteraction("ChatFilterMsg.MutedHud", PC.Player);
  }
  */
}

defaultproperties
{
  RemoteRole=ROLE_SimulatedProxy
  bAlwaysRelevant=True
}