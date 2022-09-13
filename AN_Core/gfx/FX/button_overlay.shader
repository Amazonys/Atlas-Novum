## Includes

Includes = {

}


## Samplers

PixelShader =
{
	Samplers =
	{
		MapTexture =
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

VertexStruct VS_INPUT
{
	float3 vPosition  : POSITION;
	float2 vTexCoord  : TEXCOORD0;
};


VertexStruct VS_OUTPUT
{
	float4  vPosition : PDX_POSITION;
	float2  vTexCoord : TEXCOORD0;
};


## Constant Buffers

ConstantBuffer( 0, 0 )
{
	float4x4 WorldViewProjectionMatrix;
	float4 Color;
	float2 Offset;
	float2 NextOffset;
	float Time;
	float AnimationTime;
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
		    Out.vPosition  = mul( WorldViewProjectionMatrix, float4( v.vPosition.xyz, 1 ) );
		    Out.vTexCoord  = v.vTexCoord;
			Out.vTexCoord += Offset;
		    return Out;
		}
	]]

}


## Pixel Shaders

PixelShader =
{
	MainCode PixelShaderDisable
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( MapTexture, v.vTexCoord );
            float4 Transparent = float4( 1, 1, 1, 0);
			OutColor *= Transparent;
			return OutColor;
		}
	]]

	MainCode PixelShaderOver
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( MapTexture, v.vTexCoord );
		    float4 Transparent = float4( 1, 1, 1, 0.15 );
			OutColor *= Transparent;
		    return OutColor;
		}
	]]

	MainCode PixelShaderUp
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( MapTexture, v.vTexCoord );
            float4 Transparent = float4( 1, 1, 1, 0);
			OutColor *= Transparent;
			return OutColor;
		}
	]]

	MainCode PixelShaderDown
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float4 OutColor = tex2D( MapTexture, v.vTexCoord );
			float4 Transparent = float4( 0, 0, 0, 0.2 );
			OutColor *= Transparent;
			return OutColor;
		}
	]]

}


## Blend States

BlendState BlendState
{
	SourceBlend = "src_alpha"
	AlphaTest = no
	BlendEnable = yes
	DestBlend = "inv_src_alpha"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect Disable
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderDisable"
}

Effect Down
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderDown"
}

Effect Over
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderOver"
}

Effect Up
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderUp"
}

Effect GreyedDown
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderDisable"
}

Effect GreyedOver
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderDisable"
}

Effect GreyedUp
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderDisable"
}