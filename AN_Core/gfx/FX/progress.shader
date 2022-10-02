## Includes

Includes = {

}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		TextureOne = 
		{
			AddressV = "Wrap"
			MagFilter = "Point"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "None"
			MinFilter = "Point"
		}

		TextureTwo = 
		{
			AddressV = "Wrap"
			MagFilter = "Point"
			AddressU = "Wrap"
			Index = 1
			MipFilter = "None"
			MinFilter = "Point"
		}


	}
}


## Vertex Structs

VertexStruct VS_INPUT
{
    float4 vPosition  : POSITION;
    float2 vTexCoord  : TEXCOORD0;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition : PDX_POSITION;
    float2  vTexCoord0 : TEXCOORD0;
};



## Constant Buffers

ConstantBuffer( 0, 0 )
{
	float4x4 WorldViewProjectionMatrix; 
	float4 vFirstColor;
	float4 vSecondColor;
	float CurrentState;
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
			VS_OUTPUT Out;
		   	Out.vPosition  = mul( WorldViewProjectionMatrix, v.vPosition );
			Out.vTexCoord0  = v.vTexCoord;
			Out.vTexCoord0.y = -Out.vTexCoord0.y;
			return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelTexture
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			return v.vTexCoord0.x <= CurrentState ? tex2D( TextureOne, v.vTexCoord0.xy ) : tex2D( TextureTwo, v.vTexCoord0.xy );
		}
	]]

	MainCode PixelColor
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			return v.vTexCoord0.x <= CurrentState ? vFirstColor : vSecondColor;
		}
	]]

	MainCode PixelTextureVertical
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			return -v.vTexCoord0.y <= CurrentState ? tex2D( TextureOne, v.vTexCoord0.xy ) : tex2D( TextureTwo, v.vTexCoord0.xy );
		}
	]]

	MainCode PixelColorVertical
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			return -v.vTexCoord0.y <= CurrentState ? vFirstColor : vSecondColor;
		}
	]]
}


## Blend States

BlendState BlendState
{
	SourceBlend = "SRC_ALPHA"
	AlphaTest = yes
	BlendEnable = yes
	DestBlend = "INV_SRC_ALPHA"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect Color
{
	VertexShader = "VertexShader"
	PixelShader = "PixelColor"
}

Effect Texture
{
	VertexShader = "VertexShader"
	PixelShader = "PixelTexture"
}

Effect ColorVertical
{
	VertexShader = "VertexShader"
	PixelShader = "PixelColorVertical"
}

Effect TextureVertical
{
	VertexShader = "VertexShader"
	PixelShader = "PixelTextureVertical"
}