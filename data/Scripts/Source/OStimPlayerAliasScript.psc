ScriptName OStimPlayerAliasScript Extends ReferenceAlias

OSexIntegrationMain Property OStim Auto

Event OnInit()
	OStim = (GetOwningQuest()) as OsexIntegrationMain
EndEvent

Event OnPlayerLoadGame()
	OStim.OnLoadGame()
	
	(Game.GetFormFromFile(0xE3E, "OStim.esp") As OSexIntegrationMCM).SetupPages()
EndEvent
