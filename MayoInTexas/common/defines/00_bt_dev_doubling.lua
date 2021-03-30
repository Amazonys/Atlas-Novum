 -- Note Im intergrating many to most of the features from my former Misc Addon while Im at it because all these changes for dev doubling break compatibility with the addon anyway

 -- no NGame changes

  --NDiplomacy changes   note subsection for treaties
NDefines.NDiplomacy.FAVORS_LAND_DIVIDER = 4			-- from 2      note inversed value
NDefines.NDiplomacy.VASSALIZE_BASE_DEVELOPMENT_CAP = 400			-- from 100, doubled after dev doubling, because this is annoying.
NDefines.NDiplomacy.MARCH_BASE_DEVELOPMENT_CAP = 400			-- from 200
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
 -- Peace Costs
NDefines.NDiplomacy.PEACE_COST_DEMAND_PROVINCE = 0.5			-- from 1
NDefines.NDiplomacy.PEACE_COST_CONCEDE_PROVINCE = 0.4			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   More provinces and dev in colonial regions was making this too expensive   Also noticed that occasionally choosing provinces individually was less warscore why I dont know but we dont want that
NDefines.NDiplomacy.PEACE_COST_JOIN_EMPIRE = 0.25			-- from 0p5
NDefines.NDiplomacy.PEACE_COST_BECOME_VASSAL = 0.4			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   This might be a personal thing but completely taking land shouldnt be the same price or cheaper than enforcing vassalage   vassal relations historically happened somewhat often even between larger nations
NDefines.NDiplomacy.PEACE_COST_RETURN_CORE = 0.4			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   returning a core to a rightful owner should be a less dramatic negotiating factor than taking a completely new province
NDefines.NDiplomacy.PEACE_COST_REVOKE_CORE = 0.25			-- from 0p5
NDefines.NDiplomacy.PEACE_COST_RELEASE_ANNEXED = 0.4			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   releasing an annexed vassal shouldnt be as dramatic as demanding a completely new province   Also encourages breaking up of blobs which can only be a good thing
NDefines.NDiplomacy.PEACE_COST_RELEASE_VASSAL = 0.25			-- from 0p5
NDefines.NDiplomacy.PEACE_COST_CONVERSION = 0.25			-- from 1   Some peace cost changes moved from Misc Addon to Main BT where they overlap   I know people love their beliefs and resist religious change but the absurdly high price of this made it only possible against very small tags where it was usually preferable to just annex   Now this might be useful
NDefines.NDiplomacy.PEACE_COST_RELEASE = 1			-- from 2


NDefines.NDiplomacy.PEACE_COST_GOLD_STEP = 10 						-- from 5 	Loans hardcoded to being double size in BT.
NDefines.NDiplomacy.PEACE_COST_GOLD_MAX = 3						-- from 5	Loans hardcoded to being double size in BT. Sadly, this value does not accept decimal values, so it's either 2 or 3. I go with 3 since it makes a nice 50% with war reps costs.
NDefines.NDiplomacy.PO_SPREAD_REVOLUTION_POWER_GAIN = 0.5			-- from 0p5

 --End of Peace Costs
NDefines.NDiplomacy.ANNEX_DIP_COST_PER_DEVELOPMENT = 4			-- from 8
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_STATE_WITH_PROSPERITY = 0.03			-- Readjusted this value to vanilla's since states have not been redrawn in the region, and with 1.29, Mandate owners are very unlikely to expand. Finally, the increased number of state slots are not twice of vanilla's, so halving this number doesn't make sense.
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_DEVASTATION = -5			-- from -10p0
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_TRIBUTARY_DEV = 0.075			-- from 0p15
NDefines.NDiplomacy.CELESTIAL_EMPIRE_MANDATE_PER_HUNDRED_NONTRIBUTARY_DEV = 0.0			-- from -0p0   used to be -0p3 and BT was -0p15
NDefines.NDiplomacy.TRIBUTE_BASE_ADM = 0.015			-- from 0p03
NDefines.NDiplomacy.TRIBUTE_BASE_DIP = 0.015			-- from 0p03
NDefines.NDiplomacy.TRIBUTE_BASE_MIL = 0.015			-- from 0p03

NDefines.NDiplomacy.JOIN_HRE_DEVELOPMENT_CAP_VASSAL = 400			-- fom 400

NDefines.NDiplomacy.FORCE_JOIN_HRE_AUTHORITY_PER_DEVELOPMENT = 0.05				-- from 0p1

NDefines.NDiplomacy.HRE_AUTHORITY_JOIN_EMPIRE = 2.5			-- from 5. Way more tags in BT so this needs to be halved.
NDefines.NDiplomacy.HRE_AUTHORITY_LEAVE_EMPIRE = -5			-- from -10. See above.
NDefines.NDiplomacy.HRE_AUTHORITY_PROVINCE_JOIN = 0.05			-- from 0p1. More provinces equals more IA, hence counterbalance by less IA gain.


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
NDefines.NCountry.CULTURE_MIN_DEVELOPMENT_TO_PROMOTE = 40			-- from 20
NDefines.NCountry.PS_DEMAND_NON_WARGOAL_PROVINCE = 20			-- from 50
NDefines.NCountry.PS_DEMAND_NON_WARGOAL_PEACE = 2			-- from 3
NDefines.NCountry.PS_MAKE_PROVINCE_CORE = 5			-- from 10
NDefines.NCountry.PS_MOVE_CAPITAL_EXTRA = 10			--from 20, was 100 from 50
NDefines.NCountry.PS_CHANGE_CULTURE = 5			-- from 10
NDefines.NCountry.PS_IMPROVE_PROVINCE_BASE = 25			-- from 50
NDefines.NCountry.PS_IMPROVE_PROVINCE_CAPITAL_DISCOUNT = 0.025			-- from 0p05
NDefines.NCountry.OVEREXTENSION_FACTOR = 0.5			-- from 1p0
NDefines.NCountry.MONTHS_TO_CHANGE_CULTURE = 5			-- from 10
NDefines.NCountry.REVOLT_SIZE_DEVELOPMENT_MULTIPLIER = 0.05			-- from 0p1
NDefines.NCountry.LIBERTY_DESIRE_DEVELOPED_IN_SUBJECT = -2.5 		--from 5p0
NDefines.NCountry.GRANT_PROVINCE_LIBERTY_MULTIPLIER = 0.25 			--from 0p5
NDefines.NCountry.RETURN_LAND_LIBERTY_MULTIPLIER = 1.25			-- from 2p5
NDefines.NCountry.RAZE_PROVINCE_POWER_PER_DEVELOPMENT = 10			-- from 25p0
NDefines.NCountry.HORDE_UNITY_PER_RAZE = 0.25			-- from 0p5
NDefines.NCountry.SETTLMENT_GROWTH_CHANCE_MULTIPLIER = 5.0			-- from 2p5
NDefines.NCountry.SETTLMENT_GROWTH_CHANCE_MIN = 0.02			-- from 0p05

NDefines.NCountry.ESTATE_CROWNLAND_FROM_DEV = 0.1			-- from 0p2

 --NEconomy
NDefines.NEconomy.GOLD_MINE_DEPLETION_THRESHOLD = 2			-- from 1
NDefines.NEconomy.GOLD_MINE_DEPLETION_CHANCE = 0.05			-- from 0p1
NDefines.NEconomy.MISSIONARY_MAINTENANCE_DEVELOPMENT_FACTOR = 0.5			-- from 1p0
NDefines.NEconomy.MISSIONARY_MAINTENANCE_DEVELOPMENT_CAP = 120			-- from 100
NDefines.NEconomy.CARAVAN_FACTOR = 10.0			-- from 3p0     Development is divided by this factor, do not set to zero!
NDefines.NEconomy.EXPELLED_MINORITY_DEV_BONUS_FACTOR = 0.2			-- reverted from 0p1 from 0p2 since individual province dev isn't doubled, for the most part.
NDefines.NEconomy.EXPELLING_MINORITY_SETTLER_CHANCE_FACTOR = 0.001			-- from 0p001, was 0p003 from 0p005, reverted for similar reasoning to line above

 --NMilitary changes
NDefines.NMilitary.DEVELOPMENT_FOR_BLOCKADE_COST = 0.25			-- from 0p5		Don't actually know how this works or what it is, but I presume it is a new 1.30 define
 
 
NDefines.NMilitary.DEVASTATION_DEVELOPMENT_SCALE = 2.5			-- from 5     I dont actually know how this works     Might have it reversed better check later
NDefines.NMilitary.PARTICIPATION_SCORE_BLOCKADE = 0.0005			-- from 0p001
NDefines.NMilitary.FORT_PER_DEV_RATIO = 33			-- From 50 vanilla, from 100 in BT. It seems that the AI will delete any forts that are unnecessary to obtain this fort per dev ratio. This was the culprit of the ever-deleting fort AI, not the actual income it made. This has been semi-tailored after Ottomans, who start with now 738 dev and 22 forts, yielding an approximate 33 dev per fort.
NDefines.NMilitary.BASE_MP_TO_MANPOWER = 0.125			-- from 0p25
NDefines.NMilitary.BLOCKADE_FACTOR = 1.5			-- from 3     (Total sail speed / blockade_factor) * blockade_efficiency / province development
NDefines.NMilitary.JANISSARIES_HEATHEN_DEVELOPMENT_DIVISOR = 20			-- from 10
NDefines.NMilitary.LOOTED_SCALE = 0.5 --From 1p0 vanilla. Value forgotten to be accounted for dev doubling.

 --NAI changes
NDefines.NAI.DEVELOPMENT_CAP_BASE = 50	-- From 10. Trying to unhinge the AI's development so that they actually use their extra monarch points.
NDefines.NAI.DEVELOPMENT_CAP_MULT = 10 -- From 2. Same here.

NDefines.NAI.DIPLOMATIC_ACTION_VASSALIZE_DEVELOPMENT_FACTOR = 10			-- from 20
NDefines.NAI.DIPLOMATIC_ACTION_ANNEX_DEVELOPMENT_FACTOR = 25			-- from 50
NDefines.NAI.DIPLOMATIC_ACTION_INTEGRATE_DEVELOPMENT_FACTOR = 25			-- from 50
NDefines.NAI.DIPLOMATIC_ACTION_CRUSADE_DEVELOPMENT_FACTOR = 0.5			-- from 1
NDefines.NAI.DIPLOMATIC_ACTION_CLAIM_THRONE_DEVELOPMENT_FACTOR = 0.5			-- from 1
NDefines.NAI.DIPLOMATIC_ACTION_AGITATE_FOR_LIBERTY_DEVELOPMENT_FACTOR = 0.15			-- from 0p25
NDefines.NAI.DIPLOMATIC_ACTION_SUPPORT_HEIR_DEVELOPMENT_FACTOR = 1			-- from 2
NDefines.NAI.DIPLOMATIC_ACTION_TRIBUTARY_ACCEPTANCE_PER_DEVELOPMENT = -0.25			-- from -0p5
NDefines.NAI.CHARTER_COMPANY_DEVELOPMENT_RELUCTANCE = 1			-- from 3
NDefines.NAI.IMPORANT_PROVINCE_THRESHOLD = 0.02			-- from 0p05
NDefines.NAI.MAX_CAV_PERCENTAGE = 30 --From 50. Misc lowered max cav percentage down to 30, while leaving this up at 50. This caused the AI to derp in certain cases, which I hope to fix with this adjustment.

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
