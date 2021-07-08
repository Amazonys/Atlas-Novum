----- TWEAKS FOR THE RANDOM WORLD GENERATION -----
RandomWorld = {
	--- Options ---
	options = {
		width				= 2304,
		height				= 2048,
		overlapping_sea_province_search_width = 2600, -- Any sea province that overlaps with the randomized area needs to be removed from the provincemap, overlapping_sea_province_search_width is the rightmost edge of the area of the provincemap that will be searched for these provinces
		
		-- for scaling coordinates from the old world.
		cutoff				= 800,
		
		seed 				= -1, 		-- A positive value will force that seed to always be used
	},

	--- TOPOLOGY ---
	heightmap = { -- Continents (fBm)
		min_water_height 	= 0.18, 	-- 46.0/255.0
		noise_water_clip 	= 0.52,		-- Increasing this will result in more islands
		cutoff_border_x		= 400,
		cutoff_border_y		= 300,
		
		frequency_x			= 450,
		frequency_y			= 450,
		
		h					= 1.0,
		lacunarity			= 4.0,
		octaves				= 3.0,
	},

	heightmap_noise = { -- Adds noise to the height map (fBm)
		noise_factor 		= 0.60,
		noise_factor_water 	= 0.30,
		
		frequency_x			= 100,
		frequency_y			= 100,
		
		h					= 1.0,
		lacunarity			= 4.0,
		octaves				= 3.0,
		
		noise_power			= 2,
		noise_power_water	= 2,
	},

	mountains = { -- Mountain ridges (Ridged Multifractal)
		amplitude 			= 36,
		water_amplitude 	= 38,
		min_water_height	= 46,
		
		frequency_x			= 200,
		frequency_y			= 300,
		
		h					= 1.0,
		lacunarity			= 4.0,
		octaves				= 5.0,
		
		offset				= 1.0,
		gain				= 2.0,
		
		power				= 5,
		power_water			= 2,
		
		costal_bb_dim		= { 128, 128 },
		costal_max_sq_dist	= 7000,
		costal_limiter		= 0.1,
		costal_amplitude	= 3.0,
		costal_max_height	= 105,
		
		coastal_noise_freq_x	= 256.0,
		coastal_noise_freq_y	= 256.0,
		coastal_noise_clip		= 0.58,
	},

	smooth_coasts = { -- Smoothing of the coastline
		iterations 			= 6,
	},

	smooth_heightmap = { -- Smoothing of the height map
		max_smooth_height 	= 115,
		max_lerp			= 0.8,
		iterations			= 4,
		no_smooth_x_offset	= 100,
	},

	--- RIVERS ---
	rivers = { -- Rivers
		river_end_find_begin		= 50,
		river_end_find_offset		= 25,
		
		start_index 				= 0,
		intersection_with_index		= 1,
		intersection_from_index		= 2,
		water_index					= 254,
		land_index					= 255,
		min_river_width				= 3,		-- Min color index
		max_river_width				= 11,		-- Max color index
		
		noise_freq_x				= 3.0,
		noise_freq_y				= 3.0,
		
		topology_bias				= 1,
		topology_max				= 130,
		
		sq_dist_diff				= 1.0, 		-- Distance for start to next river pixel can't be less than x% of previous pixel distance
		max_pixels					= 400,
		min_pixels_max_topology		= 10,
		min_pixels					= 50,
		length_reduction_if_water	= 0.4,
		
		min_pixels_branch			= 100, 		-- Only create branches for rivers above x pixels
		branch_from					= 0.3, 		-- Branch after half length
		branch_after				= 60,		-- After how many pixels should we add a new branch
		branch_forced_direction		= 8,		-- For how many pixels should we force the branch direction
		
		smooth_iterations			= 4,
		smooth_use_low				= 0,
		
		min_num_pixels_land			= 65536,
	},
	
	--- TERRAIN ---
	moisture = { -- Moisture map
		downsample			= 8, 				-- Down sample of moisture map compared to world map
	
		sea_add 			= 4, 				-- Added to moisture value for each water pixel
		start_moisture 		= 100, 				-- Start moisture value from beginning of map (NOT only continents)
		min_promille 		= 12, 				-- How much rain will fall for every pixel, no matter what 
		cloud_max_height 	= 90, 				-- Max height for clouds
		height_promille 	= 750, 				-- How much the rain will increase on height change, related to cloud_max_height.
	},
	
	moisture_value = { -- Moisture map
		low_res 			= 0,
		no_smooth 			= 0,
	},
	
	terrain = { -- Terrain
		mountain_height				= 125,
		snow_height					= 155,
		hills_height				= 115,
		mountain_steepness			= 15,
		mountain_ignore_steepness	= 135,
		
		desert_moisture				= 45,
		desert_grasslands_moisture	= 55,
		grasslands_moisture			= 61,
		
		grasslands_noise_freq_x		= 2.5,
		grasslands_noise_freq_y		= 2.5,
		
		moisture_noise_freq_x		= 6.0,
		moisture_noise_freq_y		= 6.0,
		moisture_noise_amplitude	= 8,
		
		heat_limit					= 150,
		
		tropical_heat				= 235, -- Above this is tropical
		subtropic_heat				= 210, -- Above this is subtropical ( arid but rains more so can easier end up savannah or jungle )
		temperate_heat				= 180, -- Above this is arid ( deserts )
		frigid_heat					= 100, -- Above this is temperate below is frigid
		
		severe_winter_heat			= 100,
		normal_winter_heat			= 140,
		mild_winter_heat			= 180,
	},	
	
	--- COLOR MAP ---
	colormap = {
		texture_reduction 		= 2,
		
		plains_color_r			= 123, 
		plains_color_g			= 97,  
		plains_color_b			= 57,  
		
		grasslands_color_r		= 50,
		grasslands_color_g		= 66,
		grasslands_color_b		= 25,
		
		mountain_color_r		= 64,
		mountain_color_g		= 42,
		mountain_color_b		= 23,
		
		hills_color_r			= 32,
		hills_color_g			= 47,
		hills_color_b			= 16,
		
		desert_color_r			= 146,
		desert_color_g			= 115,
		desert_color_b			= 55,
		
		base_color_r			= 80,
		base_color_g			= 103,
		base_color_b			= 142,
		
		noise_overlay_percent 	= 0.70,
		
		desert_transition_size			= 70,	-- NOT USED AT THE MOMENT
		desert_transition_iterations 	= 1,	-- NOT USED AT THE MOMENT
	},
	
	colormap_seasons = {
		-- Winter
		season0_overlay_percent			= 0.35,
		season0_color_r					= 200,
		season0_color_g					= 225,
		season0_color_b					= 255,
		
		-- Spring
		season1_overlay_percent			= 0.25,	
		season1_color_r					= 180,
		season1_color_g					= 225,
		season1_color_b					= 200,

		-- Summer
		season2_overlay_percent			= 0.1,	
		season2_color_r					= 0,
		season2_color_g					= 150,
		season2_color_b					= 0,

		-- Autumn
		season3_overlay_percent			= 0.70,	
		season3_color_r					= 150,
		season3_color_g					= 20,
		season3_color_b					= 0,		
	},
	
	colormap_water = {
		land_color_r			= 20,
		land_color_g			= 216,
		land_color_b			= 216,
	},
	
	smooth_colormap = { -- Smoothing of the color map
		low_res				= 0,
		iterations 			= 4,
	},
	
	--- PROVINCE MAP ---
	provincemap = { -- Province map
		costal_bb_dim		= { 128, 128 },	-- Used to check of close a province is to the coast, 
											--  higher number leads to better accuracy
		costal_max_sq_dist				= 7000,
		costal_limiter					= 0.5,		-- 0 equals only adding coastal provinces in a coastal grid
		coastal_max_extra 				= 2,		-- Max amount of extra points added around coastal provinces
		coastal_extra_rand_offset		= 8.0,		-- -offset <= x <= offset
		coastal_extra_offset			= 2.0,		-- Ex. land_width / coastal_extra_offset
		width_scaler_for_non_coastal 	= 2.1,
		
		water_width 		= 136,
		land_width 			= 94,
		side_sub_divs		= 8,
		side_sub_offset		= 512,
		water_voronoi_relax = 2,
		land_voronoi_relax	= 0,
		
		noise_freq_x			= 64.0,
		noise_freq_y			= 64.0,
		noise_h					= 1.0,
		noise_lacunarity		= 2.0,
		noise_octaves			= 1.0,
		noise_iterations		= 4,
		noise_smooth_iterations	= 2,
		
		min_num_pixels_water	= 800,				-- Provinces with fewer pixels than this will be merged with an neighbour
		min_num_pixels_land		= 8,
		
		max_one_province_pixels = 18000,
	},
	
	--- CLIMATE ---
	climate = {
		arctic_start 		= 0.0,			-- Arctic will receive severe winter type
		arctic_end 			= 0.17,
		tropical_start 		= 0.45,
		tropical_end 		= 0.9,
		normal_winter_end 	= 0.25,
		mild_winter_end 	= 0.35,
		
		impassable_desert_neighbors = 0.5,
	},
	
	--- TREES ---
	trees = {
		height_limit 			= 115, 						-- No trees above this height
		height_difference 		= 5,						-- No trees if height diff with this value
		height_difference_dim 	= 19,						-- Kernel
		
		y_offset				= 100,						-- Perlin noise
		y_freq_x				= 10.0,
		y_freq_y				= 10.0,
	
		num_tree_types			= 3,						-- Needs to match with entries below
		
		tree0_index 			= 4,						-- Forest
		tree0_sparse_index 		= 3,
		tree0_sparsest_index 	= 2,
		tree0_terrain			= { 0, 1, 5, 6, 8, 9, 10 },
		tree0_y_limit			= 0.25,
		
		tree1_index 			= 7,						-- Woods
		tree1_sparse_index 		= 5,
		tree1_sparsest_index 	= 6,
		tree1_terrain			= { 0, 1, 5, 6, 8, 9, 10 },
		tree1_y_limit			= 0.5,
		
		tree2_index 			= 15,						-- Jungle
		tree2_sparse_index 		= 14,
		tree2_sparsest_index 	= 13,
		tree2_terrain			= { 0, 1, 5, 6, 8, 9, 10 },
		tree2_y_limit			= 1.0,
	},

}
