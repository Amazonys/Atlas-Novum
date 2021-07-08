## Includes

Includes = {

}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		BaseTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Point"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "None"
			MinFilter = "Point"
		}

		MaskTexture = 
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
    float2 vMaskCoord  : TEXCOORD1;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition : PDX_POSITION;
    float2  vTexCoord0 : TEXCOORD0;
    float2  vTexCoord1 : TEXCOORD1;
};


## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4x4 WorldViewProjectionMatrix; 
	float4	 FlagCoords;
	float4	 FlagSize;
	float4   ColonialColor;
	float    ColonialCutoff;
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
			Out.vTexCoord1 = v.vMaskCoord;
			Out.vTexCoord0.x = v.vTexCoord.x/FlagCoords.x;
			Out.vTexCoord0.x = Out.vTexCoord0.x + FlagCoords.z;
			Out.vTexCoord0.y = v.vTexCoord.y/FlagCoords.y;
			Out.vTexCoord0.y = Out.vTexCoord0.y + FlagCoords.w;
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
		    float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
		    float4 MaskColor = tex2D( MaskTexture, v.vTexCoord1.xy );
			
			if( v.vTexCoord0.x > ColonialCutoff )
				OutColor = ColonialColor;
			
		    float Grey = dot( OutColor.rgb, float3( 0.212671f, 0.715160f, 0.072169f ) ); 
		    
		    OutColor.rgb = float3(Grey,Grey,Grey);
		    OutColor.a = MaskColor.a;
		    
		    return OutColor;
		}
	]]

	MainCode PixelShaderOver
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
		    float4 MaskColor = tex2D( MaskTexture, v.vTexCoord1.xy );
		    float4 MixColor = float4( 0.1, 0.1, 0.1, 0 );
			
			if( v.vTexCoord0.x > ColonialCutoff )
				OutColor = ColonialColor;
			
		    OutColor.a = MaskColor.a;
		    OutColor += MixColor;
		    
		    return OutColor;
		}
	]]

	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord1.xy );
			
			if( v.vTexCoord0.x > ColonialCutoff )
				OutColor = ColonialColor;
			
			OutColor.a = MaskColor.a;
			
			return OutColor;
		}
	]]

	MainCode PixelShaderDown
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
		    float4 MaskColor = tex2D( MaskTexture, v.vTexCoord1.xy );
			if( v.vTexCoord0.x > ColonialCutoff )
				OutColor = ColonialColor;
				
		    float Grey = dot( OutColor.rgb, float3( 0.212671f, 0.715160f, 0.072169f ) ); 
		    OutColor.rgb = float3(Grey,Grey,Grey);
		    OutColor.a = MaskColor.a;
		    
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
	PixelShader = "PixelShader"
}