NDefines.NGame.END_DATE = "1836.1.2"
NDefines.NGame.MAX_COLONIAL_NATIONS = 500
NDefines.NDiplomacy.VASSALIZE_BASE_DEVELOPMENT_CAP = 200 			
NDefines.NDiplomacy.MARCH_BASE_DEVELOPMENT_CAP = 300 				
NDefines.NDiplomacy.MAX_FREE_CITIES = 18
NDefines.NDiplomacy.FABRICATE_CLAIM_COST = 50
NDefines.NDiplomacy.FABRICATE_CLAIM_COST_MODIFIER_PER_CLAIM = 0.2
NDefines.NDiplomacy.JUSTIFY_TRADE_CONFLICT_COST = 10
NDefines.NDiplomacy.INFILTRATE_ADMINISTRATION_COST = 70
NDefines.NDiplomacy.SABOTAGE_REPUTATION_COST = 90
NDefines.NDiplomacy.STEAL_MAPS_COST = 50
NDefines.NDiplomacy.SUPPORT_REBELS_COST = 60
NDefines.NDiplomacy.SOW_DISCONTENT_COST = 80
NDefines.NDiplomacy.AGITATE_FOR_LIBERTY_COST = 90
NDefines.NDiplomacy.SABOTAGE_RECRUITMENT_COST = 80
NDefines.NDiplomacy.SLANDER_MERCHANTS_COST = 90	
NDefines.NCountry.CORRUPTION_FROM_BANNERS = 0.75
NDefines.NCountry.MAX_CROWN_COLONIES = 2						
NDefines.NEconomy.LARGE_COLONIAL_NATION_LIMIT = 15
NDefines.NEconomy.PIRATES_MONOPOLY_BONUS = -0.25
NDefines.NMilitary.FORTRESS_COST = 0.25

NDefines.NDiplomacy.PEACE_COST_DEMAND_PROVINCE = 1					-- Demand a province (scales by province wealth, also used for annex)
NDefines.NDiplomacy.PEACE_COST_CONCEDE_PROVINCE = 1				-- Demand colonial area province concession.
NDefines.NDiplomacy.PEACE_COST_BECOME_VASSAL = 0.75					-- Vassalize a country (scales by province wealth)
NDefines.NDiplomacy.PEACE_COST_RETURN_CORE = 0.5				-- Return a core (scales by province wealth)
NDefines.NDiplomacy.PEACE_COST_REVOKE_CORE = 0.25						-- Revoke a core (scales by province wealth)
NDefines.NDiplomacy.PEACE_COST_RELEASE_ANNEXED = 0.5				-- Release annexed nation (scales by province wealth)
NDefines.NDiplomacy.PEACE_COST_RELEASE_VASSAL = 0.25


NDefines.NDiplomacy.AE_OTHER_CONTINENT = 10
NDefines.NDiplomacy.AE_SAME_CULTURE = 0.5
NDefines.NDiplomacy.AE_SAME_CULTURE_GROUP = 0.25
NDefines.NDiplomacy.AE_INFIDEL_CONQUEST = 0.25		-- different religion group conquered same religion province
NDefines.NDiplomacy.AE_SAME_RELIGION = 0.5
NDefines.NDiplomacy.AE_SAME_RELIGION_GROUP = 0.0
NDefines.NDiplomacy.AE_DIFFERENT_RELIGION = -0.5
NDefines.NDiplomacy.AE_HRE_INTERNAL = 0.5
NDefines.NDiplomacy.AE_ATTACKER_DEVELOPMENT = 0.01	-- +50% cap (at 1000 development)
NDefines.NDiplomacy.AE_DEFENDER_DEVELOPMENT = 0.01	-- -50% cap (at 1000 development)
NDefines.NDiplomacy.AE_DISTANCE_BASE = 0.75
NDefines.NDiplomacy.AE_SAME_OVERLORD = 0.5	
NDefines.NDiplomacy.AE_PROVINCE_CAP = 30				-- Province development above this will not count for AE (also used for warscore cost cap)
NDefines.NDiplomacy.AE_THREATEN_WAR = 1.0

NDefines.NDiplomacy.PO_DEMAND_PROVINCES_AE = 0.66		-- _DDEF_PO_DEMAND_PROVINCES_AE = 10, (Per development)
NDefines.NDiplomacy.PO_RETURN_CORES_AE = 0.33			-- (Per core, only applied if returning cores to vassals of winner)
NDefines.NDiplomacy.PO_FORM_PU_AE = 0.1 							-- _DDEF_PO_FORM_PU_AE = 10, (Per development)
NDefines.NDiplomacy.PO_CONCEDE_COLONIAL_AE = 0.1
NDefines.NDiplomacy.PO_BECOME_VASSAL_AE = 0.5 					-- _DDEF_PO_BECOME_VASSAL_AE = 10, (Per development)
NDefines.NDiplomacy.PO_TRANSFER_VASSAL_AE = 0.3

NDefines.NDiplomacy.IMPERIAL_CITY_IA = 0.003
NDefines.NDiplomacy.HRE_FOREIGN_CONTROL_PENALTY = -0.003
NDefines.NDiplomacy.HRE_PRINCE_AUTHORITY_THRESHOLD = 35
NDefines.NDiplomacy.IMPERIAL_AUTHORITY_FROM_PRINCES = 0.075

NDefines.NCountry.MERCHANT_REPUBLIC_SIZE_LIMIT = 40
NDefines.NMilitary.FORT_PER_DEV_RATIO = 30

NDefines.NEconomy.GOLD_MINE_SIZE = 40						-- Base income from gold mines
NDefines.NEconomy.GOLD_MINE_DEPLETION_THRESHOLD = 5				-- Gold mines above production level or above can be depleted
NDefines.NEconomy.GOLD_MINE_DEPLETION_CHANCE = 0.5					-- Chance of gold mine being depleted (yearly, per production above threshold) 
NDefines.NEconomy.GOLD_MINE_SIZE_PRIMITIVES = 4

	
NDefines.NCountry.CORE_COLONY = 0.25								-- Multiplied with development, colonized by country or overseas
NDefines.NCountry.CORE_OVERSEAS = 0.5						-- Multiplied with development, colonized by country or overseas
NDefines.NCountry.CORE_SAME_REGION = 0.25						-- Multiplied with development, for colonial nations 
NDefines.NCountry.CORE_SAME_CONTINENT = 0.75						-- Multiplied with development, for colonial nations
NDefines.NCountry.CORE_HAD_CLAIM = 0.15						-- Impacts MODIFIER_CORE_CREATION
NDefines.NCountry.CORE_HAD_PERMANENT_CLAIM = 0.3