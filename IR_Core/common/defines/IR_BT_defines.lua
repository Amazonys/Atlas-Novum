 -- IR + BT defines
 -- DO NOT CHANGE OR REPLACE WITHOUT PERMISSION PLEASE
  -- NGame changes
-- NDefines.NGame.START_DATE = "1291.5.18" --from 1444.11.11 - per Draiocht's 1291
NDefines.NGame.END_DATE = "1900.1.2" --from 1821.1.2
NDefines.NGame.MAX_COLONIAL_NATIONS = 100 -- apparently pdx limited to 100 anyways - dumb af WHY IMPLEMENT A DEFINE IF IT NO USEFUL!?
NDefines.NGame.MAX_CLIENT_STATES = 50		-- Max is 100 -- TODO: Lower this to 75 after 1.18 (used to start at K75 for some reason)
NDefines.NGame.MAX_ESTATE_COUNTRIES = 50			 -- 50				-- Max is 100
NDefines.NGame.MAX_TRADING_CITIES = 10 -- 75	-- Max is 100
NDefines.NGame.MAX_CUSTOM_COUNTRIES = 50 -- 75				-- Max is 100

  --NDiplomacy 
NDefines.NDiplomacy.FAVORS_LAND_DIVIDER = 4			-- from 2      note inversed value
NDefines.NDiplomacy.VASSALIZE_BASE_DEVELOPMENT_CAP = 1000			-- from 100, doubled after dev doubling, because this is annoying.
NDefines.NDiplomacy.INTEGRATE_VASSAL_MIN_YEARS = 25 -- from 10
NDefines.NDiplomacy.MARCH_BASE_DEVELOPMENT_CAP = 500			-- from 200
NDefines.NDiplomacy.MARCH_DEVELOPMENT_FRACTION = 0.25
NDefines.NDiplomacy.AE_ATTACKER_DEVELOPMENT = 0.01			-- from 0p01
NDefines.NDiplomacy.AE_DEFENDER_DEVELOPMENT = 0.01			-- from 0p01
NDefines.NDiplomacy.AE_PROVINCE_CAP = 50			-- from 30
NDefines.NDiplomacy.AE_OTHER_CONTINENT = 5 -- from 10
NDefines.NDiplomacy.AE_SAME_CULTURE = 0.5
NDefines.NDiplomacy.AE_SAME_CULTURE_GROUP = 0.75
NDefines.NDiplomacy.AE_INFIDEL_CONQUEST = -0.25		-- different religion group conquered same religion province
NDefines.NDiplomacy.AE_SAME_RELIGION = 0.25
NDefines.NDiplomacy.AE_SAME_RELIGION_GROUP = 0.1
NDefines.NDiplomacy.AE_DIFFERENT_RELIGION = -0.5
NDefines.NDiplomacy.AE_HRE_INTERNAL = 1
NDefines.NDiplomacy.AE_DISTANCE_BASE = 1.5
NDefines.NDiplomacy.AE_SAME_OVERLORD = 0.5	
 -- Peace AE
NDefines.NDiplomacy.PO_DEMAND_PROVINCES_AE = 0.5			-- from 0p75
NDefines.NDiplomacy.PO_RETURN_CORES_AE = 0.25			-- from 0p5
NDefines.NDiplomacy.PO_FORM_PU_AE = 0.05		-- from 0p1
NDefines.NDiplomacy.PO_CONCEDE_COLONIAL_AE = 0.5			-- from 0p25
NDefines.NDiplomacy.PO_BECOME_VASSAL_AE = 0.25			-- from 0p5
NDefines.NDiplomacy.PO_TRANSFER_VASSAL_AE = 0.25		-- from 0p33
 -- Peace Prestige
NDefines.NDiplomacy.PO_ANNEX_PRESTIGE = 0.15			-- from 0p25
NDefines.NDiplomacy.PO_DEMAND_PROVINCES_PRESTIGE = 0.2			-- from 0p25   Some peace cost changes moved from Misc Addon to Main BT where they overlap   Directly demanding provinces should be slightly rarer and harder now so offsetting larger penalties minorly with prestige
NDefines.NDiplomacy.PO_REVOKE_CORES_PRESTIGE = 0.1			-- from 0p1
NDefines.NDiplomacy.PO_RETURN_CORES_PRESTIGE = 0.1			-- from 0p25   Some peace cost changes moved from Misc Addon to Main BT where they overlap   Now cheaper so lowering bonuses to prevent exploiting or overtweaking
NDefines.NDiplomacy.PO_RELEASE_VASSAL_PRESTIGE = 0.1			-- from 0p25   Some peace cost changes moved from Misc Addon to Main BT where they overlap   Now cheaper so lowering bonuses to prevent exploiting or overtweaking
NDefines.NDiplomacy.PO_TRANSFER_VASSAL_PRESTIGE = 0.1			-- from 0p25   Some peace cost changes moved from Misc Addon to Main BT where they overlap   Now cheaper so lowering bonuses to prevent exploiting or overtweaking
NDefines.NDiplomacy.PO_RELEASE_ANNEXED_PRESTIGE = 0.1			-- from 0p25   Some peace cost changes moved from Misc Addon to Main BT where they overlap   Now cheaper so lowering bonuses to prevent exploiting or overtweaking
NDefines.NDiplomacy.PO_CHANGE_RELIGION_PRESTIGE = 0.2			-- from 0p5   Some peace cost changes moved from Misc Addon to Main BT where they overlap   Now cheaper so lowering bonuses to prevent exploiting or overtweaking
NDefines.NDiplomacy.PO_FORM_PU_PRESTIGE = 0.1			-- from 0p25
NDefines.NDiplomacy.PO_BECOME_VASSAL_PRESTIGE = 0.1			-- from 0p25   Some peace cost changes moved from Misc Addon to Main BT where they overlap   Now cheaper so lowering bonuses to prevent exploiting or overtweaking
NDefines.NDiplomacy.PO_CONCEDE_COLONIAL_PRESTIGE = 1			-- from 2
NDefines.NDiplomacy.PO_GIVE_UP_CLAIM_PRESTIGE = 1			-- from 2
NDefines.NDiplomacy.PO_WAR_REPARATIONS_PRESTIGE = 1			-- from 2
 -- Peace Costs
NDefines.NDiplomacy.PEACE_COST_DEMAND_PROVINCE = 0.75			-- from 1
NDefines.NDiplomacy.PEACE_COST_CONCEDE_PROVINCE = 0.5			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   More provinces and dev in colonial regions was making this too expensive   Also noticed that occasionally choosing provinces individually was less warscore why I dont know but we dont want that
NDefines.NDiplomacy.PEACE_COST_BECOME_VASSAL = 0.5			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   This might be a personal thing but completely taking land shouldnt be the same price or cheaper than enforcing vassalage   vassal relations historically happened somewhat often even between larger nations
NDefines.NDiplomacy.PEACE_COST_RETURN_CORE = 0.5			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   returning a core to a rightful owner should be a less dramatic negotiating factor than taking a completely new province
NDefines.NDiplomacy.PEACE_COST_REVOKE_CORE = 0.25			-- from 0p5
NDefines.NDiplomacy.PEACE_COST_RELEASE_ANNEXED = 0.5			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   releasing an annexed vassal shouldnt be as dramatic as demanding a completely new province   Also encourages breaking up of blobs which can only be a good thing
NDefines.NDiplomacy.PEACE_COST_RELEASE_VASSAL = 0.6		-- from 0p5
NDefines.NDiplomacy.PEACE_COST_CONVERSION = 0.1		-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   I know people love their beliefs and resist religious change but the absurdly high price of this made it only possible against very small tags where it was usually preferable to just annex   Now this might be useful
NDefines.NDiplomacy.PEACE_COST_RELEASE = 1			-- from 2
NDefines.NDiplomacy.ANNEX_DIP_COST_PER_DEVELOPMENT = 4 -- from 8

NDefines.NDiplomacy.PEACE_COST_DEMAND_NON_OCCUPIED_PROVINCE_MULT = 1.5
NDefines.NDiplomacy.PEACE_COST_DEMAND_CAPITAL_MULT = 2
 --End of Peace Costs

 --Empire of China
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_STATE_WITH_PROSPERITY = 0.03			-- from 0p06
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_DEVASTATION = -2.5			-- from -5p0
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_TRIBUTARY_DEV = 0.075			-- from 0p15
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_NONTRIBUTARY_DEV = -0.15			-- from -0p3
NDefines.NDiplomacy.TRIBUTE_BASE_ADM = 0.03			-- from 0p03
NDefines.NDiplomacy.TRIBUTE_BASE_DIP = 0.03			-- from 0p03
NDefines.NDiplomacy.TRIBUTE_BASE_MIL = 0.03			-- from 0p03
 --Claims and Espionage
NDefines.NDiplomacy.FABRICATE_CLAIM_COST = 25
NDefines.NDiplomacy.FABRICATE_CLAIM_COST_MODIFIER_PER_CLAIM = 0.2
NDefines.NDiplomacy.JUSTIFY_TRADE_CONFLICT_COST = 10
NDefines.NDiplomacy.INFILTRATE_ADMINISTRATION_COST = 60
NDefines.NDiplomacy.SABOTAGE_REPUTATION_COST = 90
NDefines.NDiplomacy.STEAL_MAPS_COST = 50
NDefines.NDiplomacy.SUPPORT_REBELS_COST = 60
NDefines.NDiplomacy.SOW_DISCONTENT_COST = 80
NDefines.NDiplomacy.AGITATE_FOR_LIBERTY_COST = 70
NDefines.NDiplomacy.SABOTAGE_RECRUITMENT_COST = 90
NDefines.NDiplomacy.SLANDER_MERCHANTS_COST = 90	
 --HRE
NDefines.NDiplomacy.MAX_FREE_CITIES = 20
NDefines.NDiplomacy.HRE_PRINCE_AUTHORITY_THRESHOLD = 50			-- from original BtP increased from 25
NDefines.NDiplomacy.IMPERIAL_AUTHORITY_FROM_PRINCES = 0.01		-- from 0.005
NDefines.NDiplomacy.IMPERIAL_CITY_IA = 0.01 -- from 0.001
NDefines.NDiplomacy.HRE_FOREIGN_CONTROL_PENALTY = -0.005 -- from -0.001
 -- Great powers
NDefines.NDiplomacy.NUM_OF_GREAT_POWERS = 12
  -- charter
NDefines.NDiplomacy.CHARTER_COMPANY_BASE_COST = 5000 -- from 1000
NDefines.NDiplomacy.CHARTER_COMPANY_MINIMUM_COST = 5000 -- from 100

 --NCountry changes
NDefines.NCountry.EXPLOIT_ADM_INCOME = 30			-- from 60
NDefines.NCountry.EXPLOIT_DIP_SAILORS = 3			-- from 6
NDefines.NCountry.EXPLOIT_MIL_MANPOWER = 3			-- from 6
NDefines.NCountry.EXPLOIT_COOLDOWN_MONTHS = 120			-- from 240
NDefines.NCountry.INSTITUTION_BONUS_FROM_IMP_DEVELOPMENT = 0			-- from 5
NDefines.NCountry.INSTITUTION_CAP_IMP_DEVELOPMENT = 0			-- from 10
NDefines.NCountry.INSTITUTION_BASE_IMP_DEVELOPMENT = 0			-- from 30
NDefines.NCountry.EMBRACE_INSTITUTION_COST = 1.5			-- from 2p5
NDefines.NCountry.CORRUPTION_COST = 0.02			-- from 0p05
NDefines.NCountry.STATE_MAINTENANCE_DEV_FACTOR = 0.005	-- from 0p007
NDefines.NCountry.STATE_MAINTENANCE_DISTANCE_FACTOR = 0.002	-- from 0p001
NDefines.NCountry.STATE_MAINTENANCE_CONTINENT_FACTOR = 0.3	-- from 0p25
NDefines.NCountry.STATE_MAINTENANCE_CULTURE_FACTOR = 0.15		-- from 0p25
NDefines.NCountry.CORRUPTION_FROM_BANNERS = 0.5
NDefines.NCountry.NOMAD_DEVELOPMENT_SCALE = 1200			-- from 600     I dont actually know how this works     Might have it reversed better check later
NDefines.NCountry.CULTURAL_UNION_MIN_DEV = 2000			-- from 1000
NDefines.NCountry.MIN_DEV_FOR_FREE_CITY = 20			-- from 10
NDefines.NCountry.RANDOM_LUCKY_DEVELOPMENT_WEIGHT = 0.2			-- from 0p4
NDefines.NCountry.MIN_DEV_FOR_OLD_GREAT_POWER = 300			-- from 100
NDefines.NCountry.CULTURE_MIN_DEVELOPMENT_TO_PROMOTE = 15 -- 40	    from 20
NDefines.NCountry.PS_MAKE_PROVINCE_CORE = 5			-- from 10
NDefines.NCountry.PS_MOVE_CAPITAL_EXTRA = 100			-- from 50
NDefines.NCountry.PS_CHANGE_CULTURE = 10			-- from 10
NDefines.NCountry.PS_IMPROVE_PROVINCE_BASE = 0			-- from 50 # ANSWER TO LIFE THE UNIVERSE AND EVERYTHING
NDefines.NCountry.PS_IMPROVE_PROVINCE_CAPITAL_DISCOUNT = 0			-- from 0p05
NDefines.NCountry.ESTATE_CROWNLAND_FROM_DEV = 0			-- was 0.2 --How much crownland you gain from developing a province.
NDefines.NCountry.OVEREXTENSION_FACTOR = 0.5			-- from 1p0
NDefines.NCountry.MONTHS_TO_CHANGE_CULTURE = 5			-- from 10
NDefines.NCountry.RAZE_PROVINCE_POWER_PER_DEVELOPMENT = 10			-- from 25p0
NDefines.NCountry.HORDE_UNITY_PER_RAZE = 0.25			-- from 0p5
NDefines.NCountry.MERCHANT_REPUBLIC_SIZE_LIMIT = 50
NDefines.NCountry.PS_BOOST_MILITARIZATION = 30			-- Same logic as above new provinces cause faster decline thus need lower cost ideally I can find a better solution later Base 50
NDefines.NCountry.REVOLT_SIZE_DEVELOPMENT_MULTIPLIER = 0.1	-- from 0.3
NDefines.NCountry.REVOLT_SIZE_BASE = 3	-- from 4
NDefines.NCountry.REVOLT_TECH_IMPACT = 0.03			-- % each tech increases size of rebels by this percent.
NDefines.NCountry.REVOLT_TECH_MORALE = 0.01
NDefines.NCountry.CROWN_LANDS_ALERT_THRESHOLD = 35
--PROSPERITY/DEV CHANGES
NDefines.NCountry.PROSPERITY_MONTHLY_DECLINE = -2.5				-- monthly tick - WAS -2, ASSUME THAT THIS IS THE DEVASTATION REDUCTION, LETS SET TO -1 FOR NOW, PENDING TESTING
NDefines.NCountry.PROSPERITY_INCREASE_SIZE= 0.5				-- if diceroll of d20< monarch stat, while possible ot increase - WAS 1, TURNED TO 0 CAUSE WHY SHOULD MONARCH INCREASE PROSP?? - PROBABLY SHOULD HANDLE THIS THROUGH EVENT/EDICT
 --Colonial
NDefines.NCountry.MAX_CROWN_COLONIES = 2
NDefines.NCountry.SIBERIAN_FRONTIER_DAILY_BASE = 5		-- monthly..
NDefines.NCountry.SIBERIAN_FRONTIER_DAILY_RANGE = 20
NDefines.NCountry.PS_ESTABLISH_SIBERIAN_FRONTIER = 40
NDefines.NCountry.PS_BUY_NATIVE_ADVANCEMENT = 400
 --discovery
NDefines.NCountry.PROVINCE_DISCOVERY_YEARS_TECHNOLOGY = 100        -- was 50 -- Years until discoveries spread within technology group
NDefines.NCountry.PROVINCE_DISCOVERY_YEARS_RELIGION = 9999       -- was 100 -- Years until discoveries spread with religion
 -- Core Costs
NDefines.NCountry.CORE_COLONY = 0.5								-- Multiplied with development, colonized by country or overseas
NDefines.NCountry.CORE_OVERSEAS = 0.5						-- Multiplied with development, colonized by country or overseas
--NDefines.NCountry.CORE_SAME_REGION = 0.9						-- Multiplied with development, for colonial nations 
--NDefines.NCountry.CORE_SAME_CONTINENT = 0.9					-- Multiplied with development, for colonial nations
NDefines.NCountry.CORE_HAD_CLAIM = 0.1						-- Impacts MODIFIER_CORE_CREATION
NDefines.NCountry.CORE_HAD_PERMANENT_CLAIM = 0.25
 -- states and territories
NDefines.NCountry.ALLOWED_TERRITORY_VS_MAX_STATES = 1.5			-- Same logic as above new provinces and areas require higher numbers 
NDefines.NCountry.TERRITORY_PENALTY_CAP = 60			-- Same logic as above new provinces and areas require higher numbers 
 -- abdicate and disinherit
NDefines.NCountry.ABDICATE_LEGITIMACY_THRESHOLD = 75 -- from 50
NDefines.NCountry.ABDICATE_AGE_THRESHOLD = 60 -- from 60 
NDefines.NCountry.ABDICATE_RULING_LENGTH_THRESHOLD = 25 -- from 20
NDefines.NCountry.ABDICATE_LEGITIMACY_HIT = -25 -- from -20
NDefines.NCountry.ABDICATE_PRESTIGE_HIT = -50 -- from -50
NDefines.NCountry.DISINHERIT_PRESTIGE_HIT = -50 -- from -50
NDefines.NCountry.DISINHERIT_PRESTIGE_THRESHOLD = 50 -- from 0
 -- ranks
NDefines.NCountry.CULTURAL_UNION_MIN_RANK = 5
NDefines.NCountry.HRE_RANK = 5 --Empire
NDefines.NCountry.HRE_MAX_RANK = 3 --Duchy
NDefines.NCountry.HRE_MAX_RANK_ELECTOR = 4 --king
NDefines.NCountry.SUBJECT_MAX_RANK = 4
NDefines.NCountry.PRESTIGE_GAIN_FOR_GOV_RANK_2 = 5
NDefines.NCountry.PRESTIGE_GAIN_FOR_GOV_RANK_3 = 10
NDefines.NCountry.MIN_PRESTIGE_FOR_GOV_RANK_2 = 10
NDefines.NCountry.MIN_PRESTIGE_FOR_GOV_RANK_3 = 25
-- NDefines.NCountry.MIN_PRESTIGE_FOR_GOV_RANK_4 = ?
NDefines.NCountry.MIN_DEVELOPMENT_FOR_GOV_RANK_2 = 75
NDefines.NCountry.MIN_DEVELOPMENT_FOR_GOV_RANK_3 = 300
NDefines.NCountry.MIN_DEVELOPMENT_FOR_GOV_RANK_4 = 800
NDefines.NCountry.MIN_DEVELOPMENT_FOR_GOV_RANK_5 = 2000
NDefines.NCountry.MIN_PRESTIGE_FOR_GOV_RANK_4 = 800
NDefines.NCountry.MIN_PRESTIGE_FOR_GOV_RANK_5 = 2000
NDefines.NCountry.MIN_PRESTIGE_FOR_GOV_RANK_X = 50
NDefines.NCountry.ADDITIONAL_MIN_DEVELOPMENT_FOR_GOV_RANK_X = 300
NDefines.NCountry.MAX_GOV_RANK = 5
NDefines.NCountry.NAT_FOCUS_YEARS_RANK = 3

 --SETTLEMENT
NDefines.NCountry.SETTLEMENT_GROWTH_DEVELOPMENT_INCREASE = 1 -- How much development may increase per year if a colonist is working on Settlement Growth.
NDefines.NCountry.SETTLMENT_GROWTH_CHANCE_MULTIPLIER = 1 -- Affects chance of development increase per year if a colonist is working on Settlement Growth.
NDefines.NCountry.SETTLMENT_GROWTH_CHANCE_MIN = 0.005 -- Minimum chance of increasing development for colonists promoting Settlement Growth
NDefines.NCountry.SETTLEMENT_GROWTH_CHECK_INTERVAL = 365 -- Interval in days between checks for random development increase when working in Settlement Growth.


 --NEconomy
NDefines.NEconomy.GOLD_MINE_SIZE = 40						-- Base income from gold mines
NDefines.NEconomy.GOLD_MINE_DEPLETION_THRESHOLD = 5				-- Gold mines above production level or above can be depleted
NDefines.NEconomy.GOLD_MINE_DEPLETION_CHANCE = 0.5					-- Chance of gold mine being depleted (yearly, per production above threshold) 
NDefines.NEconomy.GOLD_MINE_SIZE_PRIMITIVES = 20
NDefines.NEconomy.CARAVAN_FACTOR = 10.0			-- from 3p0     Development is divided by this factor, do not set to zero!
 --Monopoly bonus
NDefines.NEconomy.PIRATES_MONOPOLY_BONUS = -0.5
 --Necessary
--NDefines.NEconomy.ALLOW_DESTROY_MANUFACTORY = 1 -- was 0 needed to disable 
NDefines.NEconomy.TRADE_WIND_STRENGTH = 0.5						-- _EDEF_TRADE_WIND_STRENGTH_
NDefines.NEconomy.TRADED_FRACTION_FOR_BONUS = 0.1				-- _EDEF_TRADED_FRACTION_FOR_BONUS_

NDefines.NEconomy.MISSIONARY_MAINTENANCE_FACTOR = 0.0			-- How much a missionary costs in itself
NDefines.NEconomy.MISSIONARY_MAINTENANCE_DEVELOPMENT_FACTOR = 0.5	-- How much this is ncreased from development
NDefines.NEconomy.MISSIONARY_MAINTENANCE_AUTONOMY_FACTOR = 0.5	-- How much this is ncreased from local autonomy
NDefines.NEconomy.MISSIONARY_MAINTENANCE_AUTONOMY_BASE = 0.5			-- The local autonomy is added to this base in the formula.
 --Colonial nations44
 --NDefines.NEconomy.LARGE_COLONIAL_NATION_LIMIT = 10 -- hidden for now

 --NMilitary changes
NDefines.NMilitary.PARTICIPATION_SCORE_BLOCKADE = 0.0005			-- from 0p001
NDefines.NMilitary.FORT_PER_DEV_RATIO = 42			-- from 50
NDefines.NMilitary.BASE_MP_TO_MANPOWER = 0.1			-- from 0p25
NDefines.NMilitary.FORTRESS_COST = 0.1			-- Beyond Typus added so many new provinces which means more forts but no more dev so everyone was going broke Base 05
NDefines.NMilitary.BLOCKADE_FACTOR = 1.5			-- from 3     (Total sail speed / blockade_factor) * blockade_efficiency / province development
NDefines.NMilitary.JANISSARIES_HEATHEN_DEVELOPMENT_DIVISOR = 20			-- from 10
NDefines.NMilitary.GARRISON_SIZE = 1000							-- GARRISON_SIZE
NDefines.NMilitary.SIEGE_FORCE_NEEDED_MULTIPLIER = 2	
NDefines.NMilitary.MIN_MONTHLY_MANPOWER = 0.25
 -- Devastation
NDefines.NMilitary.DEVASTATION_DEVELOPMENT_SCALE = 100			-- from 5     I dont actually know how this works     Might have it reversed better check later
NDefines.NMilitary.FORT_DEVASTATION_IMPACT = -6
NDefines.NMilitary.REVANCHISM_DEVASTATION_IMPACT = -0.25		-- 100 revanschism is -20 a year.
NDefines.NMilitary.SURRENDER_DEVASTATION_IMPACT = -12
NDefines.NMilitary.CONTROL_DEVASTATION_IMPACT = -12
 --Unit Speeds
NDefines.NMilitary.INFANTRY_SPEED = 0.6					
NDefines.NMilitary.CAVALRY_SPEED = 0.8							
NDefines.NMilitary.ARTILLERY_SPEED = 0.4
 -- speeds
--NDefines.NMilitary.HOSTILE_TERRITORY_SPEED_MODIFIER = 0	-- speed modifier into hostile territory
--NDefines.NMilitary.SHATTERED_RETREAT_SPEED_MODIFIER = 0.5			-- How much (by percentage) the movement speed will be modified when doing a shattered retreat
NDefines.NMilitary.SEA_EXPLORE_SPEED = 10 --5						-- Can to some extent determine exploration speed of seas and coasts by specifying how long a ship pauses between exploration targets.
--NDefines.NMilitary.FORT_FLIPPING_TIME = 90 --30	
--NDefines.NMilitary.INF_LOOT = 0.1								-- How many ducats/month will a single full strength infantry regiment loot?
--NDefines.NMilitary.CAV_LOOT = 0.3								-- How many ducats/month will a single full strength cavalry regiment loot?
--NDefines.NMilitary.ART_LOOT = 0.05						-- How many ducats/month will a single full strength artillery regiment loot?	
 --Loot and Devastation and raiding
NDefines.NMilitary.LOOT_DEVASTATION_IMPACT = 25
NDefines.NMilitary.SCORCHED_DEVASTATION_IMPACT = 50
NDefines.NMilitary.SCORCHED_DURATION = 36				-- months
NDefines.NMilitary.LOOTED_DAYS = 730								-- Time the "Looted" static modifier lasts.
NDefines.NMilitary.LOOTED_SCALE = 2								-- Scaling value from province development to number of ducats it contains.									-- Maximum amount of ducats (total) a province can be looted for each month.
NDefines.NMilitary.LOOTED_RECOVERY = 0.2
NDefines.NMilitary.SLAVE_RAIDS_SAILOR_FACTOR = 0.2						
NDefines.NMilitary.SLAVE_RAIDS_DURATION = 7300
 --Defence penalties
NDefines.NMilitary.RIVER_CROSSING_PENALTY = -1						-- Dice roll penalty from river crossing
NDefines.NMilitary.STRAIT_CROSSING_PENALTY = -2					-- Dice roll penalty from strait crossing
NDefines.NMilitary.SEA_LANDING_PENALTY = -2
 --suppression
NDefines.NMilitary.MAX_REBEL_SUPPRESSION = 10.0				-- Maximum amount of rebel suppression by troops in a province
NDefines.NMilitary.INF_SUPPRESSION = 0.5					-- The amount of reduction to unrest for each friendly infantry regiment in a province
NDefines.NMilitary.CAV_SUPPRESSION = 0.75						-- The amount of reduction to unrest for each friendly cavalry regiment in a province
NDefines.NMilitary.ART_SUPPRESSION = 0.25					-- The amount of reduction to unrest for each friendly artillery regiment in a province
NDefines.NMilitary.ARMY_DRILL_YEARLY_DECAY = -0.05

 --- navy changes
 
NDefines.NMilitary.NAVAL_BASE_ENGAGEMENT_WIDTH = 10   		-- Number of ships that can fire per round
NDefines.NMilitary.HEAVY_SHIP_COMBAT_WIDTH = 3
NDefines.NMilitary.LIGHT_SHIP_COMBAT_WIDTH = 2
NDefines.NMilitary.GALLEY_COMBAT_WIDTH = 2
NDefines.NMilitary.TRANSPORT_COMBAT_WIDTH = 1
NDefines.NMilitary.NAVAL_CASUALTY_MIN_MORALE_DAMAGE = 0.6 -- was 0.2
NDefines.NMilitary.CAPTURED_SHIP_STRENGTH = 0.5 -- was 0.3
NDefines.NMilitary.CAPTURED_SHIP_MORALE = 0.25 -- was 0.3
NDefines.NMilitary.NAVAL_MISSION_REGION_MIN_PROVINCES_IN_RANGE = 6
NDefines.NMilitary.MONTHLY_REPAIR = 0.05                            -- was 0.1 Ship repair speed
NDefines.NMilitary.HEAVY_SHIP_SAILORS_COST = 100					-- was 200
NDefines.NMilitary.LIGHT_SHIP_SAILORS_COST = 80					-- was 50
NDefines.NMilitary.GALLEY_SHIP_SAILORS_COST = 60					-- was 100
NDefines.NMilitary.TRANSPORT_SHIP_SAILORS_COST = 40				-- was 50
NDefines.NMilitary.HEAVY_SHIP_COST = 50							-- was 50
NDefines.NMilitary.LIGHT_SHIP_COST = 20							-- was 20
NDefines.NMilitary.GALLEY_COST = 15							-- was, 10
NDefines.NMilitary.TRANSPORT_COST = 10							-- _was 12

 --NAI changes
NDefines.NAI.DEVELOPMENT_CAP_BASE = 100			-- from 10
NDefines.NAI.DEVELOPMENT_CAP_MULT = 3 -- AI will not develop provinces that have more development than this or DEVELOPMENT_CAP_MULT*original development (whichever is bigger)
NDefines.NAI.PEACE_TERMS_RELEASE_ANNEXED_SIZE_MULT = 0.005			-- from 0p01

NDefines.NAI.DIPLOMATIC_ACTION_VASSALIZE_DEVELOPMENT_FACTOR = 10			-- from 20
NDefines.NAI.DIPLOMATIC_ACTION_ANNEX_DEVELOPMENT_FACTOR = 25			-- from 50
NDefines.NAI.DIPLOMATIC_ACTION_INTEGRATE_DEVELOPMENT_FACTOR = 25			-- from 50
NDefines.NAI.DIPLOMATIC_ACTION_CRUSADE_DEVELOPMENT_FACTOR = 0.5			-- from 1
NDefines.NAI.DIPLOMATIC_ACTION_CLAIM_THRONE_DEVELOPMENT_FACTOR = 0.5			-- from 1
NDefines.NAI.DIPLOMATIC_ACTION_AGITATE_FOR_LIBERTY_DEVELOPMENT_FACTOR = 0.15			-- from 0p25
NDefines.NAI.DIPLOMATIC_ACTION_SUPPORT_HEIR_DEVELOPMENT_FACTOR = 1			-- from 2
NDefines.NAI.DIPLOMATIC_ACTION_TRIBUTARY_ACCEPTANCE_PER_DEVELOPMENT = -0.25			-- from -0p5
NDefines.NAI.CHARTER_COMPANY_BASE_RELUCTANCE = -100						-- from -3; Base reluctance to giving away provinces in charter company diplo action - essentially disabled
NDefines.NAI.CHARTER_COMPANY_DEVELOPMENT_RELUCTANCE = 1				-- from 3; How much development needed to add one reluctance

 -- Condotierri
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_BASE_MULT = 33 -- AI scoring for offer condottieri, base scale.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_MONTHLY_PARTICIPATION_RATE = -0.3 --Base monthly decay in participation. Related to multipliers for war participation (but doesn't depend on number of regiments, so raw multiplier matters).
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_BREAK = -2.4 --At this level of (lack of) participation from the player, the AI will break the condottieri agreement and tell all their friends.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_WARN = -1.2 --At this level of (lack of) participation from the player, a warning alert will be displayed about impendent AI discontent.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_HIRING_MALUS_YEARS = 25 --Once AI has told all their friends about how mean a player is, they will refuse to hire condottieri for cash this long.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_PARTICIPATION_FROM_CASUALTIES = 0.5 --Scaler for casulties caused by condottieri.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_ONLY_MILITARY_RULERS = 1 --If set to 1, AI will only send Condottieri while having a miliaristic ruler.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_ONLY_NEIGHBORS = 1 --If set to 1, AI will only send Condottieri to neighbors, regardless of access.
NDefines.NAI.DIPLOMATIC_ACTION_OFFER_CONDOTTIERI_DISABLE_VERSUS_PLAYER_ENEMIES = 0 --If set to 1, AI will try avoid sending Condottieri having to fight against human player enemies.
 --Peace Deals
NDefines.NAI.PEACE_INCONCLUSIVE_THRESHOLD = 0
NDefines.NAI.PEACE_TERMS_VASSAL_BASE_MULT = 10.0 -- only applied if the AI has vassalize priority
 -- abandon union
NDefines.NAI.DIPLOMATIC_ACTION_ABANDON_UNION_BASE_FACTOR = 10 --  was 60     AI scoring to abandoning Personal Union (given high enough LD and strength).
NDefines.NAI.DIPLOMATIC_ACTION_ABANDON_UNION_STRENGTH_THRESHOLD = 5 --  was 2.5      Threshold in relative strength for AI to give up on Personal Union.
	
 --NGraphics changes
NDefines.NGraphics.CITY_SPRAWL_AMOUNT = 1.0			-- from 3p0
--NDefines.NGraphics.CAPITAL_INDICATOR_HEIGHT = 0.1 -- from 5.8 - LOWERING AS FLAGS WERE REMOVED FOR PERFORMANCE PURPOSES
--NDefines.NGraphics.CAPITAL_INDICATOR_HEIGHT_SCALE = 140.0 -- from 140.0 - CHANGES SCALE OF CAPITAL INDICATOR

 --NEngine 
NDefines.NEngine.EVENT_PROCESS_OFFSET = 90				-- Events are checked every X day per character or province (1 is ideal, but CPU heavy)

  --NReligion changes
NDefines.NReligion.CONSECRATE_PATRIARCH_THRESHOLD = 60			-- from 30
NDefines.NReligion.DOOM_REDUCTION_FROM_OCCUPATION = 0.025			-- from 0p05
NDefines.NReligion.AUTHORITY_FROM_DEVELOPMENT = 0.01			-- from 0p02
NDefines.NReligion.HARMONY_LOSS_PER_DEV_CONVERTED = 0.5			-- from 1
NDefines.NReligion.MAX_CHRISTIAN_RELIGIOUS_CENTERS = 5 --was 3
NDefines.NReligion.MIN_CARDINALS = 12									-- Least amount of cardinals/ Starting cardinals
NDefines.NReligion.MAX_CARDINALS = 24									-- Max amount of cardinals
NDefines.NReligion.MAX_CARDINALS_PER_COUNTRY = 6							-- Max cardinals in a single country
NDefines.NReligion.MINIMUM_DEVELOPMENT_ALLOWED = 50.0							-- WAS 10.0 -- You will need a higher development than this for your province to be eligible for cardinal
NDefines.NReligion.COUNTRY_DEVELOPMENT_DIVIDER = 600.0							-- WAS 200 -- When a cardinal is chosen the formula is diving a countrys development by this number.
NDefines.NReligion.NUMBER_OF_POSSIBLE_CARDINALS = 5						-- Number of cardinals from said number of most successful provinces to be randomly picked from


---- NGovernment
NDefines.NGovernment.RUSSIAN_ABILITY_COST = 100
NDefines.NGovernment.RUSSIAN_ABILITY_POOL_SIZE = 150
NDefines.NGovernment.RUSSIAN_ABILITY_BASE_GAIN = 1
NDefines.NGovernment.RUSSIAN_ABILITY_SUDEBNIK_MIN_AUTONOMY = 10
NDefines.NGovernment.RUSSIAN_ABILITY_SUDEBNIK_AUTONOMY_CHANGE = -10
NDefines.NGovernment.RUSSIAN_ABILITY_OPRICHNINA_THRESHOLD = 0.3
NDefines.NGovernment.RUSSIAN_ABILITY_OPRICHNINA_AI_THRESHOLD = 0.85 -- AI will use ability when revolt risk is 90%, or when they have full power
NDefines.NGovernment.RUSSIAN_ABILITY_OPRICHNINA_CHANGE = -0.3
NDefines.NGovernment.RUSSIAN_ABILITY_STRELTSY_WE_CHANGE = -2
NDefines.NGovernment.RUSSIAN_ABILITY_STRELTSY_SPAWN_SIZE = 0.2

NDefines.NGovernment.IQTA_POLICY_COOLDOWN_YEARS = 20
NDefines.NGovernment.EFFICIENT_FARMING_DUCAT_MULTIPLIER = 2
NDefines.NGovernment.LAND_AQUISITION_MANPOWER_MULTIPLIER = 0.05
	
NDefines.NGovernment.GOVERNMENT_REFORM_BASE_COST = 100.0
NDefines.NGovernment.GOVERNMENT_REFORM_COST_INCREASE = 100.0
NDefines.NGovernment.GOVERNMENT_REFORM_YEARLY_BASE_PROGRESS = 10.0
NDefines.NGovernment.GOVERNMENT_REFORM_HISTORIC_AUTONOMY = 0.25
NDefines.NGovernment.GOVERNMENT_REFORM_CHANGE_PROGRESS_COST = 50.0
NDefines.NGovernment.DICTATORSHIP_TO_MONARCHY_REFORM_PENALTY = 4
NDefines.NGovernment.NATIVE_REFORM_REFORM_PENALTY = 2
NDefines.NGovernment.EXPAND_ADMIN_COST = 20.0


 --NNationDesigner changes
NDefines.NNationDesigner.BASE_TAX_COST_MODIFIER = 0.1			-- from 0p5
NDefines.NNationDesigner.PRODUCTION_COST_MODIFIER = 0.25			-- from 0p5
NDefines.NNationDesigner.MANPOWER_COST_MODIFIER = 0.3			-- from 0p5
NDefines.NNationDesigner.MAX_GOVERNMENT_RANK = 5 -- was 3
