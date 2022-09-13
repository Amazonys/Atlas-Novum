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
		Specular = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs


VertexStruct VS_INPUT
{
    float2 position			: POSITION;
};


VertexStruct VS_OUTPUT_BLOOM
{
    float4 position			: PDX_POSITION;
	float2 uvBloom			: TEXCOORD1;
	float4 uvBloom2_0		: TEXCOORD2;
	float4 uvBloom2_1		: TEXCOORD3;
	float4 uvBloom2_2		: TEXCOORD4;
};


## Constant Buffers



## Shared Code

Code
[[
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
			VertexOut.position = float4( VertexIn.position, 0.0f, 1.0f );
			VertexOut.uvBloom = ( VertexIn.position + 1.0f ) * 0.5f;
			VertexOut.uvBloom.y = 1.0f - VertexOut.uvBloom.y;
			VertexOut.position.xy += float2( -0.5f / vBloomSize.x, 0.5f / vBloomSize.y );
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
			return float4( SampleBloom( Specular, Input ), 1.0f );
		}
	]]

}


## Blend States

BlendState BlendState
{
	BlendEnable = no
	AlphaTest = no
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect bloom
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}