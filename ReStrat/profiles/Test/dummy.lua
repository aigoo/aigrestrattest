-----------------------------------------------------------------------------
--Gloomclaw, Aigoo's Noob Profile.
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
--Encounter Logic
-----------------------------------------------------------------------------

--Binary Daemon
local function binaryInit()
	local binary = "Gloomclaw";
	
	-----------------------------
	--Initial Timers
	-----------------------------
	ReStrat.tEncounterVariables.addwaves = function() 
		ReStrat:createAlert("Next Add Wave", 25, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwaves) 
	end

	ReStrat.tEncounterVariables.addwavestwoandfive = function() 
		ReStrat:createAlert("Phase 2, Next Add Wave", 34, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwavestwoandfive) 
		--ReStrat:createAlert("Phase 5, Next Add Wave", 21, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwavestwoandfive) 
	end
	

	ReStrat:createAlert("First Add Wave", 2, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwaves)
	ReStrat:createAlert("First Rupture", 26, nil, ReStrat.color.purple, nil)

	-----------------------------
	--Gloomclaw Two and Five
	-----------------------------
	--Phase twoAndFive
	local twoAndFive = function() 
		for i=1, #ReStrat.tAlerts do
			ReStrat.tAlerts[i].alert:Destroy();
		end
		
		ReStrat.tAlerts = {};

		ReStrat:createAlert("Phase 2, Next Add Wave", 34, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwavestwoandfive) 
		--ReStrat:createAlert("Phase 5, Next Add Wave", 21, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwavestwoandfive)
		ReStrat:createAlert("First Rupture", 25, nil, ReStrat.color.purple, nil) 
	end
	
	--ReStrat:createCastTrigger("aigoo oooooooooooooooooooooooo", "Charged Shot", twoAndFive);
	ReStrat:createCastTrigger(binary, "Manifest Fear", twoAndFive);	

	-----------------------------
	--Gloomclaw MoOs
	-----------------------------
	local gloomMoos = function()
		for i=1, #ReStrat.tAlerts do
			ReStrat.tAlerts[i].alert:Destroy();
		end
		
		ReStrat.tAlerts = {};
		
		

		ReStrat:createAlert("Phase change, 15s MoO", 15, nil, ReStrat.color.red, nil)
	end
	
	ReStrat:createCastTrigger("aigoo oooooooooooooooooooooooo", "Vitality Burst", gloomMoos);
	--ReStrat:OnDatachron("Gloomclaw is reduced to a weakened state!", gloomMoos);

	-----------------------------
	--Gloomclaw's Final MoO
	-----------------------------
	local finalMoos = function()
		for i=1, #ReStrat.tAlerts do
			ReStrat.tAlerts[i].alert:Destroy();
		end
		
		ReStrat.tAlerts = {};
		
		

		ReStrat:createAlert("GO FKIN HAM", 20, nil, ReStrat.color.red, nil)
	end
	
	ReStrat:createCastTrigger("aigoo oooooooooooooooooooooooo", "Vitality Burst", finalMoos);
	--ReStrat:OnDatachron("Gloomclaw is reduced to a weakened state!", finalMoos);
		
	
	-----------------------------
	--Phase Forwards
	-----------------------------
	local phasePlus = function() 
		for i=1, #ReStrat.tAlerts do
			ReStrat.tAlerts[i].alert:Destroy();
		end
		
		ReStrat.tAlerts = {};
		
		
		ReStrat:createAlert("First Add Wave", 10, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwaves)
		ReStrat:createAlert("First Rupture", 35, nil, ReStrat.color.purple, nil)
	end

	--ReStrat:createCastTrigger("aigoo oooooooooooooooooooooooo", "Arcane Missiles", phasePlus);
	ReStrat:OnDatachron("Gloomclaw is pushed back by the purification of the essences!", phasePlus);

	-----------------------------
	--Phase Backwards
	-----------------------------
	local phaseMinus = function() 
		for i=1, #ReStrat.tAlerts do
			ReStrat.tAlerts[i].alert:Destroy();
		end
		
		ReStrat.tAlerts = {};
		
		
		ReStrat:createAlert("First Add Wave", 2, nil, ReStrat.color.green, ReStrat.tEncounterVariables.addwaves)
		ReStrat:createAlert("First Rupture", 26, nil, ReStrat.color.purple, nil)
	end

	--ReStrat:createCastTrigger("aigoo oooooooooooooooooooooooo", "Quick Draw", phaseMinus);
	ReStrat:OnDatachron("Gloomclaw is moving forward to corrupt more essences!", phaseMinus);
	
	
	-----------------------------
	--Gloomclaw Casts
	-----------------------------
	--Next Rupture
	local nextRupture = function() 
		ReStrat:createAlert("Rupture Cooldown", 30, nil, ReStrat.color.purple, nil) 
	end
	
	--ReStrat:createCastTrigger("aigoo oooooooooooooooooooooooo", "Charged Shot", nextRupture);
	ReStrat:createCastTrigger(binary, "Rupture", nextRupture);
		-------------------------------------------
		--ReStrat:createCastAlert(binary, "Rupture", nil, "Icon_SkillEsper_Awaken_Alt", ReStrat.color.red, nextRupture);
		-------------------------------------------
	
end

-----------------------------------------------------------------------------
--Encounter Packaging
-----------------------------------------------------------------------------
if not ReStrat.tEncounters then
	ReStrat.tEncounters = {}
end

--Profile Settings
ReStrat.tEncounters["Gloomclaw"] = {
	fInitFunction = binaryInit,
	strCategory  = "Test",
	tModules = {
		["Rupture"] = {
			strLabel = "Rupture",
			bEnabled = true,
		},

	}
}