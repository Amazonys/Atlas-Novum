NDefines.NGame.END_DATE = "1836.1.2"
NDefines.NGame.MAX_COLONIAL_NATIONS = 500
NDefines.NDiplomacy.VASSALIZE_BASE_DEVELOPMENT_CAP = 200 			
NDefines.NDiplomacy.MARCH_BASE_DEVELOPMENT_CAP = 300 				
NDefines.NDiplomacy.MAX_FREE_CITIES = 16
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
NDefines.NDiplomacy.PO_FORM_PU_AE = 0.1							-- _DDEF_PO_FORM_PU_AE = 10, (Per development)
NDefines.NDiplomacy.PO_CONCEDE_COLONIAL_AE = 0.1
NDefines.NDiplomacy.PO_BECOME_VASSAL_AE = 0.5					-- _DDEF_PO_BECOME_VASSAL_AE = 10, (Per development)
NDefines.NDiplomacy.PO_TRANSFER_VASSAL_AE = 0.5

NDefines.NDiplomacy.IMPERIAL_CITY_IA = 0.003
NDefines.NDiplomacy.HRE_FOREIGN_CONTROL_PENALTY = -0.003
NDefines.NDiplomacy.HRE_PRINCE_AUTHORITY_THRESHOLD = 35
NDefines.NDiplomacy.IMPERIAL_AUTHORITY_FROM_PRINCES = 0.075

NDefines.NCountry.MERCHANT_REPUBLIC_SIZE_LIMIT = 40
NDefines.NMilitary.FORT_PER_DEV_RATIO = 30
NDefines.NMilitary.INFANTRY_SPEED = 0.6					-- _MDEF_INFANTRY_SPEED = 10,
NDefines.NMilitary.CAVALRY_SPEED = 0.9							-- _MDEF_CAVALRY_SPEED = 10,
NDefines.NMilitary.ARTILLERY_SPEED = 0.3				-- 
NDefines.NMilitary.LOOT_DEVASTATION_IMPACT = 25						-- how much devastation full loot impacts
NDefines.NMilitary.SCORCHED_DEVASTATION_IMPACT = 50
NDefines.NMilitary.SCORCHED_DURATION = 36				-- months
NDefines.NMilitary.LOOTED_DAYS = 730								-- Time the "Looted" static modifier lasts.
NDefines.NMilitary.LOOTED_SCALE = 2								-- Scaling value from province development to number of ducats it contains.									-- Maximum amount of ducats (total) a province can be looted for each month.
NDefines.NMilitary.LOOTED_RECOVERY = 0.2
NDefines.NMilitary.RIVER_CROSSING_PENALTY = -1						-- Dice roll penalty from river crossing
NDefines.NMilitary.STRAIT_CROSSING_PENALTY = -1					-- Dice roll penalty from strait crossing
NDefines.NMilitary.SEA_LANDING_PENALTY = -1
NDefines.NMilitary.SLAVE_RAIDS_SAILOR_FACTOR = 0.2						-- 
NDefines.NMilitary.SLAVE_RAIDS_DURATION = 730

NDefines.NMilitary.MAX_REBEL_SUPPRESSION = 10.0				-- Maximum amount of rebel suppression by troops in a province
NDefines.NMilitary.INF_SUPPRESSION = 0.5					-- The amount of reduction to unrest for each friendly infantry regiment in a province
NDefines.NMilitary.CAV_SUPPRESSION = 0.75						-- The amount of reduction to unrest for each friendly cavalry regiment in a province
NDefines.NMilitary.ART_SUPPRESSION = 0.25					-- The amount of reduction to unrest for each friendly artillery regiment in a province
NDefines.NMilitary.ARMY_DRILL_YEARLY_DECAY = -0.05


NDefines.NEconomy.GOLD_MINE_SIZE = 40						-- Base income from gold mines
NDefines.NEconomy.GOLD_MINE_DEPLETION_THRESHOLD = 5				-- Gold mines above production level or above can be depleted
NDefines.NEconomy.GOLD_MINE_DEPLETION_CHANCE = 0.5					-- Chance of gold mine being depleted (yearly, per production above threshold) 
NDefines.NEconomy.GOLD_MINE_SIZE_PRIMITIVES = 4

NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_BASE_MULT = 33 -- AI scoring for offer condottieri, base scale.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_MONTHLY_PARTICIPATION_RATE = -0.3 --Base monthly decay in participation. Related to multipliers for war participation (but doesn't depend on number of regiments, so raw multiplier matters).
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_BREAK = -2.4 --At this level of (lack of) participation from the player, the AI will break the condottieri agreement and tell all their friends.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_WARN = -1.2 --At this level of (lack of) participation from the player, a warning alert will be displayed about impendent AI discontent.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_HIRING_MALUS_YEARS = 25 --Once AI has told all their friends about how mean a player is, they will refuse to hire condottieri for cash this long.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_FROM_CASUALTIES = 0.5 --Scaler for casulties caused by condottieri.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_ONLY_MILITARY_RULERS = 1 --If set to 1, AI will only send Condottieri while having a miliaristic ruler.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_ONLY_NEIGHBORS = 1 --If set to 1, AI will only send Condottieri to neighbors, regardless of access.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_DISABLE_VERSUS_PLAYER_ENEMIES = 0 --If set to 1, AI will try avoid sending Condottieri having to fight against human player enemies.
NDefines.NAI.PEACE_INCONCLUSIVE_THRESHOLD = 20
NDefines.NAI.PEACE_TERMS_VASSAL_BASE_MULT = 2000.0 -- only applied if the AI has vassalize priority

	
NDefines.NCountry.CORE_COLONY = 0.25								-- Multiplied with development, colonized by country or overseas
NDefines.NCountry.CORE_OVERSEAS = 0.5						-- Multiplied with development, colonized by country or overseas
NDefines.NCountry.CORE_SAME_REGION = 0.25						-- Multiplied with development, for colonial nations 
NDefines.NCountry.CORE_SAME_CONTINENT = 0.75						-- Multiplied with development, for colonial nations
NDefines.NCountry.CORE_HAD_CLAIM = 0.15						-- Impacts MODIFIER_CORE_CREATION
NDefines.NCountry.CORE_HAD_PERMANENT_CLAIM = 0.3