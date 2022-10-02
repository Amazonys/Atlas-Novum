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
			AddressV = "Clamp"
			MagFilter = "Point"
			AddressU = "Clamp"
			Index = 0
			MipFilter = "None"
			MinFilter = "Point"
		}

		MaskTexture = 
		{
			AddressV = "Clamp"
			MagFilter = "Point"
			AddressU = "Clamp"
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
    float4 vTexCoord  : TEXCOORD0;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition : PDX_POSITION;
    float4  vTexCoord : TEXCOORD0;
};


## Constant Buffers

ConstantBuffer( 0, 0 )
{
	float4x4 WorldViewProjectionMatrix; 
	float4	 Color;
	float4	 FlagCoords;
	float4	 FlagSize;
	float4   CustomColor0;
	float4   CustomColor1;
	float4   CustomColor2;
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
			Out.vTexCoord.zw = v.vTexCoord.zw;
			Out.vTexCoord.xy = v.vTexCoord.xy / FlagCoords.xy;
			Out.vTexCoord.xy -= ( v.vTexCoord.xy / FlagSize.xy );
			Out.vTexCoord.xy += FlagCoords.zw + ( 0.5 / FlagSize.xy );
			
			return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );

			if( v.vTexCoord.z > ColonialCutoff ) {
				OutColor = ColonialColor;		
			}

			OutColor.a = MaskColor.a;
			OutColor *= Color;
			return OutColor;
		}
	]]

	MainCode PixelShaderOver
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );

			if( v.vTexCoord.z > ColonialCutoff ) {
				OutColor = ColonialColor;		
			}

			OutColor.a = MaskColor.a;
			OutColor.rgb += float3(0.1, 0.1, 0.1);
			OutColor *= Color;	
			return OutColor;
		}
	]]	

	MainCode PixelShaderDown
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );

			if( v.vTexCoord.z > ColonialCutoff ) {
				OutColor = ColonialColor;		
			}

			OutColor.a = MaskColor.a;
			OutColor.rgb -= float3(0.1, 0.1, 0.1);
			OutColor *= Color;
			return OutColor;
		}
	]]	

	MainCode PixelShaderDisable
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );

			if( v.vTexCoord.z > ColonialCutoff ) {
				OutColor = ColonialColor;		
			}

			float Grey = dot( OutColor.rgb, float3( 0.212671f, 0.715160f, 0.072169f ) ); 

			OutColor.a = MaskColor.a;
			OutColor.rgb = float3(Grey, Grey, Grey);
			OutColor *= Color;
			return OutColor;
		}
	]]

	MainCode PixelShaderCustomFlag
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
			if( v.vTexCoord.z > ColonialCutoff )
			{
				OutColor = ColonialColor;
			}
			else 
			{
				OutColor = OutColor.r * CustomColor0 + OutColor.g * CustomColor1 + OutColor.b * CustomColor2;	
			}
			OutColor.a = MaskColor.a;
			OutColor *= Color;
			return OutColor;
		}
	]] 

	MainCode PixelShaderOverCustomFlag
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
			if( v.vTexCoord.z > ColonialCutoff )
			{
				OutColor = ColonialColor;
			}
			else 
			{
				OutColor = OutColor.r * CustomColor0 + OutColor.g * CustomColor1 + OutColor.b * CustomColor2;	
			}
			OutColor.a = MaskColor.a;
			OutColor.rgb += float3(0.1, 0.1, 0.1);
			OutColor *= Color;
			return OutColor;
		}
	]]

	MainCode PixelShaderDownCustomFlag
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
			if( v.vTexCoord.z > ColonialCutoff )
			{
				OutColor = ColonialColor;
			}
			else
			{
				OutColor = OutColor.r * CustomColor0 + OutColor.g * CustomColor1 + OutColor.b * CustomColor2;	
			}
			OutColor.a = MaskColor.a;
			OutColor.rgb -= float3(0.1, 0.1, 0.1);
			OutColor *= Color;
			return OutColor;
		}
	]]

	MainCode PixelShaderDisableCustomFlag
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
			if( v.vTexCoord.z > ColonialCutoff )
			{
				OutColor = ColonialColor;
			}
			else 
			{
				OutColor = OutColor.r * CustomColor0 + OutColor.g * CustomColor1 + OutColor.b * CustomColor2;	
			}
			OutColor.a = MaskColor.a;
			float Grey = dot( OutColor.rgb, float3( 0.212671f, 0.715160f, 0.072169f ) ); 
			OutColor.rgb = float3(Grey, Grey, Grey);
			OutColor *= Color;
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

Effect UpCustomFlag
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderCustomFlag"
}

Effect DownCustomFlag
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderDownCustomFlag"
}

Effect DisableCustomFlag 
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderDisableCustomFlag"
}

Effect OverCustomFlag 
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderOverCustomFlag"
}
