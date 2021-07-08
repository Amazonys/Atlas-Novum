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
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		NormalMap = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		DiffuseBottomMap = 
		{
			AddressV = "Clamp"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 2
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		SurfaceNormalMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 3
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		ColorOverlay = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 4
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		ColorOverlaySecond = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 5
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		HeightNormal = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 6
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 7
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWDiffuse = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 8
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		ShadowMap = 
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

VertexStruct VS_INPUT
{
    float4 vPosition   : POSITION;
	float4 vUV_Tangent : TEXCOORD0;
};


VertexStruct VS_OUTPUT
{
    float4 vPosition	    : PDX_POSITION;
	float4 vUV			    : TEXCOORD0;
	float4 vWorldUV_Tangent	: TEXCOORD1;
	float4 vPrePos_Fade		: TEXCOORD2;
	float4 vScreenCoord		: TEXCOORD3;		
	float2 vSecondaryUV		: TEXCOORD4;
};


## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4x4 ShadowMapTextureMatrix;
	float3 vTimeDirectionSeasonLerp;
}

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT main( const VS_INPUT v )
		{
			VS_OUTPUT Out;
			Out.vPosition = float4( v.vPosition.xyz, 1.0f );
			float4 vTmpPos = float4( v.vPosition.xyz, 1.0f );
			Out.vPrePos_Fade.xyz = vTmpPos.xyz;
			float4 vDistortedPos = vTmpPos - float4( vCamLookAtDir * 0.05f, 0.0f );
			vTmpPos = mul( ViewProjectionMatrix, vTmpPos );
			
			// move z value slightly closer to camera to avoid intersections with terrain
			float vNewZ = dot( vDistortedPos, float4( GetMatrixData( ViewProjectionMatrix, 2, 0 ), GetMatrixData( ViewProjectionMatrix, 2, 1 ), GetMatrixData( ViewProjectionMatrix, 2, 2 ), GetMatrixData( ViewProjectionMatrix, 2, 3 ) ) );
			Out.vPosition = float4( vTmpPos.xy, vNewZ, vTmpPos.w );
			
			Out.vUV.yx = v.vUV_Tangent.xy;
			Out.vUV.x += vTimeDirectionSeasonLerp.x * 1.0f * vTimeDirectionSeasonLerp.y;
			Out.vUV.y += vTimeDirectionSeasonLerp.x * 0.2f;
			Out.vUV.x *= 0.05f;
			Out.vSecondaryUV.yx = v.vUV_Tangent.xy;
			Out.vSecondaryUV.x += vTimeDirectionSeasonLerp.x * 0.9f * vTimeDirectionSeasonLerp.y;
			Out.vSecondaryUV.y -= vTimeDirectionSeasonLerp.x * 0.1f;
			Out.vSecondaryUV.x *= 0.05f;
			Out.vUV.wz = v.vUV_Tangent.xy;
			Out.vUV.z *= 0.05f;
			Out.vWorldUV_Tangent.x = (  v.vPosition.x + 0.5f ) / MAP_SIZE_X;
			Out.vWorldUV_Tangent.y = (  v.vPosition.z + 0.5f - MAP_SIZE_Y ) / -MAP_SIZE_Y;
			Out.vWorldUV_Tangent.xy *= float2( MAP_POW2_X, MAP_POW2_Y ); //POW2
			Out.vWorldUV_Tangent.zw = v.vUV_Tangent.zw;
			//Out.vPrePos_Fade.w = saturate( 1.0f - v.vUV_Tangent.y );
			Out.vPrePos_Fade.w = saturate( 1.0f - ( ( 0.1f + v.vUV_Tangent.y ) * 4.0f ) );
			// Output the screen-space texture coordinates
			Out.vScreenCoord.x = ( Out.vPosition.x * 0.5 + Out.vPosition.w * 0.5 );
			Out.vScreenCoord.y = ( Out.vPosition.w * 0.5 - Out.vPosition.y * 0.5 );
		#ifdef PDX_OPENGL
			Out.vScreenCoord.y = -Out.vScreenCoord.y;
		#endif			
			Out.vScreenCoord.z = Out.vPosition.w;
			Out.vScreenCoord.w = Out.vPosition.w;
			
			return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelShader
	[[
		float4 main( VS_OUTPUT In ) : PDX_COLOR
		{
			float4 vFoWColor = GetFoWColor( In.vPrePos_Fade.xyz, FoWTexture);
			float TI = GetTI( vFoWColor );	
			clip( 0.99f - TI );
			
			float4 vWaterSurface = tex2D( DiffuseMap, float2( In.vUV.x, In.vUV.w ) );
			float3 vHeightNormal = normalize( tex2D( HeightNormal, In.vWorldUV_Tangent.xy ).rbg - 0.5f );
			float3 vSurfaceNormal1 = normalize( tex2D( SurfaceNormalMap, In.vUV.xy ).rgb - 0.5f );
			float3 vSurfaceNormal2 = normalize( tex2D( SurfaceNormalMap, In.vSecondaryUV ).rgb - 0.5f );
			float3 vSurfaceNormal = normalize( vSurfaceNormal1 + vSurfaceNormal2 );
			vSurfaceNormal.xzy = float3( vSurfaceNormal.x * In.vWorldUV_Tangent.zw + vSurfaceNormal.y * float2( -In.vWorldUV_Tangent.w, In.vWorldUV_Tangent.z ), vSurfaceNormal.z );
			
			float3 zaxis = vSurfaceNormal; //normal
			float3 xaxis = cross( zaxis, float3( 0, 0, 1 ) ); //tangent
			xaxis = normalize( xaxis );
			float3 yaxis = cross( xaxis, zaxis ); //bitangent
			yaxis = normalize( yaxis );
			vSurfaceNormal = xaxis * vHeightNormal.x + zaxis * vHeightNormal.y + yaxis * vHeightNormal.z;
			float3 vEyeDir = normalize( In.vPrePos_Fade.xyz - vCamPos );
			float3 H = normalize( -vLightDir + -vEyeDir );
			float vSpecRemove = 1.0f - abs( 0.5f - In.vUV.w ) * 2.0f;
			float vSpecWidth = 70.0f;
			float vSpecMultiplier = 0.25f;
			float specular = saturate( pow( saturate( dot( H, vSurfaceNormal ) ), vSpecWidth ) * vSpecMultiplier ) * vSpecRemove/*  dot( vWaterSurface, vWaterSurface )*/;
			float2 vDistort = refract( vCamLookAtDir, vSurfaceNormal, 0.66f ).xz;
			vDistort = vDistort.x * In.vWorldUV_Tangent.zw + vDistort.y * float2( -In.vWorldUV_Tangent.w, In.vWorldUV_Tangent.z );
			float3 vBottom = tex2D( DiffuseBottomMap, In.vUV.zw + vDistort * 0.05f ).rgb;
			float  vBottomAlpha = tex2D( DiffuseBottomMap, In.vUV.zw ).a;
			float3 ColorMap = lerp( tex2D( ColorOverlay, In.vWorldUV_Tangent.xy ), tex2D( ColorOverlaySecond, In.vWorldUV_Tangent.xy ), vTimeDirectionSeasonLerp.z).rgb;
			
			vBottom = GetOverlay( vBottom, ColorMap, 0.5f );
			float3 vBottomNormal = normalize( tex2D( NormalMap, In.vUV.zw ).rgb - 0.5f );
			vBottomNormal.xzy = float3( vBottomNormal.x * In.vWorldUV_Tangent.zw + vBottomNormal.y * float2( -In.vWorldUV_Tangent.w, In.vWorldUV_Tangent.z ), vBottomNormal.z );
			//Calculate normal
			zaxis = vBottomNormal; //normal
			xaxis = cross( zaxis, float3( 0, 0, 1 ) ); //tangent
			xaxis = normalize( xaxis );
			yaxis = cross( xaxis, zaxis ); //bitangent
			yaxis = normalize( yaxis );
			vBottomNormal = xaxis * vHeightNormal.x + zaxis * vHeightNormal.y + yaxis * vHeightNormal.z;
							
			float3 vColor = lerp( vBottom, vWaterSurface.xyz, vWaterSurface.a * 0.8f );
			vColor = ApplyWaterSnow( vColor, In.vPrePos_Fade.xyz, vSurfaceNormal, vFoWColor, FoWDiffuse );
			vColor = CalculateLighting( vColor, vBottomNormal );
			
			float vFoW = GetFoW( In.vPrePos_Fade.xyz, vFoWColor, FoWDiffuse );
			
			// Grab the shadow term
			float fShadowTerm = GetShadowScaled( SHADOW_WEIGHT_RIVER, In.vScreenCoord, ShadowMap );		
			vColor *= fShadowTerm;	
			
			vColor = ApplyDistanceFog( vColor, In.vPrePos_Fade.xyz ) * vFoW;
			return float4( ComposeSpecular( vColor, specular * ( 1.0f - In.vPrePos_Fade.w ) * vWaterSurface.a * vFoW ), vBottomAlpha * ( 1.0f - In.vPrePos_Fade.w ) * (1.0f - TI ) ) * fShadowTerm;
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

Effect river
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}