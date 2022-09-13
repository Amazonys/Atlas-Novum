## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4x4	ShadowMapTextureMatrix;
	float4		QuadOffset_Scale_IsDetail;
	float4		vSnap;
	float4		vBorderLookup_HeightScale_UseMultisample_SeasonLerp;
	float2		ProvinceIndirectionMapSize;
	float2		ProvinceColorMapSize;
}

## Shared Code

Code
[[
const static float WATER_HEIGHT = 19.0f;
const static float WATER_HEIGHT_RECP = 1.0f / WATER_HEIGHT;
const static float WATER_HEIGHT_RECP_SQUARED = WATER_HEIGHT_RECP * WATER_HEIGHT_RECP;
const static float vTimeScale = 0.5f / 300.0f;
]]
