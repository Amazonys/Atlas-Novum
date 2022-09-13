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
		DiffuseMap = 
		{
			AddressV = "Wrap"
			MagFilter = "Linear"
			AddressU = "Wrap"
			Index = 0
			MipFilter = "Linear"
			MinFilter = "Linear"
		}


	}
}


## Vertex Structs

VertexStruct VS_INPUT_SIMPLEPARTICLE
{
	float2 vUV0			: TEXCOORD0;
	float4 vPosSize		: TEXCOORD1;
	float4 vVelRot		: TEXCOORD2;
	float4 vTile		: TEXCOORD3;
	float4 vColor		: PDX_COLOR;
};




VertexStruct VS_OUTPUT_SIMPLEPARTICLE
{
    float4 vPosition	: PDX_POSITION;
	float2 vUV0			: TEXCOORD0;
	float4 vColor		: PDX_COLOR;
};



## Constant Buffers

ConstantBuffer( 1, 32 )
{
	float4x4 ProjectionMatrix;
}

ConstantBuffer( 2, 36 )
{
	float Scale;
}

ConstantBuffer( 3, 40 )
{
	float4x4 InstanceWorldMatrix;
	float4	HalfPixelWH_RowsCols;
	float	vLocalTime;
};

## Shared Code

## Vertex Shaders

VertexShader = 
{
	MainCode VertexSimpleParticle
	[[
		VS_OUTPUT_SIMPLEPARTICLE main( const VS_INPUT_SIMPLEPARTICLE v )
		{
		  	VS_OUTPUT_SIMPLEPARTICLE Out;
			
			Out.vPosition = mul( ViewProjectionMatrix, float4( v.vPosSize.xyz, 1.0 ) );
			
			float2 offset = ( v.vUV0 - 0.5f ) * v.vPosSize.w * Scale;
			float2 vSinCos;
			sincos( v.vVelRot.w * ( 3.14159265359f / 180.0f ), vSinCos.x, vSinCos.y );
			offset = float2( 
				offset.x * vSinCos.y - offset.y * vSinCos.x, 
				offset.x * vSinCos.x + offset.y * vSinCos.y );
			Out.vPosition.xy += offset * float2( ProjectionMatrix[0][0], ProjectionMatrix[1][1] );
			Out.vColor = v.vColor;
			
			float2 tmpUV = float2( v.vUV0.x, 1.0f - v.vUV0.y );
			Out.vUV0 = HalfPixelWH_RowsCols.xy + ( v.vTile.xy + tmpUV ) / HalfPixelWH_RowsCols.zw - HalfPixelWH_RowsCols.xy * 2.0f * tmpUV;
			return Out;
		}
	]]

}


## Pixel Shaders

PixelShader = 
{
	MainCode PixelSimpleParticle
	[[
		float4 main( VS_OUTPUT_SIMPLEPARTICLE In ) : PDX_COLOR
		{
			float4 vColor = tex2D( DiffuseMap, In.vUV0 ) * In.vColor;
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

BlendState BlendStatePreAlphaBlend
{
	SourceBlend = "ONE"
	AlphaTest = no
	BlendEnable = yes
	DestBlend = "INV_SRC_ALPHA"
}

BlendState BlendStateAdditive
{
	SourceBlend = "SRC_ALPHA"
	AlphaTest = no
	BlendEnable = yes
	DestBlend = "ONE"
}

## Rasterizer States

## Depth Stencil States

## Effects

Effect ParticleAlphaBlend
{
	VertexShader = "VertexSimpleParticle"
	PixelShader = "PixelSimpleParticle"
}

Effect ParticlePreAlphaBlend
{
	VertexShader = "VertexSimpleParticle"
	BlendState = "BlendStatePreAlphaBlend"
	PixelShader = "PixelSimpleParticle"
}

Effect ParticleAdditive
{
	VertexShader = "VertexSimpleParticle"
	BlendState = "BlendStateAdditive"
	PixelShader = "PixelSimpleParticle"
}