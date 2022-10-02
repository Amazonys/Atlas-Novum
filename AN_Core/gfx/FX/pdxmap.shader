## Includes

Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"pdxmap.fxh"
	"shadow.fxh"
}


## Samplers

VertexShader =
{
	Samplers = 
	{
		HeightMap =
		{
			AddressV = "Wrap"
			MagFilter = "Point"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}
	}
}

PixelShader = 
{
	Samplers = 
	{
		TerrainDiffuse = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		HeightNormal = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		TerrainColorTint = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 2
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		TerrainColorTintSecond = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 3
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		TerrainNormal = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 4
			MipFilter = "Point"
			MinFilter = "Linear"
		}

		TerrainIDMap = 
		{
			AddressV = "Clamp"
			MagFilter = "Point"
			AddressU = "Clamp"
			Index = 5
			MipFilter = "None"
			MinFilter = "Point"
		}

		IndirectionMap =
		{
			AddressV = "Clamp"
			MagFilter = "Point"
			AddressU = "Clamp"
			Index = 7
			MipFilter = "Point"
			MinFilter = "Point"
		}

		FoWTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 8
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWDiffuse = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 9
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		OccupationMask = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 10
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		ProvinceColorMap = 
		{
			AddressV = "Clamp"
			MagFilter = "Point"
			AddressU = "Clamp"
			Index = 11
			MipFilter = "Point"
			MinFilter = "Point"
		}

		ShadowMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 12
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		TITexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 13
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		MudTexture = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 14
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		MudDiffuse =
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 15
			MipFilter = "Linear"
			MinFilter = "Linear"
		}
	}
}

## Vertex Structs

VertexStruct VS_INPUT_TERRAIN_NOTEXTURE
{
    float4 position			: POSITION;
	float2 height			: TEXCOORD0;
};

VertexStruct VS_OUTPUT_TERRAIN
{
    float4 position			: PDX_POSITION;
	float2 uv				: TEXCOORD0;
	float2 uv2				: TEXCOORD1;
	float3 prepos 			: TEXCOORD2;
	float4 vShadowProj		: TEXCOORD3;
	float4 vScreenCoord		: TEXCOORD4;
};

## Constant Buffers

## Shared Code

Code
[[
static const float3 GREYIFY = float3( 0.212671, 0.715160, 0.072169 );
static const float NUM_TILES = 4.0f;
static const float TEXELS_PER_TILE = 512.0f;
static const float ATLAS_TEXEL_POW2_EXPONENT= 11.0f;
static const float TERRAIN_WATER_CLIP_HEIGHT = 3.0f;
static const float TERRAIN_UNDERWATER_CLIP_HEIGHT = 3.0f;

#ifdef TERRAIN_SHADER
	#ifdef COLOR_SHADER
		#define TERRAIN_AND_COLOR_SHADER
	#endif
#endif

float mipmapLevel( float2 uv )
{
#ifdef PDX_OPENGL

	#ifdef NO_SHADER_TEXTURE_LOD
		return 1.0f;
	#else

		#ifdef	PIXEL_SHADER
			float dx = fwidth( uv.x * TEXELS_PER_TILE );
			float dy = fwidth( uv.y * TEXELS_PER_TILE );
		    float d = max( dot(dx, dx), dot(dy, dy) );
			return 0.5 * log2( d );
		#else
			return 3.0f;
		#endif //PIXEL_SHADER

	#endif // NO_SHADER_TEXTURE_LOD

#else
    float2 dx = ddx( uv * TEXELS_PER_TILE );
    float2 dy = ddy( uv * TEXELS_PER_TILE );
    float d = max( dot(dx, dx), dot(dy, dy) );
    return 0.5f * log2( d );
#endif //PDX_OPENGL
}

float4 sample_terrain( float IndexU, float IndexV, float2 vTileRepeat, float vMipTexels, float lod, float vTiles )
{
	vTileRepeat = frac( vTileRepeat );

#ifdef NO_SHADER_TEXTURE_LOD
	vTileRepeat *= 0.98;
	vTileRepeat += 0.01;
#endif
	
	float vTexelsPerTile = vMipTexels / vTiles;

	vTileRepeat *= ( vTexelsPerTile - 1.0f ) / vTexelsPerTile;
	return float4( ( float2( IndexU, IndexV ) + vTileRepeat ) / vTiles + 0.5f / vMipTexels, 0.0f, lod );
}

void calculate_index( float4 IDs, out float4 IndexU, out float4 IndexV, out float vAllSame )
{
	IDs *= 255.0f;
	vAllSame = saturate( IDs.z - 98.0f ); // we've added 100 to first if all IDs are same
	IDs -= vAllSame * 100.0f;

	IndexV = trunc( ( IDs + 0.5f ) / NUM_TILES );
	IndexU = trunc( IDs - ( IndexV * NUM_TILES ) + 0.5f );
}

#ifdef PIXEL_SHADER

float3 calculate_secondary( float2 uv, float3 vColor, float2 vPos )
{
	float4 vSample = GetProvinceColorSampled( uv, IndirectionMap, ProvinceIndirectionMapSize, ProvinceColorMap,
											 ProvinceColorMapSize, 1 );
	float4 vMask = tex2D( OccupationMask, vPos / 8.0f ).rgba;
	return lerp( vColor, vSample.rgb, saturate( vSample.a * vMask.a ) );
}

float3 calculate_secondary_compressed( float2 uv, float3 vColor, float2 vPos )
{
	float4 vMask = tex2D( OccupationMask, vPos / 8.0 ).rgba;

	// Point sample the color of this province. 
	float4 vSecondary = GetProvinceColorSampled( uv, IndirectionMap, ProvinceIndirectionMapSize, ProvinceColorMap,
												ProvinceColorMapSize, 1 );

	const int nDivisor = 6;
	int3 vTest = int3(vSecondary.rgb * 255.0);
	
	int3 RedParts = int3( vTest / ( nDivisor * nDivisor ) );
	vTest -= RedParts * ( nDivisor * nDivisor );

	int3 GreenParts = int3( vTest / nDivisor );
	vTest -= GreenParts * nDivisor;

	int3 BlueParts = int3( vTest );

	float3 vSecondColor = 
		  float3( RedParts.x, GreenParts.x, BlueParts.x ) * vMask.b
		+ float3( RedParts.y, GreenParts.y, BlueParts.y ) * vMask.g
		+ float3( RedParts.z, GreenParts.z, BlueParts.z ) * vMask.r;

	vSecondary.a -= 0.5 * saturate( saturate( frac( vPos.x / 2.0 ) - 0.7 ) * 10000.0 );
	vSecondary.a = saturate( saturate( vSecondary.a ) * 3.0 ) * vMask.a;
	return vColor * ( 1.0 - vSecondary.a ) + ( vSecondColor / float(nDivisor) ) * vSecondary.a;
}

bool GetFoWAndTI( float3 PrePos, out float4 vFoWColor, out float4 vMonsoonColor, out float TI, out float4 vTIColor )
{
	vFoWColor = GetFoWColor( PrePos, FoWTexture);	
	vMonsoonColor = GetFoWColor( PrePos, MudTexture);
	TI = GetTI( vFoWColor );	
	vTIColor = GetTIColor( PrePos, TITexture );
	return ( TI - 0.99f ) * 1000.0f <= 0.0f;
}

float3 CalcNormalForLighting( float3 InputNormal, float3 TerrainNormal )
{
	TerrainNormal = normalize( TerrainNormal );

	//Calculate normal
	float3 zaxis = InputNormal;
	float3 xaxis = cross( zaxis, float3( 0, 0, 1 ) ); //tangent
	xaxis = normalize( xaxis );
	float3 yaxis = cross( xaxis, zaxis ); //bitangent
	yaxis = normalize( yaxis );
	return xaxis * TerrainNormal.x + zaxis * TerrainNormal.y + yaxis * TerrainNormal.z;
}
#endif // PIXEL_SHADER
]]

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT_TERRAIN main( const VS_INPUT_TERRAIN_NOTEXTURE VertexIn )
		{
			VS_OUTPUT_TERRAIN VertexOut;
			
		#ifdef USE_VERTEX_TEXTURE 
			float2 mapPos = VertexIn.position.xy * QuadOffset_Scale_IsDetail.z + QuadOffset_Scale_IsDetail.xy;
			float heightScale = vBorderLookup_HeightScale_UseMultisample_SeasonLerp.y * 255.0;

			VertexOut.uv = float2( ( mapPos.x + 0.5f ) / MAP_SIZE_X,  ( mapPos.y + 0.5f ) / MAP_SIZE_Y );
			VertexOut.uv2.x = ( mapPos.x + 0.5f ) / MAP_SIZE_X;
			VertexOut.uv2.y = ( mapPos.y + 0.5f - MAP_SIZE_Y ) / -MAP_SIZE_Y;
			VertexOut.uv2.xy *= float2( MAP_POW2_X, MAP_POW2_Y ); //POW2

			float2 heightMapUV = VertexOut.uv;
			heightMapUV.y = 1.0 - heightMapUV.y;

		#ifdef PDX_OPENGL
			float vHeight = tex2D( HeightMap, heightMapUV ).x * heightScale;
		#else
			float vHeight = tex2Dlod0( HeightMap, heightMapUV ).x * heightScale;
		#endif // PDX_OPENGL

			VertexOut.prepos = float3( mapPos.x, vHeight, mapPos.y );
			VertexOut.position = mul( ViewProjectionMatrix, float4( VertexOut.prepos, 1.0f ) );
		#else // !USE_VERTEX_TEXTURE
			float2 pos = VertexIn.position.xy * QuadOffset_Scale_IsDetail.z + QuadOffset_Scale_IsDetail.xy;
			float vSatPosZ = saturate( VertexIn.position.z ); // VertexIn.position.z can have a value [0-4], if != 0 then we shall displace vertex
			float vUseAltHeight = vSatPosZ * vSnap[ int( VertexIn.position.z - 1.0f ) ]; // the snap values are set to either 0 or 1 before each draw call to enable/disable snapping due to LOD
			pos += vUseAltHeight
				* float2( 1.0f - VertexIn.position.w, VertexIn.position.w ) // VertexIn.position.w determines offset direction
				* QuadOffset_Scale_IsDetail.z; // and of course we need to scale it to the same LOD

			VertexOut.uv = float2( ( pos.x + 0.5f ) / MAP_SIZE_X,  ( pos.y + 0.5f ) / MAP_SIZE_Y );
			VertexOut.uv2.x = ( pos.x + 0.5f ) / MAP_SIZE_X;
			VertexOut.uv2.y = ( pos.y + 0.5f - MAP_SIZE_Y ) / -MAP_SIZE_Y;	
			VertexOut.uv2.xy *= float2( MAP_POW2_X, MAP_POW2_Y ); //POW2

			float vHeight = VertexIn.height.x * vUseAltHeight - VertexIn.height.x;
			vHeight = VertexIn.height.y * vUseAltHeight - vHeight;

			vHeight *= 0.01f;
			VertexOut.prepos = float3( pos.x, vHeight, pos.y );
			VertexOut.position = mul( ViewProjectionMatrix, float4( VertexOut.prepos, 1.0f ) );
		#endif // USE_VERTEX_TEXTURE

			VertexOut.vShadowProj = mul( ShadowMapTextureMatrix, float4( VertexOut.prepos, 1.0f ) );

			// Output the screen-space texture coordinates
			float fHalfW = VertexOut.position.w * 0.5;
			VertexOut.vScreenCoord.x = ( VertexOut.position.x * 0.5 + fHalfW );
			VertexOut.vScreenCoord.y = ( fHalfW - VertexOut.position.y * 0.5 );
		#ifdef PDX_OPENGL
			VertexOut.vScreenCoord.y = -VertexOut.vScreenCoord.y;
		#endif
			VertexOut.vScreenCoord.z = VertexOut.position.w;
			VertexOut.vScreenCoord.w = VertexOut.position.w;

			return VertexOut;
		}
	]]
}

## Pixel Shaders

PixelShader = 
{
	MainCode PixelShaderUnderwater
	[[
		float4 main( VS_OUTPUT_TERRAIN Input ) : PDX_COLOR
		{
			clip( WATER_HEIGHT - Input.prepos.y + TERRAIN_WATER_CLIP_HEIGHT );
			float3 normal = normalize( tex2D( HeightNormal,Input.uv2 ).rbg - 0.5f );
			float3 diffuseColor = tex2D( TerrainDiffuse, Input.uv2 * float2(( MAP_SIZE_X / 32.0f ), ( MAP_SIZE_Y / 32.0f ) ) ).rgb;
			float3 waterColorTint = tex2D( TerrainColorTint, Input.uv2 ).rgb;
			
			float vMin = 17.0f;
			float vMax = 18.5f;
			float vWaterFog = saturate( 1.0f - ( Input.prepos.y - vMin ) / ( vMax - vMin ) );
			
			diffuseColor = lerp( diffuseColor, waterColorTint, vWaterFog );
			float vFog = saturate( Input.prepos.y * Input.prepos.y * Input.prepos.y * WATER_HEIGHT_RECP_SQUARED * WATER_HEIGHT_RECP );
			float3 vOut = CalculateMapLighting( diffuseColor, normal * vFog );
			
			return float4( vOut, 1.0f );
		}
	]]

	MainCode PixelShaderTerrain
	[[
		float3 ApplyMonsoon( float3 vColor, float3 vPos, inout float3 vNormal, float3 vMudNormal, float4 vFoWColor, float TerrainDiffuseAlpha, float3 vMonsoonDiffuse )
		{
			float vFade = saturate( vPos.y - 18.0f );
			float vNormalFade = saturate( saturate( vNormal.y + 0.9f ) * 10.0f );

			float vNoise = tex2D( FoWDiffuse, ( vPos.xz + 0.5f ) / 100.0f  ).r;
			float FoWDiffuseColor = tex2D( FoWDiffuse, ( vPos.xz + 0.5f ) / 10.0f  ).r;
			
			float vIsMonsoon = lerp( vFoWColor.b, vFoWColor.g, vFoWOpacity_Time.z ) * 0.70;

			vNoise += saturate( vPos.y - 220.0f )*( saturate( (vNormal.y-0.9f) * 1000.0f )*vIsMonsoon );
			vNoise = saturate( vNoise );

			float vHeavy = saturate( saturate( vNoise - ( 1.0f - vIsMonsoon ) ) * 5.0f );
			float vLight = saturate( ( saturate( vNoise + 0.5f ) - ( 1.0f - vIsMonsoon ) ) * 1.4f );

			float vHeightFade = 1.0f - saturate( vPos.y - 24.0f );
			
			float3 vMonsoonColor = vMonsoonDiffuse * ( 0.9f + 0.1f * FoWDiffuseColor);
			float vMonsoonStrength = saturate( vHeavy + vLight ) * vFade * vNormalFade * ( saturate( vIsMonsoon * 2.25f ) ) * vHeightFade * 0.8;
			vColor = lerp( vColor, vMonsoonColor, vMonsoonStrength );
			vNormal = lerp( vNormal, vMudNormal, saturate( vMonsoonStrength * 2.0 ) );
			return vColor;
		}

		float4 main( VS_OUTPUT_TERRAIN Input ) : PDX_COLOR
		{
		#ifndef MAP_IGNORE_CLIP_HEIGHT
			clip( Input.prepos.y + TERRAIN_WATER_CLIP_HEIGHT - WATER_HEIGHT );
		#endif	
			float fTI;
			float4 vFoWColor, vTIColor, vMonsoonColor;	
			if( !GetFoWAndTI( Input.prepos, vFoWColor, vMonsoonColor, fTI, vTIColor ) )
			{
				return float4( vTIColor.rgb, 1.0f );
			}

			float2 vOffsets = float2( -0.5f / MAP_SIZE_X, -0.5f / MAP_SIZE_Y );
			
			float vAllSame;
			float4 IndexU, IndexV;
			calculate_index( tex2D( TerrainIDMap, Input.uv + vOffsets.xy ), IndexU, IndexV, vAllSame );

			float2 vTileRepeat = Input.uv2 * TERRAIN_TILE_FREQ;
			vTileRepeat.x *= MAP_SIZE_X/MAP_SIZE_Y;
			
			float lod = clamp( trunc( mipmapLevel( vTileRepeat ) - 0.5f ), 0.0f, 6.0f );
			float vMipTexels = pow( 2.0f, ATLAS_TEXEL_POW2_EXPONENT - lod );
			float3 vHeightNormalSample = normalize( tex2D( HeightNormal, Input.uv2 ).rbg - 0.5f );
			
			float4 vTerrainSamplePosition = sample_terrain( IndexU.w, IndexV.w, vTileRepeat, vMipTexels, lod, NUM_TILES );
			float4 vTerrainDiffuseSample = tex2Dlod( TerrainDiffuse, vTerrainSamplePosition );

			float4 vMudSamplePosition = sample_terrain( IndexU.w, IndexV.w, vTileRepeat, vMipTexels, lod, 1.0f );
			float4 vMudDiffuseSample = tex2Dlod( MudDiffuse, vMudSamplePosition );
			float4 vMudNormalSamplePosition = sample_terrain( 2.0f, 3.0f, vTileRepeat, vMipTexels, lod, NUM_TILES);

	#ifdef TERRAIN_SHADER
		#ifdef NO_SHADER_TEXTURE_LOD
			float3 vTerrainNormalSample = float3( 0, 1, 0 );
			float3 vMudNormalSample = vTerrainNormalSample;
		#else
			float3 vTerrainNormalSample = tex2Dlod( TerrainNormal, vTerrainSamplePosition ).rbg - 0.5f;
			float3 vMudNormalSample = tex2Dlod( TerrainNormal, vMudNormalSamplePosition ).rgb - 0.5f;
		#endif //NO_SHADER_TEXTURE_LOD
	#endif
		#ifdef COLOR_SHADER
			float4 vColorMapSample = GetProvinceColorSampled( Input.uv, IndirectionMap, ProvinceIndirectionMapSize,
															 ProvinceColorMap, ProvinceColorMapSize, 0 );
		#endif
			
			if ( vAllSame < 1.0f && vBorderLookup_HeightScale_UseMultisample_SeasonLerp.z < 8.0f )
			{
				float4 TerrainSampleX = sample_terrain( IndexU.x, IndexV.x, vTileRepeat, vMipTexels, lod, NUM_TILES );
				float4 TerrainSampleY = sample_terrain( IndexU.y, IndexV.y, vTileRepeat, vMipTexels, lod, NUM_TILES );
				float4 TerrainSampleZ = sample_terrain( IndexU.z, IndexV.z, vTileRepeat, vMipTexels, lod, NUM_TILES );
				float4 ColorRD = tex2Dlod( TerrainDiffuse, TerrainSampleX );
				float4 ColorLU = tex2Dlod( TerrainDiffuse, TerrainSampleY );
				float4 ColorRU = tex2Dlod( TerrainDiffuse, TerrainSampleZ );

				float2 vFracVector = float2( Input.uv.x * MAP_SIZE_X - 0.5f, Input.uv.y * MAP_SIZE_Y - 0.5f );
				float2 vFrac = frac( vFracVector );

				const float vAlphaFactor = 10.0f;
				float4 vTestFrac = float4( vFrac.x, 1.0f - vFrac.x, vFrac.x, 1.0f - vFrac.x );
				float4 vTestRemainder = float4(
					1.0f + ColorLU.a * vAlphaFactor,
					1.0f + ColorRU.a * vAlphaFactor,
					1.0f + vTerrainDiffuseSample.a * vAlphaFactor,
					1.0f + ColorRD.a * vAlphaFactor );
				float4 vTest = vTestFrac * vTestRemainder;
				float2 yWeights = float2( ( vTest.x + vTest.y ) * vFrac.y, ( vTest.z + vTest.w ) * ( 1.0f - vFrac.y ) );
				float3 vBlendFactors = float3( vTest.x / ( vTest.x + vTest.y ),
					vTest.z / ( vTest.z + vTest.w ),
					yWeights.x / ( yWeights.x + yWeights.y ) );
				vTerrainDiffuseSample = lerp(
					lerp( ColorRU, ColorLU, vBlendFactors.x ),
					lerp( ColorRD, vTerrainDiffuseSample, vBlendFactors.y ),
					vBlendFactors.z );

		#ifdef TERRAIN_SHADER
			#ifndef NO_SHADER_TEXTURE_LOD
				float3 terrain_normalRD = tex2Dlod( TerrainNormal, TerrainSampleX ).rbg - 0.5f;
				float3 terrain_normalLU = tex2Dlod( TerrainNormal, TerrainSampleY ).rbg - 0.5f;
				float3 terrain_normalRU = tex2Dlod( TerrainNormal, TerrainSampleZ ).rbg - 0.5f;

				vTerrainNormalSample =
					( ( 1.0f - vBlendFactors.x ) * terrain_normalRU  + vBlendFactors.x * terrain_normalLU ) * ( 1.0f - vBlendFactors.z ) +
					( ( 1.0f - vBlendFactors.y ) * terrain_normalRD + vBlendFactors.y * vTerrainNormalSample ) * vBlendFactors.z;
			#endif
		#endif
			}

			float3 TerrainColor = lerp( tex2D( TerrainColorTint, Input.uv2 ), tex2D( TerrainColorTintSecond, Input.uv2 ), vBorderLookup_HeightScale_UseMultisample_SeasonLerp.w ).rgb;
			float3 vOut;
	#ifdef TERRAIN_SHADER
		#ifdef TERRAIN_AND_COLOR_SHADER
			const float fTestThreshold = 0.82f;
			if( vColorMapSample.a < fTestThreshold )
		#endif
			{
				vHeightNormalSample = CalcNormalForLighting( vHeightNormalSample, vTerrainNormalSample );

				vTerrainDiffuseSample.rgb = GetOverlay( vTerrainDiffuseSample.rgb, TerrainColor, 0.75f );
				vTerrainDiffuseSample.rgb = ApplySnow( vTerrainDiffuseSample.rgb, Input.prepos, vHeightNormalSample, vFoWColor, FoWDiffuse );
				vTerrainDiffuseSample.rgb = ApplyMonsoon( vTerrainDiffuseSample.rgb, Input.prepos, vHeightNormalSample, vMudNormalSample, vMonsoonColor, vTerrainDiffuseSample.a, vMudDiffuseSample.rgb );
				vTerrainDiffuseSample.rgb = calculate_secondary_compressed( Input.uv, vTerrainDiffuseSample.rgb, Input.prepos.xz );

				vOut = CalculateMapLighting( vTerrainDiffuseSample.rgb, vHeightNormalSample );
			}
	#endif	// end TERRAIN_SHADER
	#ifdef COLOR_SHADER
		#ifdef TERRAIN_AND_COLOR_SHADER
			else
		#endif
			{
				vTerrainDiffuseSample.rgb = GetOverlay( vTerrainDiffuseSample.rgb, TerrainColor, 0.5f );

				float2 vBlend = float2( 0.4f, 0.45f );
				vOut = ( dot( vTerrainDiffuseSample.rgb, GREYIFY ) * vBlend.x + vColorMapSample.rgb * vBlend.y );
				vOut = CalculateMapLighting( vOut, vHeightNormalSample );
				vOut = calculate_secondary( Input.uv, vOut, Input.prepos.xz );
			}
	#endif	// end COLOR_SHADER

			// Grab the shadow term
			float fShadowTerm = GetShadowScaled( SHADOW_WEIGHT_MAP, Input.vScreenCoord, ShadowMap );
			vOut *= fShadowTerm;

			vOut = ApplyDistanceFog( vOut, Input.prepos, vFoWColor, FoWDiffuse );
			return float4( lerp( ComposeSpecular( vOut, 0.0f ), vTIColor.rgb, fTI ), 1.0f );
		}
	]]

	MainCode PixelShaderTerrainUnlit
	[[
		float4 main( VS_OUTPUT_TERRAIN Input ) : PDX_COLOR
		{
			// Grab the shadow term
			float fShadowTerm = CalculateShadow( Input.vShadowProj, ShadowMap );
			return float4( fShadowTerm, fShadowTerm, fShadowTerm, 1.0f );
		}
	]]
}


## Blend States

BlendState BlendState
{
	AlphaTest = no
	BlendEnable = no
	WriteMask = "RED|GREEN|BLUE|ALPHA"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect terrainunlit
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderTerrainUnlit"
}

Effect terrain
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderTerrain"
}

Effect underwater
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderUnderwater"
}
