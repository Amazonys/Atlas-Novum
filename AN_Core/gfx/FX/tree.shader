## Includes

Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"shadow.fxh"
}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		DiffuseMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			MipMapLodBias = -1
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		NormalMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			MipMapLodBias = -1
			AddressU = "Wrap"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		TintMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 2
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		SeasonMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 3
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		ColorMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 4
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		ColorMapSecond = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 5
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 6
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWDiffuse = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 7
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		ShadowMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 8
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		TITexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 9
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs

VertexStruct VS_INPUT_INSTANCE
{
    float3 vPosition	: POSITION;
	float3 vNormal      : TEXCOORD0;
	float4 vTangent		: TEXCOORD1;
	float2 vUV0			: TEXCOORD2;
	float2 vUV1			: TEXCOORD3;
	float4 vPos_YRot   	: TEXCOORD4;
	float3 vSlopes    	: TEXCOORD5;
};


VertexStruct VS_OUTPUT
{
    float4 vPosition		  	: PDX_POSITION;
	float4 vTexCoord0_TintUV  	: TEXCOORD0;
	float3 vNormal          	: TEXCOORD1;
	float3 vPos				  	: TEXCOORD2;
	float4 vShadowProj			: TEXCOORD3;
	float4 vScreenCoord			: TEXCOORD4;
	float3 vTangent          	: TEXCOORD5;
	float3 vBitangent          	: TEXCOORD6;
	float  vSeasonColumn		: TEXCOORD7;
};


VertexStruct VS_OUTPUT_SHADOW
{
    float4 	vPosition  	: PDX_POSITION;
	float2 	fDepth 		: TEXCOORD0;
	float2	vTexCoord0_UV  	: TEXCOORD1;
};


## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4x4 ShadowMapTextureMatrix;
	float2	 vSeasonLerp;
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT main( const VS_INPUT_INSTANCE v )
		{
			VS_OUTPUT Out;
			float vRandom = v.vPos_YRot.w / 6.28318531f;
			float vSummedRandom = v.vUV1.x + vRandom;
			vSummedRandom = vSummedRandom >= 1.0f ? vSummedRandom - 1.0f : vSummedRandom;
			
			float vHeightScaleFactor = 0.75f + vSummedRandom * 0.5f;
			Out.vPosition = float4( v.vPosition.xyz, 1.0 );
			Out.vPosition.y *= vHeightScaleFactor;
			float randSin = sin( v.vPos_YRot.w );
			float randCos = cos( v.vPos_YRot.w );
			Out.vPosition.xz = float2( 
				Out.vPosition.x * randCos - Out.vPosition.z * randSin, 
				Out.vPosition.x * randSin + Out.vPosition.z * randCos );
			Out.vPosition.y += Out.vPosition.x * v.vSlopes.x + Out.vPosition.z * v.vSlopes.y;
			Out.vPosition.xyz += v.vPos_YRot.xyz;
			
			Out.vPos = Out.vPosition.xyz;
			Out.vPosition = mul( ViewProjectionMatrix, Out.vPosition );
			
			Out.vTexCoord0_TintUV.xy = v.vUV0;
			Out.vNormal = v.vNormal;
			Out.vNormal.xz = float2( 
				Out.vNormal.x * randCos - Out.vNormal.z * randSin, 
				Out.vNormal.x * randSin + Out.vNormal.z * randCos );
			
			Out.vTangent = v.vTangent.xyz;
			Out.vTangent.xz = float2( 
				Out.vTangent.x * randCos - Out.vTangent.z * randSin, 
				Out.vTangent.x * randSin + Out.vTangent.z * randCos );
			Out.vBitangent = cross( Out.vTangent, Out.vNormal ) * v.vTangent.w;
			
			Out.vTexCoord0_TintUV.zw = float2( vRandom, 0.0f ) + v.vUV1;
			
			Out.vShadowProj = mul( ShadowMapTextureMatrix, float4( Out.vPos, 1.0f ) );	
			
			// Output the screen-space texture coordinates
			Out.vScreenCoord.x = ( Out.vPosition.x * 0.5 + Out.vPosition.w * 0.5 );
			Out.vScreenCoord.y = ( Out.vPosition.w * 0.5 - Out.vPosition.y * 0.5 );
		#ifdef PDX_OPENGL
			Out.vScreenCoord.y = -Out.vScreenCoord.y;
		#endif			
			Out.vScreenCoord.z = Out.vPosition.w;
			Out.vScreenCoord.w = Out.vPosition.w;
			
			Out.vSeasonColumn = vSeasonLerp.y/8.0f;
			Out.vSeasonColumn += 1.0f/16.0f;
			
			return Out;
		}
	]]

	MainCode VertexShaderShadow
	[[
		VS_OUTPUT_SHADOW main( const VS_INPUT_INSTANCE v )
		{
			VS_OUTPUT_SHADOW Out;
			float vRandom = v.vPos_YRot.w / 6.28318531f;
			float vSummedRandom = v.vUV1.x + vRandom;
			vSummedRandom = vSummedRandom >= 1.0f ? vSummedRandom - 1.0f : vSummedRandom;
			
			float vHeightScaleFactor = 0.75f + vSummedRandom * 0.5f;
			Out.vPosition = float4( v.vPosition.xyz, 1.0f );
			Out.vPosition.y *= vHeightScaleFactor;
			float randSin = sin( v.vPos_YRot.w );
			float randCos = cos( v.vPos_YRot.w );
			Out.vPosition.xz = float2( 
				Out.vPosition.x * randCos - Out.vPosition.z * randSin, 
				Out.vPosition.x * randSin + Out.vPosition.z * randCos );
			Out.vPosition.y += Out.vPosition.x * v.vSlopes.x + Out.vPosition.z * v.vSlopes.y;
			Out.vPosition.xyz += v.vPos_YRot.xyz;
			Out.vPosition 	= mul( ViewProjectionMatrix, Out.vPosition );
			Out.fDepth 		= Out.vPosition.zw;	
			
			Out.vTexCoord0_UV = v.vUV0;
			return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float3 ApplySnowTree( float3 vColor, float3 vPos, inout float3 vNormal, float4 vFoWColor, in sampler2D FoWDiffuse )
		{
			float vIsSnow = GetSnow( vFoWColor );
			float vNormalFade = saturate( saturate( vNormal.y - saturate( 1.0f - vIsSnow ) )*vIsSnow*5.5f*saturate( ( vNormal.y - 0.6f ) * 1000.0f ) );
			vColor = lerp( vColor, SNOW_COLOR, vNormalFade );
			
			vNormal.y += 1.0f * vNormalFade;
			vNormal = normalize( vNormal );
			
			return vColor;
		}
		float4 main( VS_OUTPUT In ) : PDX_COLOR
		{
			float4 vDiffuseColor = tex2D( DiffuseMap, In.vTexCoord0_TintUV.xy );
			clip( vDiffuseColor.a - 0.5f );
			float4 vFoWColor = GetFoWColor( In.vPos, FoWTexture);	
			float TI = GetTI( vFoWColor );	
			float4 vTIColor = GetTIColor( In.vPos, TITexture );
			if( ( TI - 0.99f ) * 1000.0f > 0.0f )
			{
				return float4( vTIColor.rgb, 1.0f );
			}	
			float2 uv = float2( ( ( In.vPos.x+0.5f ) / MAP_SIZE_X ), ( ( In.vPos.z+0.5f-MAP_SIZE_Y ) / -MAP_SIZE_Y )); 
			
			float3 vColor = GetOverlay( vDiffuseColor.rgb, tex2D( TintMap, In.vTexCoord0_TintUV.zw ).rgb, 0.5f );	
			
			float3 vSeasonColorMap = lerp( tex2D( ColorMap, uv), tex2D( ColorMapSecond, uv), vSeasonLerp.x ).rgb;	
			vColor = GetOverlay( vColor, vSeasonColorMap, 0.25f );
			
			float vSeasonTreeFade = saturate( saturate( (In.vPos.z/MAP_SIZE_Y) - TREE_SEASON_MIN )*TREE_SEASON_FADE_TWEAK );
			vColor += ( tex2D( SeasonMap, float2( In.vSeasonColumn, In.vTexCoord0_TintUV.w ) ).rgb-0.5f ) * vSeasonTreeFade;
			float3 vNormalSample = normalize( tex2D( NormalMap, In.vTexCoord0_TintUV.xy  ).rgb - 0.5f );
			float3x3 TBN = Create3x3( normalize( In.vTangent ), normalize( In.vBitangent ), normalize( In.vNormal ) );
			float3 vNormal = mul( vNormalSample, TBN );	
			vColor = ApplySnowTree( vColor, In.vPos, vNormal, vFoWColor, FoWDiffuse );	
			
			vColor = CalculateLighting( vColor, normalize( vNormal ) );
			
			// Grab the shadow term
			float fShadowTerm = GetShadowScaled( SHADOW_WEIGHT_TREE, In.vScreenCoord, ShadowMap );	
			vColor *= fShadowTerm;
			vColor = ApplyDistanceFog( vColor, In.vPos, GetFoWColor( In.vPos, FoWTexture), FoWDiffuse );
			return float4( lerp( ComposeSpecular( vColor, 0.0f ), vTIColor.rgb, TI ), 1.0f );
		}
	]]

	MainCode PixelShaderUnlit
	[[
		float4 main( VS_OUTPUT In ) : PDX_COLOR
		{
			float4 vDiffuseColor = tex2D( DiffuseMap, In.vTexCoord0_TintUV.xy );
			clip( vDiffuseColor.a - 0.5f );
			// Grab the shadow term
			float fShadowTerm = CalculateShadow( In.vShadowProj, ShadowMap);		
			return float4( fShadowTerm, fShadowTerm, fShadowTerm, 1.0f );
		}
	]]

	MainCode PixelShaderShadow
	[[
		float4 main( VS_OUTPUT_SHADOW In ) : PDX_COLOR
		{
			float4 vDiffuseColor = tex2D( DiffuseMap, In.vTexCoord0_UV.xy );
			clip( vDiffuseColor.a - 0.5f );
			return float4( In.fDepth.xxx * In.fDepth.y, 1.0f);
		}
	]]

}


## Blend States

BlendState BlendState
{
	AlphaTest = no
	BlendEnable = no
	WriteMask = "RED|GREEN|BLUE"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect tree
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect treeunlit
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderUnlit"
}

Effect treeshadow
{
	VertexShader = "VertexShaderShadow"
	PixelShader = "PixelShaderShadow"
}