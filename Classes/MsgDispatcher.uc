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
    Dispatch, ChangeNamerequest;
}

simulated function Dispatch(PlayerController PC, int Msg)
{
  PC.ClientOpenMenu("ChatFilterMsg151.ChatFilterMsg", true, String(Msg));
}

simulated function ChangeNamerequest(PlayerController PC)
{
  PC.ClientOpenMenu("ChatFilterMsg151.ChangeNick");
}

defaultproperties
{
  RemoteRole=ROLE_SimulatedProxy
  bAlwaysRelevant=True
}