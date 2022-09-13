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
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 0
			MipFilter = "None"
			MinFilter = "Linear"
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

		EmblemTexture = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Clamp"
			Index = 2
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		SealMaskTexture = 
		{
			AddressV = "Clamp"
			MagFilter = "Point"
			AddressU = "Clamp"
			Index = 3
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
	float2  vTexCoord2 : TEXCOORD2;
};



VertexStruct VS_OUTPUT_FRAME
{
    float4  vPosition : PDX_POSITION;
    float2  vTexCoord0 : TEXCOORD0;
};



## Constant Buffers

ConstantBuffer( 0, 0 )
{
float4x4 WorldViewProjectionMatrix	; 
float4	 FlagCoords					;
float4	 EmblemTemplateCoords		;
float4	 EmblemCoords				;
float4	Color1						;
float4	Color2						;
float4	Color3						;
float2	Over_Alpha					;
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode GeneralVertexShaderFrame
	[[
		VS_OUTPUT_FRAME main(const VS_INPUT v )
		{
			VS_OUTPUT_FRAME Out;
			Out.vPosition  = mul( WorldViewProjectionMatrix, v.vPosition );
			Out.vTexCoord0 = v.vTexCoord;
			return Out;
		}
	]]

	MainCode GeneralVertexShader
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
			VS_OUTPUT Out;
			Out.vPosition  = mul( WorldViewProjectionMatrix, v.vPosition );
			Out.vTexCoord1 = v.vMaskCoord;
			Out.vTexCoord0.x = v.vTexCoord.x / FlagCoords.x + FlagCoords.z;
			Out.vTexCoord0.y = v.vTexCoord.y / FlagCoords.y + FlagCoords.w;
			
			Out.vTexCoord2.x = (v.vTexCoord.x - EmblemTemplateCoords.x) / (EmblemTemplateCoords.z * EmblemCoords.y) + EmblemCoords.x / EmblemCoords.y;
			Out.vTexCoord2.y = (v.vTexCoord.y - EmblemTemplateCoords.y) / (EmblemTemplateCoords.w * EmblemCoords.w) + EmblemCoords.z / EmblemCoords.w ;
			
			return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode GeneralPixelShader
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
			float4 EmblemColor = tex2D( EmblemTexture, v.vTexCoord2.xy );
			float MaskColor = tex2D( MaskTexture, v.vTexCoord1.xy ).r;
			OutColor = lerp( OutColor, EmblemColor, EmblemColor.a );
			OutColor.a = MaskColor * Over_Alpha.y;
			return OutColor;
		}
	]]

	MainCode GeneralPixelShaderColorSeal
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float2 vEmb = v.vTexCoord2.xy;
			vEmb.x = clamp(v.vTexCoord2.x, EmblemCoords.x / EmblemCoords.y, (EmblemCoords.x + 1) / EmblemCoords.y );
			//vEmb.y = clamp(v.vTexCoord2.y, EmblemCoords.z / EmblemCoords.w, (EmblemCoords.z + 1) / EmblemCoords.w );
			
			float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
			float4 EmblemColor = tex2D( EmblemTexture, vEmb );
			float MaskColor = tex2D( MaskTexture, v.vTexCoord1.xy ).r;
			float SealMaskColor = tex2D( SealMaskTexture, v.vTexCoord1.xy ).a;
			OutColor = OutColor.r * Color1 + OutColor.g * Color2 + OutColor.b * Color3;
			OutColor = lerp( OutColor, EmblemColor, EmblemColor.a );
			
			OutColor -= tex2D( BaseTexture, v.vTexCoord0.xy-0.0009)*2.7f;
			OutColor += tex2D( BaseTexture, v.vTexCoord0.xy+0.0009)*2.7f;
			float vC = ( ( OutColor.r*0.212671+OutColor.g*0.715160+OutColor.b*0.072169)/3.0f );
			OutColor.rgb = float3(vC, vC, vC);
			OutColor.rgb *= float3( 3.0f, 1.0f, 1.0f );
			
			OutColor.a = MaskColor * Over_Alpha.y * SealMaskColor;
			OutColor += Over_Alpha.x * float4( 0.1, 0.1, 0.1, 0.0 );
			return OutColor;
		}
	]]

	MainCode GeneralPixelShaderColor
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float2 vEmb = v.vTexCoord2.xy;
			vEmb.x = clamp(v.vTexCoord2.x, EmblemCoords.x / EmblemCoords.y, (EmblemCoords.x + 1) / EmblemCoords.y );
			//vEmb.y = clamp(v.vTexCoord2.y, EmblemCoords.z / EmblemCoords.w, (EmblemCoords.z + 1) / EmblemCoords.w );
			
			float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
			float4 EmblemColor = tex2D( EmblemTexture, vEmb );
			float MaskColor = tex2D( MaskTexture, v.vTexCoord1.xy ).r;
			OutColor = OutColor.r * Color1 + OutColor.g * Color2 + OutColor.b * Color3;
			OutColor = lerp( OutColor, EmblemColor, EmblemColor.a );
			
			OutColor.a = MaskColor * Over_Alpha.y;
			OutColor += Over_Alpha.x * float4( 0.1, 0.1, 0.1, 0.0 );
			return OutColor;
		}
	]]

	MainCode GeneralPixelShaderFrame
	[[
		float4 main( VS_OUTPUT_FRAME v ) : PDX_COLOR
		{
			float4 OutColor = tex2D( BaseTexture, v.vTexCoord0.xy );
			
			OutColor.a *= Over_Alpha.y;
			OutColor += Over_Alpha.x * float4( 0.1, 0.1, 0.1, 0.0 );
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

Effect Seal
{
	VertexShader = "GeneralVertexShader"
	PixelShader = "GeneralPixelShaderColorSeal"
}

Effect Color
{
	VertexShader = "GeneralVertexShader"
	PixelShader = "GeneralPixelShaderColor"
}

Effect Standard
{
	VertexShader = "GeneralVertexShader"
	PixelShader = "GeneralPixelShader"
}

Effect Frame
{
	VertexShader = "GeneralVertexShaderFrame"
	PixelShader = "GeneralPixelShaderFrame"
}