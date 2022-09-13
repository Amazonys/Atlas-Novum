## Includes

Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"pdxmap.fxh"
	"shadow.fxh"
}


## Samplers

PixelShader = 
{
	Samplers = 
	{
		BorderDiffuse = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		BorderData = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		BorderCornerDiffuse = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 2
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		BorderCornerData = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 3
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		WaterFoamDiffuse = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 4
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


	}
}


## Vertex Structs

VertexStruct VS_INPUT_BORDER
{
    float3 position			: POSITION;
	float2 uv				: TEXCOORD0;
};


VertexStruct VS_OUTPUT_BORDER
{
    float4 position			: PDX_POSITION;
	float3 pos				: TEXCOORD0;
	float2 uv				: TEXCOORD1;
	float4 vScreenCoord		: TEXCOORD2;
};


## Constant Buffers

ConstantBuffer( 2, 48 )
{
	float4 COLOR_TINT[6];
	float4 GLOW_COLOR;
	float  GLOW_AMOUNT;
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT_BORDER main( const VS_INPUT_BORDER VertexIn )
		{
			VS_OUTPUT_BORDER VertexOut;
			float4 pos = float4( VertexIn.position, 1.0f );
			float vClampHeight = saturate( ( WATER_HEIGHT - VertexIn.position.y ) * float(10000) );
			pos.y = vClampHeight * WATER_HEIGHT + ( 1.0f - vClampHeight ) * pos.y;
			VertexOut.pos = pos.xyz;
			float4 vDistortedPos = pos - float4( vCamLookAtDir * 0.08f, 0.0f );
			pos = mul( ViewProjectionMatrix, pos );
			
			// move z value slightly closer to camera to avoid intersections with terrain
			float vNewZ = dot( vDistortedPos, float4( GetMatrixData( ViewProjectionMatrix, 2, 0 ), GetMatrixData( ViewProjectionMatrix, 2, 1 ), GetMatrixData( ViewProjectionMatrix, 2, 2 ), GetMatrixData( ViewProjectionMatrix, 2, 3 ) ) );
			VertexOut.position = float4( pos.xy, vNewZ, pos.w );
			VertexOut.uv = VertexIn.uv;
			
			// Output the screen-space texture coordinates
			VertexOut.vScreenCoord.x = ( VertexOut.position.x * 0.5 + VertexOut.position.w * 0.5 );
			VertexOut.vScreenCoord.y = ( VertexOut.position.w * 0.5 - VertexOut.position.y * 0.5 );
		#ifdef PDX_OPENGL
			VertexOut.vScreenCoord.y = -VertexOut.vScreenCoord.y;
		#endif		
			VertexOut.vScreenCoord.z = VertexOut.position.w;
			VertexOut.vScreenCoord.w = VertexOut.position.w;	
			
			return VertexOut;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT_BORDER Input ) : PDX_COLOR
		{
			float4 vFoWColor = GetFoWColor( Input.pos, FoWTexture);
			float TI = GetTI( vFoWColor );
			clip( 0.99f - TI );
			float4 vColor = tex2D( BorderDiffuse, float2( Input.uv.y * BORDER_TILE, Input.uv.x ) );
			float4 vData = tex2D( BorderData, float2( Input.uv.y * BORDER_TILE, Input.uv.x ) );
			vColor.rgb += lerp( 
				vData.r * COLOR_TINT[0] + vData.g * COLOR_TINT[1] + vData.b * COLOR_TINT[2], 
				vData.r * COLOR_TINT[3] + vData.g * COLOR_TINT[4] + vData.b * COLOR_TINT[5], vData.a ).rgb;
			vColor.a *= lerp( COLOR_TINT[0].a, COLOR_TINT[3].a, vData.a );
			
			float vGlowFactor = smoothstep( 0.0f, 1.0f, 
					GLOW_AMOUNT
					- abs( Input.uv.x - 0.5f ) //Fade out on edges
					) 
				* GLOW_COLOR.a; 
			vColor.rgb = saturate( vColor.rgb + GLOW_COLOR.rgb * saturate( vGlowFactor - vColor.a * 0.35f ) );
			
			// Grab the shadow term
			float fShadowTerm = GetShadowScaled( SHADOW_WEIGHT_BORDER, Input.vScreenCoord, ShadowMap );		
			vColor.rgb *=  fShadowTerm;
			vColor.rgb = ApplyDistanceFog( vColor.rgb, Input.pos ) * max( GetFoW( Input.pos, vFoWColor, FoWDiffuse ), vGlowFactor );

			//return float4(1.0f, 0.0f, 0.0f ,1.0f);
			return float4( ComposeSpecular( vColor.rgb, 0.0f ), max( vColor.a, vGlowFactor - 0.2f )*(1.0f - TI) );
		}
	]]

	MainCode PixelShaderWaterFoam
	[[
		float4 main( VS_OUTPUT_BORDER Input ) : PDX_COLOR
		{
		  return float4( 1.0f, 1.0f, 1.0f, 1.0f );
		}
	]]

}


## Blend States

BlendState BlendState
{
	AlphaTest = no
	WriteMask = "RED|GREEN|BLUE"
	SourceBlend = "src_alpha"
	BlendEnable = yes
	DestBlend = "inv_src_alpha"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect border
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect WaterFoam
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderWaterFoam"
}