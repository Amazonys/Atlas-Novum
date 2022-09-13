## Includes

Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		DiffuseTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		NormalMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 2
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWDiffuse = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 3
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs

VertexStruct VS_INPUT
{
    float3 vPosition  : POSITION;
	float2 vTexCoord  : TEXCOORD0;
	float3 vTangent	  : TANGENT;
};


VertexStruct VS_OUTPUT
{
    float4 vPosition : PDX_POSITION;
    float2 vTexCoord : TEXCOORD0;
	float3 vPos		 : TEXCOORD1;
	float  vScale	 : TEXCOORD2;
};



## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4 vInfo;
}

## Shared Code

Code
[[
static const float  TRADEROUTE_FADE_END    	= 2.0f;
static const float  TRADEROUTE_FADE_START   = 2.0f;
]]


## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT main(const VS_INPUT v )
		{
		 	VS_OUTPUT Out;
			float4 vPos = float4( v.vPosition, 1.0f );
			
			Out.vScale = vInfo.y*2.5f;
			vPos.xz += v.vTangent.xz*Out.vScale;
			
			Out.vPos = vPos.xyz;
			
			float4 vDistortedPos = vPos - float4( vCamLookAtDir * 0.5f, 0.0f );
			
			// move z value slightly closer to camera to avoid intersections with terrain
			float vNewZ = dot( vDistortedPos, float4( GetMatrixData( ViewProjectionMatrix, 2, 0 ), GetMatrixData( ViewProjectionMatrix, 2, 1 ), GetMatrixData( ViewProjectionMatrix, 2, 2 ), GetMatrixData( ViewProjectionMatrix, 2, 3 ) ) );	
			
		   	Out.vPosition  = mul( ViewProjectionMatrix, vPos );	
			
			Out.vPosition = float4( Out.vPosition.xy, vNewZ, Out.vPosition.w );	
			
			Out.vTexCoord = v.vTexCoord;
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
			float4 vFoWColor = GetFoWColor( v.vPos, FoWTexture);	
			float TI = GetTI( vFoWColor );
			clip( 0.99f - TI );
			
			float vAlphaEnd = vInfo.x - (v.vTexCoord.x+TRADEROUTE_FADE_END);
			vAlphaEnd = vAlphaEnd * saturate( 1.0f - ( vAlphaEnd/-TRADEROUTE_FADE_END ) );	;
			
			float vAlphaStart = v.vTexCoord.x - TRADEROUTE_FADE_START;
			vAlphaStart = vAlphaStart * saturate( 1.0f - ( vAlphaStart/-TRADEROUTE_FADE_START ) );	
			
			float vAlpha = saturate( vAlphaStart )*saturate( vAlphaEnd );
			float4 vColor = tex2D( DiffuseTexture, float2( (v.vTexCoord.x)*(0.16f/vInfo.y), v.vTexCoord.y ) );
			vColor.rgb = ApplyDistanceFog( vColor.rgb, v.vPos, vFoWColor, FoWDiffuse );	
			
			vColor.a *= vAlpha;
			vColor.a *= vInfo.z;
			vColor.a *= 1.0f - TI;
			
			return vColor;
		}
	]]

	MainCode PixelShaderTrade
	[[
		float4 main( VS_OUTPUT v ) : PDX_COLOR
		{
			float4 vFoWColor = GetFoWColor( v.vPos, FoWTexture);	
			float TI = GetTI( vFoWColor );	
			clip( 0.99f - TI );
			
			float vAlphaEnd = vInfo.x - (v.vTexCoord.x+TRADEROUTE_FADE_END);
			vAlphaEnd = vAlphaEnd * saturate( 1.0f - ( vAlphaEnd/-TRADEROUTE_FADE_END ) );
			
			float vAlphaStart = v.vTexCoord.x - TRADEROUTE_FADE_START;
			vAlphaStart = vAlphaStart * saturate( 1.0f - ( vAlphaStart/-TRADEROUTE_FADE_START ) );	
			float vAlpha = saturate( vAlphaStart )*saturate( vAlphaEnd );
			float2 vTexCoord = float2( (v.vTexCoord.x-vFoWOpacity_Time.y*4.0f)*(0.16f/v.vScale), v.vTexCoord.y );
			float4 vColor = tex2D( DiffuseTexture, vTexCoord );
			vColor.rgb = CalculateLighting( vColor.rgb, normalize( tex2D( NormalMap, vTexCoord ).rbg - 0.5f ) );	
			vColor.rgb = ApplyDistanceFog( vColor.rgb, v.vPos, vFoWColor, FoWDiffuse );	
			
			vColor.a *= vAlpha;
			vColor.a *= vInfo.z;
			vColor.a *= 1.0f - TI;
			
			return vColor;
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

Effect TradeRoute
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect TradeRouteTrade
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderTrade"
}