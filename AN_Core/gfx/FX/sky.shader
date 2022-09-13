## Includes

Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		ReflectionCubeMap = 
		{
			AddressV = "Mirror"
			MagFilter = "Linear"
			Type = "Cube"
			AddressU = "Mirror"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs


VertexStruct VS_INPUT_SKY
{
    float2 position			: POSITION;
};


VertexStruct VS_OUTPUT_SKY
{
    float4 position	: PDX_POSITION;
	float3 pos		: TEXCOORD0;
};


## Constant Buffers



## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT_SKY main( const VS_INPUT_SKY VertexIn )
		{
			VS_OUTPUT_SKY VertexOut;
			VertexOut.position = float4( VertexIn.position, 1.0f, 1.0f );
			float4 position = mul( InvViewProjMatrix, VertexOut.position );
			position.xyz /= position.w;
			VertexOut.pos = position.xyz;
			return VertexOut;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT_SKY Input ) : PDX_COLOR
		{
			float3 color = texCUBE( ReflectionCubeMap, normalize( Input.pos - vCamPos ) ).rgb;
			float3 fog = ApplyDistanceFog( color.rgb, Input.pos );
			color = lerp( fog, color, saturate( Input.pos.y / 300.0f ) );
			return float4( ComposeSpecular( color, 0.0f ), 1.0f );
		}
	]]

}


## Blend States

BlendState BlendState
{
	AlphaTest = no
	BlendEnable = no
	WriteMask = "RED"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect sky
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}