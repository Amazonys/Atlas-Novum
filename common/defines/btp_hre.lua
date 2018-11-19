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
NDefines.NMilitary.FORTRESS_COST = 0.2			-- Beyond Typus added so many new provinces which means more forts but no more dev so everyone was going broke Base 05