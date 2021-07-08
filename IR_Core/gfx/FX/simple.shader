## Includes

Includes = {

}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		SimpleTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs

VertexStruct VS_INPUT
{
    float4 vPosition  : POSITION;
    float2 vTexCoord  : TEXCOORD0;
	float4 vColor	  : PDX_COLOR;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition : PDX_POSITION;
    float2  vTexCoord : TEXCOORD0;
	float4  vColor	  : TEXCOORD1;
};


## Constant Buffers

ConstantBuffer( 0, 0 )
{
	float4x4 Matrix;//			: register( c0 );
}

## Shared Code

Code
[[
/*
	In glsl:
	
	uniform float4 UNIFORM0[ 4 ];
	#define Matrix mat4( UNIFORM[0], UNIFORM[1], UNIFORM[2], UNIFORM[3] )
	
	In hlsl
	
	float4x4 Matrix : register( c0 );
*/
]]


## Vertex Shaders

VertexShader = 
{
	MainCode VertexShaderSimple
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
		    VS_OUTPUT Out;
		    Out.vPosition  	= mul( Matrix, v.vPosition );
			
		    Out.vTexCoord  	= v.vTexCoord;
			
			Out.vColor		= v.vColor;
		    return Out;
		}
	]]

	MainCode VertexShaderSimple3D
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
		    VS_OUTPUT Out;
		    Out.vPosition  	= mul( Matrix, v.vPosition );
			
		    Out.vTexCoord  	= v.vTexCoord;
			
			Out.vColor		= v.vColor;
		    return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShaderSimple
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( SimpleTexture, v.vTexCoord );
			OutColor = OutColor * v.vColor;
		    return OutColor;
		}
	]]

}


## Blend States

BlendState BlendState
{
	SourceBlend = "SRC_ALPHA"
	AlphaTest = no
	BlendEnable = yes
	DestBlend = "INV_SRC_ALPHA"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect Simple3D
{
	VertexShader = "VertexShaderSimple3D"
	PixelShader = "PixelShaderSimple"
}

Effect Simple
{
	VertexShader = "VertexShaderSimple"
	PixelShader = "PixelShaderSimple"
}