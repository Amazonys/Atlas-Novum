## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4 	Season;
	float4	SeasonHSVNorth;
	float4	SeasonHSVCenter;
	float4	SeasonHSVSouth;	
	float4	SeasonColorBalanceNorth;
	float4	SeasonColorBalanceCenter;
	float4	SeasonColorBalanceSouth;	
	float4 	vWindowSize_Axis;
	float2 	vBloomSize;
}

## Shared Code

Code
[[
static const float vSamples = 3.0f;
static const float4 vWeights = float4( 55.0f, 12.0f, 1.0f, 90.0f );
]]
