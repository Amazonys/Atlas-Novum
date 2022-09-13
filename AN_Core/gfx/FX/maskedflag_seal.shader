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
	float4	 FlagCoords;
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
			Out.vTexCoord.xy = v.vTexCoord.xy/FlagCoords.xy;
			Out.vTexCoord.xy += FlagCoords.zw;
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
		    float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
		    float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
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
		    float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			OutColor -= tex2D( BaseTexture, v.vTexCoord.xy-0.0009)*2.7f;
			OutColor += tex2D( BaseTexture, v.vTexCoord.xy+0.0009)*2.7f;
			float vC = ( ( OutColor.r*0.212671+OutColor.g*0.715160+OutColor.b*0.072169)/3.0f );
			OutColor.rgb = float3(vC,vC,vC);
			vC = ( dot( OutColor.rgb, float3( 1.0f, 0.2f, 0.2f ) ) );
			OutColor = float4(vC, vC, vC, vC);
		    float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
		    float4 MixColor = float4( 0.1, 0.1, 0.1, 0 );
		    OutColor.a = MaskColor.a;
		    OutColor += MixColor;
		    
		    return OutColor;
		}
	]]

	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		 	float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			OutColor -= tex2D( BaseTexture, v.vTexCoord.xy-0.0009)*2.7f;
			OutColor += tex2D( BaseTexture, v.vTexCoord.xy+0.0009)*2.7f;
			float vC = (( OutColor.r*0.212671+OutColor.g*0.715160+OutColor.b*0.072169)/3.0f );
			OutColor.rgb = float3(vC, vC, vC);
			OutColor.rgb *= float3( 3.0f, 1.0f, 1.0f );
			float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
			OutColor.a = MaskColor.a;
			
			return OutColor;
		}
	]]

	MainCode PixelShaderDown
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 OutColor = tex2D( BaseTexture, v.vTexCoord.xy );
			OutColor -= tex2D( BaseTexture, v.vTexCoord.xy-0.0009)*2.7f;
			OutColor += tex2D( BaseTexture, v.vTexCoord.xy+0.0009)*2.7f;
			float vC = ( ( OutColor.r*0.212671+OutColor.g*0.715160+OutColor.b*0.072169)/3.0f );
			OutColor.rgb = float3(vC, vC, vC);
			vC = ( dot( OutColor.rgb, float3( 1.0f, 0.2f, 0.2f ) ) );
			OutColor = float4(vC,vC,vC,vC);
		    float4 MaskColor = tex2D( MaskTexture, v.vTexCoord.zw );
		    float4 MixColor = float4( 0.1, 0.1, 0.1, 0 );
		    OutColor.a = MaskColor.a;
		    OutColor -= MixColor;
		    
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