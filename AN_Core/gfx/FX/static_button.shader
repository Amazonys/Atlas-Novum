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
			AddressV = "Wrap"
			MagFilter = "Point"
			AddressU = "Wrap"
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
float4x4 WorldViewProjectionMatrix	;
float4 Color 						;
float vXOffset						;	// For textures with more than one frame
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
	MainCode PixelShaderUp
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
	PixelShader = "PixelShaderUp"
}

Effect Down
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderUp"
}

Effect Over
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderUp"
}

Effect Up
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderUp"
}