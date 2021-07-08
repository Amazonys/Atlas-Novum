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
			MinFilter = "Point"
		}


	}
}


## Vertex Structs

VertexStruct VS_INPUT
{
    float4 vPosition  	: POSITION;
    float2 vTexCoord  	: TEXCOORD0;
	float4 vFillColor 	: PDX_COLOR;
	float4 vBorderColor : TEXCOORD1;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition 	: PDX_POSITION;
    float2  vTexCoord 	: TEXCOORD0;
	float4 vFillColor 	: PDX_COLOR;
	float4 vBorderColor : TEXCOORD1;
};


VertexStruct VS_FLAG_INPUT
{
    float4 vPosition  	: POSITION;
    float2 vTexCoord  	: TEXCOORD0;
	float4 vFillColor 	: PDX_COLOR;
	float4 vBorderColor : TEXCOORD1;
    float2 vTexCoordFlag : TEXCOORD2;
};


VertexStruct VS_FLAG_OUTPUT
{
    float4  vPosition 	: PDX_POSITION;
    float2  vTexCoord 	: TEXCOORD0;
	float4 vFillColor 	: PDX_COLOR;
	float4 vBorderColor : TEXCOORD1;
    float2 vTexCoordFlag : TEXCOORD2;
};


## Constant Buffers

ConstantBuffer( 0, 0 )
{
	float4x4 	Matrix;//			: register( c0 );
	float4		ModColor;
}

ConstantBuffer( 1, 16 )
{
	float4		CustomColor0;
	float4		CustomColor1;
	float4		CustomColor2;
	float4		CustomColor3;	
	float		FieldCutoff;
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShaderText3D
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
		    VS_OUTPUT Out;
		    Out.vPosition  	= mul( Matrix, v.vPosition );
			
		    Out.vTexCoord  	= v.vTexCoord;
			
			Out.vFillColor	= v.vFillColor * ModColor;
			Out.vBorderColor = float4( ( v.vBorderColor * ModColor ).rgb, v.vBorderColor.a );
			
		    return Out;
		}
	]]

	MainCode VertexShaderText
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
		    VS_OUTPUT Out;
		    Out.vPosition  	= mul( Matrix, v.vPosition );
			
		    Out.vTexCoord  	= v.vTexCoord;
			
			Out.vFillColor	= v.vFillColor * ModColor;
			Out.vBorderColor = float4( ( v.vBorderColor * ModColor ).rgb, v.vBorderColor.a );
			
		    return Out;
		}
	]]

	MainCode VertexShaderFlagText
	[[
		VS_FLAG_OUTPUT main(const VS_FLAG_INPUT v )
		{
		    VS_FLAG_OUTPUT Out;
		    Out.vPosition  	= mul( Matrix, v.vPosition );
			
		    Out.vTexCoord  	= v.vTexCoord;
			Out.vTexCoordFlag  	= v.vTexCoordFlag;
			
			Out.vFillColor	= v.vFillColor * ModColor;
			Out.vBorderColor = float4( ( v.vBorderColor * ModColor ).rgb, v.vBorderColor.a );
			
		    return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShaderText
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
		    float4 TexColor = tex2D( SimpleTexture, v.vTexCoord );
			
			float4 OutColor = TexColor * v.vFillColor;
			
			//TODO: Replace branching if performance is low or if just have time over.
			if( TexColor.a < v.vBorderColor.a * 0.75 )
			{
				OutColor = float4( v.vBorderColor.rgb, v.vFillColor.a ) * TexColor;
			}
			else if( TexColor.a < v.vBorderColor.a )
			{
				float3 MixColor = lerp( v.vBorderColor.rgb, v.vFillColor.rgb,  TexColor.a );
				OutColor = float4( MixColor, v.vFillColor.a ) * TexColor;
			}
			
		    return OutColor;
		}
	]]

	MainCode PixelShaderFlagText
	[[
		float4 main( VS_FLAG_OUTPUT v ) : PDX_COLOR
		{
			//return float4(1,1,1,1);
		    
			float4 TexColor = tex2D( SimpleTexture, v.vTexCoord );
			
			if( v.vTexCoordFlag.x > FieldCutoff )
				TexColor = CustomColor3;
			
			float4 OutColor = TexColor * v.vFillColor;
			
			//TODO: Replace branching if performance is low or if just have time over.
			if( TexColor.a < v.vBorderColor.a * 0.75 )
			{
				OutColor = float4( v.vBorderColor.rgb, v.vFillColor.a ) * TexColor;
			}
			else if( TexColor.a < v.vBorderColor.a )
			{
				float3 MixColor = lerp( v.vBorderColor.rgb, v.vFillColor.rgb,  TexColor.a );
				OutColor = float4( MixColor, v.vFillColor.a ) * TexColor;
			}
			
		    return OutColor;
		}
	]]

	MainCode PixelShaderFlagTextColor
	[[
		float4 main( VS_FLAG_OUTPUT v ) : PDX_COLOR
		{
			float4 OutColor = tex2D( SimpleTexture, v.vTexCoord );
			OutColor = OutColor.r * CustomColor0 + OutColor.g * CustomColor1 + OutColor.b * CustomColor2;
			return OutColor;
		}
	]]

	MainCode PixelShaderFlagTextColorColony
	[[
		float4 main( VS_FLAG_OUTPUT v ) : PDX_COLOR
		{
			if( v.vTexCoordFlag.x > 0.5  )
				return CustomColor3 * v.vFillColor;;
				
			float4 OutColor = tex2D( SimpleTexture, v.vTexCoord );
			OutColor = OutColor.r * CustomColor0 + OutColor.g * CustomColor1 + OutColor.b * CustomColor2;

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

Effect Text3D
{
	VertexShader = "VertexShaderText3D"
	PixelShader = "PixelShaderText"
}

Effect Text
{
	VertexShader = "VertexShaderText"
	PixelShader = "PixelShaderText"
}

Effect FlagTextColor
{
	VertexShader = "VertexShaderFlagText"
	PixelShader = "PixelShaderFlagTextColor"
}

Effect FlagText
{
	VertexShader = "VertexShaderFlagText"
	PixelShader = "PixelShaderFlagText"
}

Effect FlagTextColorColony 
{
	VertexShader = "VertexShaderFlagText"
	PixelShader = "PixelShaderFlagTextColorColony"
}

