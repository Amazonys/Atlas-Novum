## Includes

Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"posteffect_base.fxh"
}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		MainScene = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		RestoreBloom = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs


VertexStruct VS_INPUT
{
    float4 position			: POSITION;
};


VertexStruct VS_OUTPUT_BLOOM
{
    float4 position			: PDX_POSITION;
	float2 uv				: TEXCOORD0;
	float2 uvBloom			: TEXCOORD1;
	float4 uvBloom2_0		: TEXCOORD2;
	float4 uvBloom2_1		: TEXCOORD3;
	float4 uvBloom2_2		: TEXCOORD4;
	float vSeasonValue		: TEXCOORD5;
};


## Constant Buffers



## Shared Code

Code
[[
static const float2 LevelValue = float2( 0.04f, 0.8f );    // First: DARKNESS 0.0 Normal, the higher the darker   Second: Brightness, Lower = brighter

float4 RestoreScene( VS_OUTPUT_BLOOM Input, float3 color )
{
	float vUseNorth = saturate( Input.vSeasonValue * 1000.0f );
	
	float3 vSeasonValueHSV = ( vUseNorth * SeasonHSVNorth.rgb ) + ( (1.0f-vUseNorth) * SeasonHSVSouth.rgb );
	
	float3 vSeason = lerp( SeasonHSVCenter.rgb, vSeasonValueHSV, saturate( abs( Input.vSeasonValue ) ) );
	
	float3 HSV = RGBtoHSV( color.rgb );
	HSV.yz *= vSeason.yz;
	HSV.x += vSeason.x;
	HSV.x = mod( HSV.x, 6.0 );
	color = HSVtoRGB( HSV );

	float3 vSeasonValueColor = ( vUseNorth * SeasonColorBalanceNorth.rgb ) + ( (1.0f-vUseNorth) * SeasonColorBalanceSouth.rgb );
	float3 ColorBalanceSeason = lerp( SeasonColorBalanceCenter.rgb, vSeasonValueColor, saturate( abs( Input.vSeasonValue ) ) );
	
	color = saturate( color * ColorBalanceSeason );

	color = Levels( color, LevelValue.x, LevelValue.y );

	return float4( color, 1.0f );
}

float3 SampleBloom( in sampler2D InSampler, in VS_OUTPUT_BLOOM Input )
{
	float3 color = tex2D( InSampler, Input.uvBloom ).rgb * vWeights[3];

	color += vWeights[0] 
			* ( tex2D( InSampler, Input.uvBloom2_0.xy ).rgb
				+ tex2D( InSampler, Input.uvBloom2_0.zw ).rgb );
	color += vWeights[1] 
			* ( tex2D( InSampler, Input.uvBloom2_1.xy ).rgb
				+ tex2D( InSampler, Input.uvBloom2_1.zw ).rgb );
	color += vWeights[2] 
			* ( tex2D( InSampler, Input.uvBloom2_2.xy ).rgb
				+ tex2D( InSampler, Input.uvBloom2_2.zw ).rgb );
	
	color /= vWeights[3] + 2.0f * vWeights[0] + 2.0f * vWeights[1] + 2.0f * vWeights[2];
	return color;
}
]]


## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT_BLOOM main( const VS_INPUT VertexIn )
		{
			VS_OUTPUT_BLOOM VertexOut;
			VertexOut.position = float4( VertexIn.position.x, FLIP_SCREEN_POS( VertexIn.position.y ), 0.0f, 1.0f );
			VertexOut.uv = ( VertexIn.position.xy + 1.0f ) * 0.5f;
			VertexOut.uv.y = 1.0f - VertexOut.uv.y;
			VertexOut.uvBloom = VertexOut.uv;

			//For some reason we are one pixel off. The half pixel offset of dx9 makes it a little more confusing

#ifdef PDX_DIRECTX_9
			VertexOut.position.xy += float2( -1.0f / vWindowSize_Axis.x, 1.0f / vWindowSize_Axis.y );
#else
			VertexOut.position.xy += float2( -0.5f / vWindowSize_Axis.x, 0.5f / vWindowSize_Axis.y );
#endif			
			
			float vAxis = vWindowSize_Axis.z;
			float2 vAxisOffset = ( 0.5f / vBloomSize ) * float2( vAxis, 1.0f - vAxis );
			float vStepFactor = 2.0f;
			VertexOut.uvBloom2_0 = float4( 
					VertexOut.uvBloom + float(0+1) * vAxisOffset * vStepFactor, 
					VertexOut.uvBloom - float(0+1) * vAxisOffset * vStepFactor );
			VertexOut.uvBloom2_1 = float4( 
					VertexOut.uvBloom + float(1+1) * vAxisOffset * vStepFactor, 
					VertexOut.uvBloom - float(1+1) * vAxisOffset * vStepFactor );
			VertexOut.uvBloom2_2 = float4( 
					VertexOut.uvBloom + float(2+1) * vAxisOffset * vStepFactor, 
					VertexOut.uvBloom - float(2+1) * vAxisOffset * vStepFactor );	
				
			VertexOut.vSeasonValue = Season[int(VertexIn.position.z)];
			
			return VertexOut;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT_BLOOM Input ) : PDX_COLOR
		{
			float3 color = saturate( tex2D( MainScene, Input.uv ).rgb );
			return RestoreScene( Input, color );
		}
	]]

	MainCode PixelShaderBloom
	[[
		float4 main( VS_OUTPUT_BLOOM Input ) : PDX_COLOR
		{	
			float3 color = saturate( tex2D( MainScene, Input.uv ).rgb );
			float3 bloom = SampleBloom( RestoreBloom, Input );
			float maxVal = max( max( bloom.r, bloom.g ), bloom.b );
			float factor = saturate( maxVal - 0.5f ) * 0.8f;
			float3 res = color + bloom * factor;
			return RestoreScene( Input, res );
		}
	]]

}


## Blend States

BlendState BlendState
{
	AlphaTest = no
	WriteMask = "RED GREEN BLUE"
	BlendEnable = no
}

## Rasterizer States

RasterizerState RasterizerState
{
	FrontCCW = no
	CullMode = "none"
	FillMode = "FILL_SOLID"
}

## Depth Stencil States

## Effects

Effect Restore
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect RestoreBloom
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderBloom"
}