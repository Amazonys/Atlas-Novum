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
    float4 vPosition		: POSITION;
    float4 vColor			: PDX_COLOR;
	float2 vUV				: TEXCOORD0;
};


VertexStruct VS_OUTPUT
{
    float4  vPosition 	: PDX_POSITION;
    float4  vColor		: PDX_COLOR;
    float2	vUV		  	: TEXCOORD0;
	float3	vPos		: TEXCOORD1;
};


## Constant Buffers



## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexShader
	[[
		VS_OUTPUT main( const VS_INPUT v )
		{
			VS_OUTPUT Out;
		   	
			float4 vPos = float4( v.vPosition.xyz, 1.0f );
		   	Out.vPosition  = mul( ViewProjectionMatrix, vPos );
			// move z value slightly closer to camera to avoid intersections with terrain
			float4 vDistortedPos = vPos - float4( vCamLookAtDir * 0.05f, 0.0f );
			float vNewZ = dot( vDistortedPos, float4( GetMatrixData( ViewProjectionMatrix, 2, 0 ), GetMatrixData( ViewProjectionMatrix, 2, 1 ), GetMatrixData( ViewProjectionMatrix, 2, 2 ), GetMatrixData( ViewProjectionMatrix, 2, 3 ) ) );
			Out.vPosition.z = vNewZ;
			
		   	Out.vUV = v.vUV;
			Out.vPos = vPos.rgb;

			Out.vColor = v.vColor;

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
			float4 vColor = tex2D( DiffuseTexture, v.vUV );

			vColor.rgb *= v.vColor.rgb;

			vColor.rgb = ApplyDistanceFog( vColor.rgb, v.vPos, vFoWColor, FoWDiffuse );	
			
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

RasterizerState RasterizerState
{
	FrontCCW = no
	CullMode = "CULL_BACK"
	FillMode = "FILL_SOLID"
}

## Depth Stencil States

DepthStencilState DepthStencil
{
	DepthEnable = yes
}

## Effects

Effect strait
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}