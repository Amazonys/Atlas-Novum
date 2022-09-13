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
			AddressV = "Clamp"
			MagFilter = "Linear"
			MipMapLodBias = -1
			AddressU = "Clamp"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWTexture = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 1
			MipFilter = "Linear"
			MinFilter = "Linear"
		}

		FoWDiffuse = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 2
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
};


VertexStruct VS_OUTPUT
{
    float4 vPosition : PDX_POSITION;
	float3 vPrepos   : TEXCOORD0;
    float2 vTexCoord : TEXCOORD1;
};


## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float2 vTargetOpacity_Fade;
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
			float4 vPos = float4( v.vPosition, 1.0f );
			float4 vDistortedPos = vPos - float4( vCamLookAtDir * 0.5f, 0.0f );
			vPos = mul( ViewProjectionMatrix, vPos );
			
			// move z value slightly closer to camera to avoid intersections with terrain
			float vNewZ = dot( vDistortedPos, float4( GetMatrixData( ViewProjectionMatrix, 2, 0 ), GetMatrixData( ViewProjectionMatrix, 2, 1 ), GetMatrixData( ViewProjectionMatrix, 2, 2 ), GetMatrixData( ViewProjectionMatrix, 2, 3 ) ) );
			
			Out.vPosition = float4( vPos.xy, vNewZ, vPos.w );
			Out.vPrepos = v.vPosition.xyz;
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
			float4 vSample = tex2D( DiffuseTexture, v.vTexCoord );
			vSample.a *= vTargetOpacity_Fade.x * vTargetOpacity_Fade.y;	
			vSample.rgb = ApplyDistanceFog( vSample.rgb, v.vPrepos, GetFoWColor( v.vPrepos, FoWTexture), FoWDiffuse );
			return vSample;
			
		}
	]]

}


## Blend States

BlendState BlendState
{
	AlphaTest = no
	WriteMask = "RED|GREEN|BLUE"
	SourceBlend = "src_alpha"
	DestBlend = "inv_src_alpha"
	BlendEnable = yes
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect mapname
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}