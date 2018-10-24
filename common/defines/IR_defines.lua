 -- Note Im intergrating many to most of the features from my former Misc Addon while Im at it because all these changes for dev doubling break compatibility with the addon anyway

 -- no NGame changes
NDefines.NGame.END_DATE = "1836.1.2"
NDefines.NGame.MAX_COLONIAL_NATIONS = 500
  --NDiplomacy changes   note subsection for treaties
NDefines.NDiplomacy.FAVORS_LAND_DIVIDER = 4			-- from 2      note inversed value
NDefines.NDiplomacy.VASSALIZE_BASE_DEVELOPMENT_CAP = 500			-- from 100, doubled after dev doubling, because this is annoying.
NDefines.NDiplomacy.MARCH_BASE_DEVELOPMENT_CAP = 500			-- from 200
NDefines.NDiplomacy.AE_ATTACKER_DEVELOPMENT = 0.005			-- from 0p01
NDefines.NDiplomacy.AE_DEFENDER_DEVELOPMENT = 0.005			-- from 0p01
NDefines.NDiplomacy.AE_PROVINCE_CAP = 50			-- from 30
 -- Peace AE
NDefines.NDiplomacy.PO_DEMAND_PROVINCES_AE = 0.4			-- from 0p75
NDefines.NDiplomacy.PO_RETURN_CORES_AE = 0.25			-- from 0p5
NDefines.NDiplomacy.PO_FORM_PU_AE = 0.05			-- from 0p1
NDefines.NDiplomacy.PO_CONCEDE_COLONIAL_AE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_BECOME_VASSAL_AE = 0.25			-- from 0p5
NDefines.NDiplomacy.PO_TRANSFER_VASSAL_AE = 0.1			-- from 0p33
 -- Peace Prestige
NDefines.NDiplomacy.PO_ANNEX_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_DEMAND_PROVINCES_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_REVOKE_CORES_PRESTIGE = 0.1			-- from 0p1
NDefines.NDiplomacy.PO_RETURN_CORES_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_RELEASE_VASSAL_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_TRANSFER_VASSAL_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_RELEASE_ANNEXED_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_CHANGE_RELIGION_PRESTIGE = 0.25			-- from 0p5
NDefines.NDiplomacy.PO_FORM_PU_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_BECOME_VASSAL_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_CONCEDE_COLONIAL_PRESTIGE = 1			-- from 2
NDefines.NDiplomacy.PO_GIVE_UP_CLAIM_PRESTIGE = 1			-- from 2
 -- Peace Costs
NDefines.NDiplomacy.PEACE_COST_DEMAND_PROVINCE = 0.5			-- from 1
NDefines.NDiplomacy.PEACE_COST_CONCEDE_PROVINCE = 0.5			-- from 1
NDefines.NDiplomacy.PEACE_COST_BECOME_VASSAL = 0.5			-- from 1
NDefines.NDiplomacy.PEACE_COST_RETURN_CORE = 0.5			-- from 1
NDefines.NDiplomacy.PEACE_COST_REVOKE_CORE = 0.25			-- from 0p5
NDefines.NDiplomacy.PEACE_COST_RELEASE_ANNEXED = 0.5			-- from 1
NDefines.NDiplomacy.PEACE_COST_RELEASE_VASSAL = 0.25			-- from 0p5
NDefines.NDiplomacy.PEACE_COST_CONVERSION = 0.5			-- from 1
NDefines.NDiplomacy.PEACE_COST_RELEASE = 1			-- from 2
 --End of Peace Costs
NDefines.NDiplomacy.ANNEX_DIP_COST_PER_DEVELOPMENT = 4			-- from 8
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_STATE_WITH_PROSPERITY = 0.03			-- from 0p06
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_DEVASTATION = -2.5			-- from -5p0
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_TRIBUTARY_DEV = 0.075			-- from 0p15
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_NONTRIBUTARY_DEV = -0.15			-- from -0p3
NDefines.NDiplomacy.TRIBUTE_BASE_ADM = 0.015			-- from 0p03
NDefines.NDiplomacy.TRIBUTE_BASE_DIP = 0.015			-- from 0p03
NDefines.NDiplomacy.TRIBUTE_BASE_MIL = 0.015			-- from 0p03
 --Spy changes
NDefines.NDiplomacy.VASSALIZE_BASE_DEVELOPMENT_CAP = 200 			
NDefines.NDiplomacy.MARCH_BASE_DEVELOPMENT_CAP = 300 				
NDefines.NDiplomacy.MAX_FREE_CITIES = 16
NDefines.NDiplomacy.FABRICATE_CLAIM_COST = 30
NDefines.NDiplomacy.FABRICATE_CLAIM_COST_MODIFIER_PER_CLAIM = 0.5
NDefines.NDiplomacy.JUSTIFY_TRADE_CONFLICT_COST = 10
NDefines.NDiplomacy.INFILTRATE_ADMINISTRATION_COST = 70
NDefines.NDiplomacy.SABOTAGE_REPUTATION_COST = 90
NDefines.NDiplomacy.STEAL_MAPS_COST = 50
NDefines.NDiplomacy.SUPPORT_REBELS_COST = 60
NDefines.NDiplomacy.SOW_DISCONTENT_COST = 80
NDefines.NDiplomacy.AGITATE_FOR_LIBERTY_COST = 90
NDefines.NDiplomacy.SABOTAGE_RECRUITMENT_COST = 80
NDefines.NDiplomacy.SLANDER_MERCHANTS_COST = 90
 --HRE changes
NDefines.NDiplomacy.IMPERIAL_CITY_IA = 0.003
NDefines.NDiplomacy.HRE_FOREIGN_CONTROL_PENALTY = -0.003
NDefines.NDiplomacy.HRE_PRINCE_AUTHORITY_THRESHOLD = 42
NDefines.NDiplomacy.IMPERIAL_AUTHORITY_FROM_PRINCES = 0.05
NDefines.NDiplomacy.NUM_OF_GREAT_POWERS = 12
 
 --NCountry changes
NDefines.NCountry.EXPLOIT_ADM_INCOME = 30			-- from 60
NDefines.NCountry.EXPLOIT_DIP_SAILORS = 3			-- from 6
NDefines.NCountry.EXPLOIT_MIL_MANPOWER = 3			-- from 6
NDefines.NCountry.EXPLOIT_COOLDOWN_MONTHS = 120			-- from 240
NDefines.NCountry.INSTITUTION_BONUS_FROM_IMP_DEVELOPMENT = 2.5			-- from 5
NDefines.NCountry.INSTITUTION_CAP_IMP_DEVELOPMENT = 20			-- from 10
NDefines.NCountry.INSTITUTION_BASE_IMP_DEVELOPMENT = 60			-- from 30
NDefines.NCountry.EMBRACE_INSTITUTION_COST = 1.25			-- from 2p5
NDefines.NCountry.CORRUPTION_COST = 0.025			-- from 0p05
NDefines.NCountry.STATE_MAINTENANCE_DEV_FACTOR = 0.003			-- from 0p007
NDefines.NCountry.NOMAD_DEVELOPMENT_SCALE = 1200			-- from 600     I dont actually know how this works     Might have it reversed better check later
NDefines.NCountry.CULTURAL_UNION_MIN_DEV = 2000			-- from 1000
NDefines.NCountry.MIN_DEV_FOR_FREE_CITY = 20			-- from 10
NDefines.NCountry.MIN_DEVELOPMENT_FOR_GOV_RANK_2 = 500			-- from 300
NDefines.NCountry.MIN_DEVELOPMENT_FOR_GOV_RANK_3 = 2000			-- from 1000
NDefines.NCountry.ADDITIONAL_MIN_DEVELOPMENT_FOR_GOV_RANK_X = 3000			-- from 500     Probably unused but just throwing in here as a reminder in case I decide to do some wacky stuff later
NDefines.NCountry.RANDOM_LUCKY_DEVELOPMENT_WEIGHT = 0.2			-- from 0p4
NDefines.NCountry.MIN_DEV_FOR_OLD_GREAT_POWER = 300			-- from 100
NDefines.NCountry.CULTURE_MIN_DEVELOPMENT_TO_PROMOTE = 50			-- from 20
NDefines.NCountry.PS_MAKE_PROVINCE_CORE = 5			-- from 10
NDefines.NCountry.PS_MOVE_CAPITAL_EXTRA = 100			-- from 50
NDefines.NCountry.PS_CHANGE_CULTURE = 5			-- from 10
NDefines.NCountry.PS_IMPROVE_PROVINCE_BASE = 25			-- from 50
NDefines.NCountry.PS_IMPROVE_PROVINCE_CAPITAL_DISCOUNT = 0.025			-- from 0p05
NDefines.NCountry.MONTHS_TO_CHANGE_CULTURE = 5			-- from 10
NDefines.NCountry.REVOLT_SIZE_DEVELOPMENT_MULTIPLIER = 0.15			-- from 0p3
NDefines.NCountry.RAZE_PROVINCE_POWER_PER_DEVELOPMENT = 10			-- from 25p0
NDefines.NCountry.HORDE_UNITY_PER_RAZE = 0.25			-- from 0p5
NDefines.NCountry.SETTLEMENT_GROWTH_DEVELOPMENT_INCREASE = 2			-- from 1
NDefines.NCountry.SETTLMENT_GROWTH_CHANCE_MULTIPLIER = 5.0			-- from 2p5
NDefines.NCountry.SETTLMENT_GROWTH_CHANCE_MIN = 0.02			-- from 0p05
NDefines.NCountry.CORRUPTION_FROM_BANNERS = 1
NDefines.NCountry.MAX_CROWN_COLONIES = 2	
NDefines.NCountry.SIBERIAN_FRONTIER_DAILY_BASE = 5		-- monthly..
NDefines.NCountry.SIBERIAN_FRONTIER_DAILY_RANGE = 11
NDefines.NCountry.PS_ESTABLISH_SIBERIAN_FRONTIER = 40
NDefines.NCountry.PS_BUY_NATIVE_ADVANCEMENT = 400
NDefines.NCountry.MERCHANT_REPUBLIC_SIZE_LIMIT = 40
NDefines.NCountry.CORE_COLONY = 0.25								-- Multiplied with development, colonized by country or overseas
NDefines.NCountry.CORE_OVERSEAS = 0.5						-- Multiplied with development, colonized by country or overseas
NDefines.NCountry.CORE_SAME_REGION = 0.25						-- Multiplied with development, for colonial nations 
NDefines.NCountry.CORE_SAME_CONTINENT = 0.75						-- Multiplied with development, for colonial nations
NDefines.NCountry.CORE_HAD_CLAIM = 0.15						-- Impacts MODIFIER_CORE_CREATION
NDefines.NCountry.CORE_HAD_PERMANENT_CLAIM = 0.3

-- Balance of Power defines changes
NDefines.NCountry.IDEA_TO_TECH = -0.005 --Vanilla -0.02
NDefines.NCountry.TECH_TIME_COST = 0.5 --Vanilla 0.3
NDefines.NCountry.NEIGHBOURBONUS_CAP = -0.3 --Vanilla -0.75

NDefines.NDiplomacy.REVANCHISM_MONTHLY_DECAY = 0.5 --16 yrs 8mths, Vanilla 0.833 (10 yrs)
NDefines.NDiplomacy.SPY_NETWORK_SIEGE_EFFECT = 0.4 --vanilla 0.2
NDefines.NDiplomacy.SPY_NETWORK_AE_EFFECT = -0.2 --vanilla -0.1

 --NEconomy
NDefines.NEconomy.GOLD_MINE_SIZE = 40						-- Base income from gold mines
NDefines.NEconomy.GOLD_MINE_DEPLETION_THRESHOLD = 5				-- Gold mines above production level or above can be depleted
NDefines.NEconomy.GOLD_MINE_DEPLETION_CHANCE = 0.5					-- Chance of gold mine being depleted (yearly, per production above threshold) 
NDefines.NEconomy.GOLD_MINE_SIZE_PRIMITIVES = 20
NDefines.NEconomy.CARAVAN_FACTOR = 10.0			-- from 3p0     Development is divided by this factor, do not set to zero!
NDefines.NEconomy.LARGE_COLONIAL_NATION_LIMIT = 10
NDefines.NEconomy.PIRATES_MONOPOLY_BONUS = -0.25


 --NMilitary changes
NDefines.NMilitary.DEVASTATION_DEVELOPMENT_SCALE = 2.5			-- from 5     I dont actually know how this works     Might have it reversed better check later
NDefines.NMilitary.PARTICIPATION_SCORE_BLOCKADE = 0.0005			-- from 0p001
NDefines.NMilitary.FORT_PER_DEV_RATIO = 100			-- from 50
NDefines.NMilitary.BASE_MP_TO_MANPOWER = 0.125			-- from 0p25

NDefines.NMilitary.BLOCKADE_FACTOR = 6			-- from 3     (Total sail speed / blockade_factor) * blockade_efficiency / province development
NDefines.NMilitary.JANISSARIES_HEATHEN_DEVELOPMENT_DIVISOR = 20			-- from 10
NDefines.NMilitary.FORTRESS_COST = 0.25
NDefines.NMilitary.FORT_PER_DEV_RATIO = 30
NDefines.NMilitary.INFANTRY_SPEED = 0.6					-- _MDEF_INFANTRY_SPEED = 10,
NDefines.NMilitary.CAVALRY_SPEED = 0.8							-- _MDEF_CAVALRY_SPEED = 10,
NDefines.NMilitary.ARTILLERY_SPEED = 0.4				-- 
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


 --NAI changes
NDefines.NAI.DEVELOPMENT_CAP_BASE = 20			-- from 10
NDefines.NAI.PEACE_TERMS_RELEASE_ANNEXED_SIZE_MULT = 0.005			-- from 0p01

NDefines.NAI.DIPLOMATIC_ACTION_VASSALIZE_DEVELOPMENT_FACTOR = 10			-- from 20
NDefines.NAI.DIPLOMATIC_ACTION_ANNEX_DEVELOPMENT_FACTOR = 25			-- from 50
NDefines.NAI.DIPLOMATIC_ACTION_INTEGRATE_DEVELOPMENT_FACTOR = 25			-- from 50
NDefines.NAI.DIPLOMATIC_ACTION_CRUSADE_DEVELOPMENT_FACTOR = 0.5			-- from 1
NDefines.NAI.DIPLOMATIC_ACTION_CLAIM_THRONE_DEVELOPMENT_FACTOR = 0.5			-- from 1
NDefines.NAI.DIPLOMATIC_ACTION_AGITATE_FOR_LIBERTY_DEVELOPMENT_FACTOR = 0.15			-- from 0p25
NDefines.NAI.DIPLOMATIC_ACTION_SUPPORT_HEIR_DEVELOPMENT_FACTOR = 1			-- from 2
NDefines.NAI.DIPLOMATIC_ACTION_TRIBUTARY_ACCEPTANCE_PER_DEVELOPMENT = -0.25			-- from -0p5
NDefines.NAI.CHARTER_COMPANY_DEVELOPMENT_RELUCTANCE = 1			-- from 3

 --Condottieri
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_BASE_MULT = 33 -- AI scoring for offer condottieri, base scale.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_MONTHLY_PARTICIPATION_RATE = -0.3 --Base monthly decay in participation. Related to multipliers for war participation (but doesn't depend on number of regiments, so raw multiplier matters).
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_BREAK = -2.4 --At this level of (lack of) participation from the player, the AI will break the condottieri agreement and tell all their friends.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_WARN = -1.2 --At this level of (lack of) participation from the player, a warning alert will be displayed about impendent AI discontent.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_HIRING_MALUS_YEARS = 25 --Once AI has told all their friends about how mean a player is, they will refuse to hire condottieri for cash this long.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_FROM_CASUALTIES = 0.5 --Scaler for casulties caused by condottieri.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_ONLY_MILITARY_RULERS = 1 --If set to 1, AI will only send Condottieri while having a miliaristic ruler.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_ONLY_NEIGHBORS = 1 --If set to 1, AI will only send Condottieri to neighbors, regardless of access.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_DISABLE_VERSUS_PLAYER_ENEMIES = 0 --If set to 1, AI will try avoid sending Condottieri having to fight against human player enemies.
 -- Amyz tweaks
NDefines.NAI.PEACE_INCONCLUSIVE_THRESHOLD = 20
NDefines.NAI.PEACE_TERMS_VASSAL_BASE_MULT = 10.0 -- only applied if the AI has vassalize priority

	

 --NGraphics changes
NDefines.NGraphics.CITY_SPRAWL_AMOUNT = 1.0			-- from 3p0
 
 --NReligion changes
NDefines.NReligion.CONSECRATE_PATRIARCH_THRESHOLD = 60			-- from 30
NDefines.NReligion.DOOM_REDUCTION_FROM_OCCUPATION = 0.025			-- from 0p05
NDefines.NReligion.AUTHORITY_FROM_DEVELOPMENT = 0.01			-- from 0p02
NDefines.NReligion.MINIMUM_DEVELOPMENT_ALLOWED = 20			-- from 10
NDefines.NReligion.COUNTRY_DEVELOPMENT_DIVIDER = 400			-- from 200
NDefines.NReligion.HARMONY_LOSS_PER_DEV_CONVERTED = 0.5			-- from 1

 --NNationDesigner changes
NDefines.NNationDesigner.BASE_TAX_COST_MODIFIER = 0.25			-- from 0p5
NDefines.NNationDesigner.PRODUCTION_COST_MODIFIER = 0.25			-- from 0p5
NDefines.NNationDesigner.MANPOWER_COST_MODIFIER = 0.25			-- from 0p5
