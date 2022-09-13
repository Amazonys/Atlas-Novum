## Includes

Includes = {
	"posteffect_base.fxh"
	"constants.fxh"
	"standardfuncsgfx.fxh"
}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		MainScene = 
		{
			AddressV = "Clamp"
			MagFilter = "Point"
			AddressU = "Clamp"
			Index = 0
			MipFilter = "None"
			MinFilter = "Point"
		}


	}
}


## Vertex Structs


VertexStruct VS_OUTPUT_DOWNSAMPLE
{
    float4 position			: PDX_POSITION;
	float2 uv				: TEXCOORD0;
};




VertexStruct VS_INPUT
{
    float2 position			: POSITION;
};


## Constant Buffers



## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT_DOWNSAMPLE main( const VS_INPUT VertexIn )
		{
			VS_OUTPUT_DOWNSAMPLE VertexOut;
			VertexOut.position = float4( VertexIn.position, 0.0f, 1.0f );
			
			VertexOut.uv = ( VertexIn.position + 1.0f ) * 0.5f;
			VertexOut.uv.y = 1.0f - VertexOut.uv.y;
			VertexOut.uv.xy += 0.5f / vBloomSize;
			
			VertexOut.position.xy += float2( -0.5f / vBloomSize.x, 0.5f / vBloomSize.y );
			return VertexOut;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT_DOWNSAMPLE Input ) : PDX_COLOR
		{
			return tex2D( MainScene, Input.uv );
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

Effect downsample
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}