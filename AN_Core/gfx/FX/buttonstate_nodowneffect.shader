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
	float vXOffset;	// For textures with more than one frame
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
			Out.vTexCoord.x += vXOffset;
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
		    float Grey = dot( OutColor.rgb, float3( 0.212671f, 0.715160f, 0.072169f ) ); 
		    OutColor.rgb = float3(Grey, Grey, Grey);
			OutColor *= Color;
		    return OutColor;
		}
	]]

	MainCode PixelShaderOver
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( MapTexture, v.vTexCoord );
		    float4 MixColor = float4( 0.1, 0.1, 0.1, 0 );
		    OutColor += MixColor;
			OutColor *= Color;
		    return OutColor;
		}
	]]

	MainCode PixelShaderUp
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( MapTexture, v.vTexCoord );
			OutColor *= Color;
			return OutColor;
		}
	]]

	MainCode PixelShaderDown
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float4 OutColor = tex2D( MapTexture, v.vTexCoord );
			OutColor *= Color;
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