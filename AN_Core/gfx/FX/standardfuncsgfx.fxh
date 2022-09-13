## Constant Buffers

ConstantBuffer( 0, 0 )
{
	float4x4 ViewProjectionMatrix;
	float4x4 ViewMatrix;
	float4x4 InvViewMatrix;
	float4x4 InvViewProjMatrix;
	float4 vMapSize;
	float3 vLightDir;
	float3 vCamPos;
	float3 vCamRightDir;
	float3 vCamLookAtDir;
	float3 vCamUpDir;
	float3 vFoWOpacity_Time;
}

## Shared Code

Code
[[
#ifndef STANDARDFUNCS_H_
#define STANDARDFUNCS_H_

// Photoshop filters, kinda...
float3 Hue( float H )
{
	float X = 1.0 - abs( ( mod( H, 2.0 ) ) - 1.0 );
	if ( H < 1.0f )			return float3( 1.0f,    X, 0.0f );
	else if ( H < 2.0f )	return float3(    X, 1.0f, 0.0f );
	else if ( H < 3.0f )	return float3( 0.0f, 1.0f,    X );
	else if ( H < 4.0f )	return float3( 0.0f,    X, 1.0f );
	else if ( H < 5.0f )	return float3(    X, 0.0f, 1.0f );
	else					return float3( 1.0f, 0.0f,    X );
}

float3 HSVtoRGB( in float3 HSV )
{
	if ( HSV.y != 0.0f )
	{
		float C = HSV.y * HSV.z;
		return clamp( Hue( HSV.x ) * C + ( HSV.z - C ), 0.0f, 1.0f );
	}
	return saturate( HSV.zzz );
}

float3 RGBtoHSV( in float3 RGB )
{
    float3 HSV = float3( 0, 0, 0 );
    HSV.z = max( RGB.r, max( RGB.g, RGB.b ) );
    float M = min( RGB.r, min( RGB.g, RGB.b ) );
    float C = HSV.z - M;
    
	if ( C != 0.0f )
    {
        HSV.y = C / HSV.z;

		float3 vDiff = ( RGB.gbr - RGB.brg ) / C;
		// vDiff.x %= 6.0f; // We make this operation after tweaking the value
		vDiff.yz += float2( 2.0f, 4.0f );

        if ( RGB.r == HSV.z )		HSV.x = vDiff.x;
        else if ( RGB.g == HSV.z )	HSV.x = vDiff.y;
        else						HSV.x = vDiff.z;
    }
    return HSV;
}

float3 GetOverlay( float3 vColor, float3 vOverlay, float vOverlayPercent )
{
	float3 res;
	res.r = vOverlay.r < .5 ? (2.0 * vOverlay.r * vColor.r) : (1.0 - 2.0 * (1.0 - vOverlay.r) * (1.0 - vColor.r));
	res.g = vOverlay.g < .5 ? (2.0 * vOverlay.g * vColor.g) : (1.0 - 2.0 * (1.0 - vOverlay.g) * (1.0 - vColor.g));
	res.b = vOverlay.b < .5 ? (2.0 * vOverlay.b * vColor.b) : (1.0 - 2.0 * (1.0 - vOverlay.b) * (1.0 - vColor.b));

	return lerp( vColor, res, vOverlayPercent );
}

float3 Levels( float3 vInColor, float vMinInput, float vMaxInput )
{
	float3 vRet = saturate( vInColor - vMinInput );
	vRet /= vMaxInput - vMinInput;
	return saturate( vRet );
}

float3 UnpackNormal( in sampler2D NormalTex, float2 uv )
{
	float3 vNormalSample = normalize( tex2D( NormalTex, uv ).rgb - 0.5f );
	vNormalSample.g = -vNormalSample.g;
	return vNormalSample;
}

// Standard functions
float3 CalculateLighting( float3 vColor, float3 vNormal, float3 vLightDirection, float vAmbient, float3 vLightDiffuse, float vLightIntensity )
{
	float NdotL = dot( vNormal, -vLightDirection );

	float vHalfLambert = NdotL * 0.5f + 0.5f;
	vHalfLambert *= vHalfLambert;

	vHalfLambert = vAmbient + ( 1.0f - vAmbient ) * vHalfLambert;

	return  saturate( vHalfLambert * vColor * vLightDiffuse * vLightIntensity );
}

float3 CalculateLighting( float3 vColor, float3 vNormal )
{
	return CalculateLighting( vColor, vNormal, vLightDir, AMBIENT, LIGHT_DIFFUSE, LIGHT_INTENSITY );
}

float3 CalculateMapLighting( float3 vColor, float3 vNormal )
{
	return CalculateLighting( vColor, vNormal, vLightDir, MAP_AMBIENT, MAP_LIGHT_DIFFUSE, MAP_LIGHT_INTENSITY );
}

float CalculateSpecular( float3 vPos, float3 vNormal, float vInIntensity )
{
	float3 H = normalize( -normalize( vPos - vCamPos ) + -vLightDir );
	float vSpecWidth = 10.0f;
	float vSpecMultiplier = 2.0f;
	return saturate( pow( saturate( dot( H, vNormal ) ), vSpecWidth ) * vSpecMultiplier ) * vInIntensity;
}

float3 CalculateSpecular( float3 vPos, float3 vNormal, float3 vInIntensity )
{
	float3 H = normalize( -normalize( vPos - vCamPos ) + -vLightDir );
	float vSpecWidth = 10.0f;
	float vSpecMultiplier = 2.0f;
	return saturate( pow( saturate( dot( H, vNormal ) ), vSpecWidth ) * vSpecMultiplier ) * vInIntensity;
}

float3 ComposeSpecular( float3 vColor, float vSpecular ) 
{
	return saturate( vColor + vSpecular );// * STANDARD_HDR_RANGE + ( 1.0f - STANDARD_HDR_RANGE ) * vSpecular;
}

float3 ComposeSpecular( float3 vColor, float3 vSpecular ) 
{
	return saturate( vColor + vSpecular );
}

float3 ApplyDistanceFog( float3 vColor, float3 vPos )
{
	float3 vDiff = vCamPos - vPos;
	float vFogFactor = 1.0f - abs( normalize( vDiff ).y ); // abs b/c of reflections
	float vSqDistance = dot( vDiff, vDiff );

	float vBegin = FOG_BEGIN;
	float vEnd = FOG_END;
	vBegin *= vBegin;
	vEnd *= vEnd;
	
	float vMaxFog = FOG_MAX;
	
	float vMin = min( ( vSqDistance - vBegin ) / ( vEnd - vBegin ), vMaxFog );

	return lerp( vColor, FOG_COLOR, saturate( vMin ) * vFogFactor );
}

float4 GetProvinceColor( float2 Coord, in sampler2D IndirectionMap, in sampler2D ColorMap, float2 ColorMapSize, float TextureIndex )
{
	float2 ColorIndex = tex2D( IndirectionMap, Coord ).xy;
	ColorIndex.y = ( ColorIndex.y * 255.0 ) / ( ( ColorMapSize.y * 2 ) - 1 ) + ( TextureIndex * 0.5 );
	return tex2D( ColorMap, ColorIndex );
}

float4 GetProvinceColorSampled( float2 Coord, in sampler2D IndirectionMap, float2 IndirectionMapSize, in sampler2D ColorMap, float2 ColorMapSize, float TextureIndex )
{
	float2 Pixel = Coord * IndirectionMapSize + 0.5;
	float2 InvTextureSize = 1.0 / IndirectionMapSize;

	float2 FracCoord = frac( Pixel );
	Pixel = floor( Pixel ) / IndirectionMapSize - InvTextureSize / 2.0;

	float4 C11 = GetProvinceColor( Pixel, IndirectionMap, ColorMap, ColorMapSize, TextureIndex );
	float4 C21 = GetProvinceColor( Pixel + float2( InvTextureSize.x, 0.0 ), IndirectionMap, ColorMap, ColorMapSize, TextureIndex );
	float4 C12 = GetProvinceColor( Pixel + float2( 0.0, InvTextureSize.y ), IndirectionMap, ColorMap, ColorMapSize, TextureIndex );
	float4 C22 = GetProvinceColor( Pixel + InvTextureSize, IndirectionMap, ColorMap, ColorMapSize, TextureIndex );

	float4 x1 = lerp( C11, C21, FracCoord.x );
	float4 x2 = lerp( C12, C22, FracCoord.x );
	return lerp( x1, x2, FracCoord.y );
}

float4 GetFoWColor( float3 vPos, in sampler2D FoWTexture)
{
	return tex2D( FoWTexture, float2( ( ( vPos.x + 0.5f ) / MAP_SIZE_X ) * FOW_POW2_X, ( (vPos.z + 0.5f ) / MAP_SIZE_Y) * FOW_POW2_Y ) );
}

float GetTI( float4 vFoWColor )
{
	return vFoWColor.r;
	//return saturate( (vFoWColor.r-0.5f) * 1000.0f );
}

float4 GetTIColor( float3 vPos, in sampler2D TITexture )
{
	return tex2D( TITexture, ( vPos.xz + 0.5f ) / float2( 1876.0f, 2048.0f ) );
}

float GetFoW( float3 vPos, float4 vFoWColor, in sampler2D FoWDiffuse )
{
	float vFoWDiffuse = tex2D( FoWDiffuse, ( vPos.xz + 0.5f ) / 256.0f + vFoWOpacity_Time.y * 0.02f ).r;
	vFoWDiffuse = sin( ( vFoWDiffuse + frac( vFoWOpacity_Time.y * 0.1f ) ) * 6.28318531f ) * 0.1f;
	float vShade = vFoWDiffuse + 0.5f;
	float vIsFow = vFoWColor.a;
	return lerp( 1.0f, saturate( vIsFow + vShade ), vFoWOpacity_Time.x );
}

float3 ApplyDistanceFog( float3 vColor, float3 vPos, float4 vFoWColor, in sampler2D FoWDiffuse )
{
	float vFOW = GetFoW( vPos, vFoWColor, FoWDiffuse );
	return ApplyDistanceFog( vColor, vPos ) * vFOW;
}

const static float SNOW_START_HEIGHT 	= 18.0f;
const static float SNOW_RIDGE_START_HEIGHT 	= 22.0f;
const static float SNOW_NORMAL_START 	= 0.7f;
const static float3 SNOW_COLOR = float3( 0.7f, 0.7f, 0.7f );
const static float3 SNOW_WATER_COLOR = float3( 0.5f, 0.7f, 0.7f );

float GetSnow( float4 vFoWColor )
{
	return lerp( vFoWColor.b, vFoWColor.g, vFoWOpacity_Time.z );
}

float3 ApplySnow( float3 vColor, float3 vPos, inout float3 vNormal, float4 vFoWColor, in sampler2D FoWDiffuse, float3 vSnowColor )
{
	float vSnowFade = saturate( vPos.y - SNOW_START_HEIGHT );
	float vNormalFade = saturate( saturate( vNormal.y - SNOW_NORMAL_START ) * 10.0f );

	float vNoise = tex2D( FoWDiffuse, ( vPos.xz + 0.5f ) / 100.0f  ).r;
	float vSnowTexture = tex2D( FoWDiffuse, ( vPos.xz + 0.5f ) / 10.0f  ).r;
	
	float vIsSnow = GetSnow( vFoWColor );
	
	//Increase snow on ridges
	vNoise += saturate( vPos.y - SNOW_RIDGE_START_HEIGHT )*( saturate( (vNormal.y-0.9f) * 1000.0f )*vIsSnow );
	vNoise = saturate( vNoise );
	
	float vSnow = saturate( saturate( vNoise - ( 1.0f - vIsSnow ) ) * 5.0f );
	float vFrost = saturate( saturate( vNoise + 0.5f ) - ( 1.0f - vIsSnow ) );
	
	vColor = lerp( vColor, vSnowColor * ( 0.9f + 0.1f * vSnowTexture), saturate( vSnow + vFrost ) * vSnowFade * vNormalFade * ( saturate( vIsSnow*2.25f ) ) );	
	
	vNormal.y += 1.0f * saturate( vSnow + vFrost ) * vSnowFade * vNormalFade;
	vNormal = normalize( vNormal );
	
	return vColor;
}

float3 ApplySnow( float3 vColor, float3 vPos, inout float3 vNormal, float4 vFoWColor, in sampler2D FoWDiffuse )
{
	return ApplySnow( vColor, vPos, vNormal, vFoWColor, FoWDiffuse, SNOW_COLOR );
}

float3 ApplyWaterSnow( float3 vColor, float3 vPos, inout float3 vNormal, float4 vFoWColor, in sampler2D FoWDiffuse )
{
	return ApplySnow( vColor, vPos, vNormal, vFoWColor, FoWDiffuse, SNOW_WATER_COLOR );
}

#endif // STANDARDFUNCS_H_
]]
