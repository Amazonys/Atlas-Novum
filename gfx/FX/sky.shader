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
			VertexOut.pos = VertexOut.position.xyz;
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
			return float4(1.0f,1.0f,1.0f,1.0f);
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