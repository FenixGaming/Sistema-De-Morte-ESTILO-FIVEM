//==========================================================================================
//SISTEMA BASE BY JEFERSON_GAMER https://www.youtube.com/channel/UCcjMsuvtSPwelM6hWD83csQ
//SISTEMA DE MORTE ESTILO FIVEM (AO DESISTIR VAI PARA HOSPITAL! + COMANDO DE REANIMAR!)
//==========================================================================================
//SISTEMA EDITADO BY <FENIX GAMING> https://discord.io/equipefenix
//==========================================================================================
#define SSCANF_NO_NICE_FEATURES
//===================[INCLUDES]===========================
#include <a_samp>
#include <streamer>
#include <sscanf2>
#include <zcmd>
//=========================================================

//====================[DEFINES+ENUM]============================
#define SCM SendClientMessage
#define function%0(%1)\
forward %0(%1); public %0(%1)

enum mInfo
{
  Float:pPos1,
  Float:pPos2,
  Float:pPos3,
  pInterior,
  pVirtual,
}
new MorteInfo[MAX_PLAYERS][mInfo];
//================================================================


//===============[VARIAVEIS]============================
new TimerMorto[MAX_PLAYERS];
new TempoMorto[MAX_PLAYERS];
new PlayerText:TextDrawMorte[MAX_PLAYERS][10];

//=======================================================
main()
{
	printf("SISTEMA DE MORTE EDITADO BY FENIX GAMING");
}

//===========================[PUBLICS+SISTEMA]===============================

public OnPlayerConnect(playerid)
{
    KillTimer(TimerMorto[playerid]);
	TextDrawMorte[playerid][0] = CreatePlayerTextDraw(playerid, 319.000000, 1.000000, "_");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][0], 0.600000, 48.699981);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][0], 298.500000, 649.000000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][0], 2);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][0], 172);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][0], 0);

	TextDrawMorte[playerid][1] = CreatePlayerTextDraw(playerid, 282.000000, 96.000000, "A");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][1], 2.150002, 10.549998);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][1], 3);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][1], 4);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][1], 1);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][1], -16776961);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][1], -16776961);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][1], 0);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][1], 0);

	TextDrawMorte[playerid][2] = CreatePlayerTextDraw(playerid, 293.000000, 150.000000, "z");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][2], 0.924999, 3.299991);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][2], 303.000000, -14.500000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][2], 2);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][2], 135);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][2], 0);

	TextDrawMorte[playerid][3] = CreatePlayerTextDraw(playerid, 310.000000, 142.000000, "_");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][3], -3.337501, 4.049996);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][3], 289.500000, 27.000000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][3], 2);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][3], -16776961);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][3], 0);

	TextDrawMorte[playerid][4] = CreatePlayerTextDraw(playerid, 324.000000, 147.000000, "z");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][4], 0.949999, 3.749990);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][4], 303.000000, -14.500000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][4], 2);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][4], 135);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][4], 0);

	TextDrawMorte[playerid][5] = CreatePlayerTextDraw(playerid, 310.000000, 121.000000, "z");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][5], 1.016666, 4.149991);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][5], 303.000000, -14.500000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][5], 2);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][5], 135);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][5], 0);

	TextDrawMorte[playerid][6] = CreatePlayerTextDraw(playerid, 223.000000, 185.000000, "VOCE_DESMAIOU!");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][6], 0.754167, 2.899993);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][6], 1);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][6], -16776961);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][6], 0);

	TextDrawMorte[playerid][7] = CreatePlayerTextDraw(playerid, 304.000000, 238.000000, "0");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][7], 2);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][7], 0.483334, 2.199994);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][7], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][7], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][7], 1);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][7], -2686721);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][7], 50);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][7], 0);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][7], 0);

	TextDrawMorte[playerid][8] = CreatePlayerTextDraw(playerid, 322.000000, 354.000000, "_");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][8], 0.600000, 3.050000);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][8], 298.500000, 148.500000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][8], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][8], 2);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][8], -1061109505);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][8], 0);

	TextDrawMorte[playerid][9] = CreatePlayerTextDraw(playerid, 252.000000, 358.000000, "DESISTIR_IMEDIATAMENTE!");
	PlayerTextDrawFont(playerid, TextDrawMorte[playerid][9], 2);
	PlayerTextDrawLetterSize(playerid, TextDrawMorte[playerid][9], 0.266665, 2.050000);
	PlayerTextDrawTextSize(playerid, TextDrawMorte[playerid][9], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, TextDrawMorte[playerid][9], 0);
	PlayerTextDrawSetShadow(playerid, TextDrawMorte[playerid][9], 0);
	PlayerTextDrawAlignment(playerid, TextDrawMorte[playerid][9], 1);
	PlayerTextDrawColor(playerid, TextDrawMorte[playerid][9], -16776961);
	PlayerTextDrawBackgroundColor(playerid, TextDrawMorte[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, TextDrawMorte[playerid][9], 50);
	PlayerTextDrawUseBox(playerid, TextDrawMorte[playerid][9], 0);
	PlayerTextDrawSetProportional(playerid, TextDrawMorte[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, TextDrawMorte[playerid][9], 1);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
   //SendDeathMessage(killerid,playerid,reason);   //MENSAGEM DE MORTE
   GetPlayerPos(playerid, MorteInfo[playerid][pPos1], MorteInfo[playerid][pPos2], MorteInfo[playerid][pPos3]);
   MorteInfo[playerid][pInterior] = GetPlayerInterior(playerid);
   MorteInfo[playerid][pVirtual] = GetPlayerVirtualWorld(playerid);

   for(new idx=0; idx<10; idx++){
   PlayerTextDrawShow(playerid,TextDrawMorte[playerid][idx]);}

   new string[128];
   format(string, sizeof(string),"~r~300_Segundos", TempoMorto);
   PlayerTextDrawSetString(playerid,TextDrawMorte[playerid][7],string);
   PlayerTextDrawShow(playerid,TextDrawMorte[playerid][7]);
   TempoMorto[playerid] = 300;//300 = SEGUNDOS
   TimerMorto[playerid]  = SetTimerEx("morto", 1000, true,"i",playerid);
   return 1;
}
forward morto(playerid);
public morto(playerid)
{
    TempoMorto[playerid] --;
	new string[128];
	format(string, sizeof(string),"~r~%d_Segundos", TempoMorto);
	PlayerTextDrawSetString(playerid,TextDrawMorte[playerid][7],string);
	PlayerTextDrawHide(playerid,TextDrawMorte[playerid][7]);
	PlayerTextDrawShow(playerid,TextDrawMorte[playerid][7]);

    SetPlayerHealth(playerid, 9999);
    SetPlayerPos(playerid, MorteInfo[playerid][pPos1], MorteInfo[playerid][pPos2], MorteInfo[playerid][pPos3]);
    SetPlayerInterior(playerid, MorteInfo[playerid][pInterior]);
    SetPlayerVirtualWorld(playerid, MorteInfo[playerid][pVirtual]);
    ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 1, 1, 1, -1, 1);
	SelectTextDraw(playerid, 0xFF4040AA);

    if(TempoMorto[playerid] < 1)
	{
    TempoMorto[playerid] = 0;
    SetPlayerHealth(playerid, 150.0);
    KillTimer(TimerMorto[playerid]);
    ClearAnimations(playerid, 1);
    SendClientMessage(playerid,0xC72C30FF, "[MORTE]:Voce Morreu e Ninguem Te Salvou!");
    for(new idx=0; idx<10; idx++)
	{
    PlayerTextDrawHide(playerid,TextDrawMorte[playerid][idx]);
	}
	CancelSelectTextDraw(playerid);
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == TextDrawMorte[playerid][9])
		{
        SendClientMessage(playerid,0xC72C30FF, "[MORTE]:VOCE DESISTIU DE VIVER E POR ISSO PAGOU R$10.000 PARA O HOSPITAL!");
		GivePlayerMoney(playerid,-10000);//DINHEIRO APÓS DESISTIR
		KillTimer(TimerMorto[playerid]);
		ClearAnimations(playerid, 1);
		for(new idx=0; idx<10; idx++)
		{
		PlayerTextDrawHide(playerid,TextDrawMorte[playerid][idx]);
		}
		SetPlayerPos(playerid,1183.3020,-1332.3422,13.5829);//AO DESISTIR SERÁ SETADO NO HOSPITAL
		CancelSelectTextDraw(playerid);
		}
	return 1;
}

forward ReanimandoPlayer(playerid, otherid);
public ReanimandoPlayer(playerid, otherid)
{
	new Float:Life[MAX_PLAYERS];
	GetPlayerHealth(otherid, Life[otherid]);
	ClearAnimations(otherid,1);//PARAR ANIMAÇÃO PARA O PACIENTE
	ClearAnimations(playerid,1);//PARAR ANIMAÇÃO PARA O MÉDICO
	SetPlayerHealth(otherid, 150.0);//SETAR VIDA PARA O PACIENTE
	SCM(otherid, 0x5ECE0BFF, "O Medico curou voce e isso lhe custou R$4000");//MENSAGEM
	SCM(playerid, 0x5ECE0BFF, "Voce recebeu 1000R$ por salvar uma vida");//MENSAGEM
	GivePlayerMoney(otherid,-4000);//DINHEIRO APÓS PAGAR MÉDICO
	GivePlayerMoney(playerid,4000);//DINHEIRO RECEBCER PARA O MÉDICO
	TempoMorto[playerid] = 0;
	KillTimer(TimerMorto[playerid]);
	SetPlayerPos(playerid, MorteInfo[playerid][pPos1], MorteInfo[playerid][pPos2], MorteInfo[playerid][pPos3]);
    SetPlayerInterior(playerid, MorteInfo[playerid][pInterior]);
    SetPlayerVirtualWorld(playerid, MorteInfo[playerid][pVirtual]);
	for(new idx=0; idx<10; idx++)
	{
    PlayerTextDrawHide(otherid,TextDrawMorte[playerid][idx]);
	}
	return 1;
}

//===================[COMANDOS]=======================

CMD:reanimar(playerid, params[])
{
	new ID, Float:Pos[3], Float:distance;
	if(sscanf(params, "d", ID)) return SCM(playerid, -1, "USE: /reanimar [ID]");
	GetPlayerPos(ID, Pos[0], Pos[1], Pos[2]);
	distance = GetPlayerDistanceFromPoint(playerid, Pos[0], Pos[1], Pos[2]);
	if(distance < 2)
	{
		ApplyAnimation(playerid, "MEDIC", "CPR", 4.1, 0, 0, 0, 0, 0, 1);//ANIMAÇÃO DE REVIVER
		SetTimerEx("ReanimandoPlayer", 5000, false, "dd", playerid, ID);//TIMER DE REVIVER
		return 1;
	}
	SCM(playerid, 0xC72C30FF, "Voce nao esta perto do paciente!");//MENSAGEM
	return 1;
}


//==========================================================================================
//SISTEMA BASE BY JEFERSON_GAMER https://www.youtube.com/channel/UCcjMsuvtSPwelM6hWD83csQ
//SISTEMA DE MORTE ESTILO FIVEM (AO DESISTIR VAI PARA HOSPITAL! + COMANDO DE REANIMAR!)
//==========================================================================================
//SISTEMA EDITADO BY <FENIX GAMING> https://discord.io/equipefenix
//==========================================================================================
//============================[FIM DO SISTEMA]=========================================================

