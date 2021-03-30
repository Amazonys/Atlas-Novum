NDefines.NDiplomacy.MAX_FREE_CITIES = 15			-- from original BtP increased from 8
NDefines.NDiplomacy.HRE_PRINCE_AUTHORITY_THRESHOLD = 35			-- from original BtP increased from 25
NDefines.NDiplomacy.IMPERIAL_AUTHORITY_FROM_PRINCES = 0.075			-- from original BtP reduced from 01


NDefines.NDiplomacy.IMPERIAL_CITY_IA = 0.003			-- Beyond Typus added reducing ia to account for all the new provinces Base 0005
NDefines.NDiplomacy.HRE_FOREIGN_CONTROL_PENALTY = -0.003			-- Beyond Typus added reducing ia to account for all the new provinces Base 0005
NDefines.NCountry.MERCHANT_REPUBLIC_SIZE_LIMIT = 50			-- Beyond Typus added large number of new provinces make province number based things like this require updating Base 20
NDefines.NCountry.PS_BOOST_MILITARIZATION = 30			-- Same logic as above new provinces cause faster decline thus need lower cost ideally I can find a better solution later Base 50
NDefines.NCountry.ALLOWED_TERRITORY_VS_MAX_STATES = 1.5			-- Same logic as above new provinces and areas require higher numbers 
NDefines.NCountry.TERRITORY_PENALTY_CAP = 60			-- Same logic as above new provinces and areas require higher numbers 
--NDefines.NMilitary.FORT_PER_DEV_RATIO = 30			-- Beyond Typus added more provinces means more forts needed for same dev     Removed as dev is now doubled
NDefines.NMilitary.FORTRESS_COST = 0.4			-- Beyond Typus added so many new provinces which means more forts but no more dev so everyone was going broke Base 05

--NDefines.NReligion.REFORM_DESIRE_PER_YEAR = 0.005								-- from 0p005. Halving this makes for a slightly smoother reform desire gain curve.
	
 --NGraphics changes
NDefines.NGraphics.CITY_SPRAWL_SHRINK_DISTANCE = 90.0			-- from 150p0
NDefines.NGraphics.CITY_SPRAWL_DRAW_DISTANCE = 120.0			-- from 200p0
NDefines.NGraphics.BORDER_WIDTH = 0.8			-- from 1p5

-- Custom defines for Typus to fix the main menu camera:
NDefines.NGame.MAX_RANDOM_NEW_WORLD = "1000.1.1"
NDefines.NGame.SIZE_LIMIT_FOR_ISLANDS = 100000			-- from 25000      Changing this to represent anything smaller than about Australia as an island   Different pixels in ToT projection could cause differences compared to vanilla such as Greenland

NDefines.NFrontend.CAMERA_LOOKAT_X = 2787.0
NDefines.NFrontend.CAMERA_LOOKAT_Z = 1845.0
NDefines.NFrontend.CAMERA_LOOKAT_SETTINGS_X = 2787.0
NDefines.NFrontend.CAMERA_LOOKAT_SETTINGS_Z = 1845.0
NDefines.NFrontend.CAMERA_START_X = 2787.0
NDefines.NFrontend.CAMERA_START_Z = 1755.0
NDefines.NFrontend.CAMERA_END_X = 2787.0
NDefines.NFrontend.CAMERA_END_Z = 1700.0
NDefines.NFrontend.FRONTEND_POS_X = 2787.0
NDefines.NFrontend.FRONTEND_POS_Z = 1825.0
NDefines.NFrontend.FRONTEND_LOOK_X = 2787.0
NDefines.NFrontend.FRONTEND_LOOK_Z = 1845.0
NDefines.NFrontend.SETTINGS_POS_X = 2787.0
NDefines.NFrontend.SETTINGS_POS_Z = 1228.0
NDefines.NFrontend.SETTINGS_LOOK_X = 2787.0
NDefines.NFrontend.SETTINGS_LOOK_Z = 1499.0
NDefines.NFrontend.MP_OPTIONS_POS_X = 2787.0
NDefines.NFrontend.MP_OPTIONS_POS_Z = 1398.0
NDefines.NFrontend.MP_OPTIONS_LOOK_X = 2787.0
NDefines.NFrontend.MP_OPTIONS_LOOK_Z = 1459.0
NDefines.NFrontend.TUTORIAL_POS_X = 2724.0
NDefines.NFrontend.TUTORIAL_POS_Z = 1654.0
NDefines.NFrontend.TUTORIAL_LOOK_X = 2710.0
NDefines.NFrontend.TUTORIAL_LOOK_Z = 1792.0
NDefines.NFrontend.CONTENT_POS_X = 2787.0
NDefines.NFrontend.CONTENT_POS_Z = 1642.0
NDefines.NFrontend.CONTENT_LOOK_X = 2787.0
NDefines.NFrontend.CONTENT_LOOK_Z = 1845.0
NDefines.NFrontend.CREDITS_POS_X = 2911.0
NDefines.NFrontend.CREDITS_POS_Z = 1824.0
NDefines.NFrontend.CREDITS_LOOK_X = 2916.0
NDefines.NFrontend.CREDITS_LOOK_Z = 2027.0